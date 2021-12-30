package com.myspring.yologaza.CC.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.CC.vo.Announce_VO;
import com.myspring.yologaza.CC.vo.Frequent_VO;
import com.myspring.yologaza.CC.vo.Question_VO;

@Repository("cc_DAO")
public class CC_DAOImpl implements CC_DAO{
	@Autowired
	static CC_DAO cc_DAO;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	int totalCount;
	int countPerId;
	
	public CC_DAOImpl() {
		
	}
	
	public CC_DAOImpl(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	public int getCountPerId() {
		return countPerId;
	}
	
	@Override
	public List<Announce_VO> selectAnnounceList(int auth, int offset, int count) throws DataAccessException {
		List<Announce_VO> announceList = new ArrayList<Announce_VO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("count", count);
		params.put("auth", auth);
		
		try {
			announceList = session.selectList("mapper.CC.selectAnnounceList",params);
			this.totalCount = session.selectOne("mapper.CC.countAnnounce");
		}finally {
			session.close();
		}
		return announceList;
	}
	
	@Override
	public List<Frequent_VO> selectFrequentList(int auth) throws DataAccessException{
		List<Frequent_VO> frequentList = sqlSession.selectList("mapper.CC.selectFrequentList", auth);
		return frequentList;
	}
	
	@Override
	public List<Question_VO> selectInPersonQuestion(int offset, int count, String id) throws DataAccessException{
		List<Question_VO> questionList = new ArrayList<Question_VO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("count", count);
		params.put("id", id);
		
		try {
			questionList = session.selectList("mapper.CC.selectInPersonQuestion",params);
			this.countPerId = session.selectOne("mapper.CC.countInPersonQuestion");
		}finally {
			session.close();
		}
		return questionList;
	}
	
	@Override
	public List<Question_VO> selectInPersonReply(List<Question_VO> questionList) throws DataAccessException {
		List<Question_VO> replyList = sqlSession.selectList("mapper.CC.selectInPersonReply", questionList);
		return replyList;
	}
	
	@Override
	public Announce_VO selectAnnounce(int articleNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.CC.selectAnnounce", articleNo);
	}
	
	@Override
	public int insertNewQuestion(Map questionMap) throws DataAccessException {
		int articleNo = selectNewArticleNoQuestion();
		questionMap.put("articleNo", articleNo);
		sqlSession.insert("mapper.CC.insertNewQuestion",questionMap);
		return articleNo;
	}
	
	@Override
	public int insertNewAnnounce(Map announceMap) throws DataAccessException {
		int articleNo = selectNewArticleNoAnnounce();
		announceMap.put("articleNo", articleNo);
		sqlSession.insert("mapper.CC.insertNewAnnounce",announceMap);
		return articleNo;
	}
	
	@Override
	public int insertNewFrequent(Map frequentMap) throws DataAccessException {
		int articleNo = selectNewArticleNoFrequent();
		frequentMap.put("articleNo", articleNo);
		sqlSession.insert("mapper.CC.insertNewFrequent",frequentMap);
		return articleNo;
	}
	
	private int selectNewArticleNoQuestion() throws DataAccessException {
		return sqlSession.selectOne("mapper.CC.selectNewArticleNoQuestion");
	}
	
	private int selectNewArticleNoAnnounce() throws DataAccessException {
		return sqlSession.selectOne("mapper.CC.selectNewArticleNoAnnounce");
	}
	
	private int selectNewArticleNoFrequent() throws DataAccessException {
		return sqlSession.selectOne("mapper.CC.selectNewArticleNoFrequent");
	}
}