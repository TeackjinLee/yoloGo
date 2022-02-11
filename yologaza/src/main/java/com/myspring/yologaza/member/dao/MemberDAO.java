package com.myspring.yologaza.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;


import com.myspring.yologaza.member.vo.MemberVO;

public interface MemberDAO {
	public List selectAllMemberList() throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public List<MemberVO> findId(MemberVO memberVO)throws Exception;
	public int findPwCheck(MemberVO memberVO)throws Exception; 
	public void findPw(String hp,String id,String pwd)throws Exception;
	public int deleteMember(String id) throws DataAccessException;
	public int updateDeletedMember(Map deleteMap) throws DataAccessException;
}