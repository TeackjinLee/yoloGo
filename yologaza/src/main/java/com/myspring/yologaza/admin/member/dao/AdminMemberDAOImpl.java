package com.myspring.yologaza.admin.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.member.vo.MemberVO;

@Repository("adminMemberDAO")
public class AdminMemberDAOImpl implements AdminMemberDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}
	
	@Override
	public List selectAllDeleteMemberList() throws DataAccessException {
		List<MemberVO> deleteMemberList = null;
		deleteMemberList = sqlSession.selectList("mapper.member.selectAllDeleteMemberList");
		return deleteMemberList;
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