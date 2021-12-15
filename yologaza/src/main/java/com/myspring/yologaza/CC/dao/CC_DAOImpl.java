package com.myspring.yologaza.CC.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.CC.vo.Announce_VO;

@Repository("cc_DAO")
public class CC_DAOImpl implements CC_DAO{
	@Autowired
	static CC_DAO cc_DAO;
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	int totalCount;
	
	public CC_DAOImpl() {
		
	}
	
	public CC_DAOImpl(SqlSessionFactory sqlSessionFactory) {
		this.sqlSessionFactory = sqlSessionFactory;
	}
	
	public int getTotalCount() {
		return totalCount;
	}
	
	@Override
	public List<Announce_VO> selectAnnounceList(int offset, int count) throws DataAccessException {
		List<Announce_VO> announceList = new ArrayList<Announce_VO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("count", count);
		
		try {
			announceList = session.selectList("mapper.CC.selectAnnounceList",params);
			this.totalCount = session.selectOne("mapper.CC.countAnnounce");
		}finally {
			session.close();
		}
		return announceList;
	}
	
	@Override
	public Announce_VO selectAnnounce(int articleNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.CC.selectAnnounce", articleNo);
	}
}