package com.myspring.yologaza.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.member.vo.MemberVO;

@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	int totalCount;
	
	public int getTotalCount() {
		return totalCount;
	}
	
	@Override
	public List<MemberVO> selectAllMemberList(String type, String query, String auth, long date1, long date2, int offset, int count) throws DataAccessException {
		List<MemberVO> membersList = new ArrayList<MemberVO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("query", query);
		params.put("auth", auth);
		params.put("date1", date1);
		params.put("date2", date2);
		params.put("offset", offset);
		params.put("count", count);
		
		try {
			membersList = session.selectList("mapper.member.selectAllMemberList",params);
			this.totalCount = session.selectOne("mapper.member.countAllMember");
		}finally {
			session.close();
		}
		return membersList;
	}
	
	@Override
	public List<MemberVO> selectAllMemberListByAuth(String auth, int offset, int count) throws DataAccessException {
		List<MemberVO> membersList = new ArrayList<MemberVO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("auth", auth);
		params.put("offset", offset);
		params.put("count", count);
		
		try {
			membersList = session.selectList("mapper.member.selectAllMemberListByAuth",params);
			this.totalCount = session.selectOne("mapper.member.countAllMember");
		}finally {
			session.close();
		}
		return membersList;
	}
	
	@Override
	public List<MemberVO> selectAllDeleteMemberList(String type, String query, String auth, long date1, long date2, int offset, int count) throws DataAccessException {
		List<MemberVO> membersList = new ArrayList<MemberVO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("type", type);
		params.put("query", query);
		params.put("auth", auth);
		params.put("date1", date1);
		params.put("date2", date2);
		params.put("offset", offset);
		params.put("count", count);
		
		try {
			membersList = session.selectList("mapper.member.selectAllDeleteMemberList",params);
			this.totalCount = session.selectOne("mapper.member.countAllMember");
		}finally {
			session.close();
		}
		return membersList;
	}
	
	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	@Override
	public int deleteMember(String id) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", id);
		return result;
	}
	
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.AdminloginById", memberVO);
		return vo;
	}
	
	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID",id);
		return result;
	}

	@Override
	public List<MemberVO> findId(String hp) throws Exception {
		List<MemberVO> result = sqlSession.selectList("mapper.member.findId", hp);
		return result;
	}

	@Override
	public int findIdCheck(String hp) throws Exception {
		int result = sqlSession.selectOne("mapper.member.findIdCheck", hp);
		return result;
	}
	
	@Override
	public int findPwCheck(MemberVO memberVO)throws Exception{
	return sqlSession.selectOne("mapper.member.findPwdCheck", memberVO);	
	}


	@Override
	public void findPw(String hp,String id,String pwd)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("hp", hp);
		map.put("id", id);
		map.put("pwd", pwd);
		sqlSession.update("mapper.member.findPwd", map);
	}

}