package com.myspring.yologaza.admin.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.member.vo.MemberVO;

public interface AdminMemberDAO {
	public int getTotalCount();
	public List<MemberVO> selectAllMemberList(String type, String query, String auth, long date1, long date2, int offset, int count) throws DataAccessException;
	public List<MemberVO> selectAllMemberListByAuth(String auth, int offset, int count) throws DataAccessException;
	public List<MemberVO> selectAllDeleteMemberList(String type, String query, String auth, long date1, long date2, int offset, int count) throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public int deleteMember(String id) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public List<MemberVO> findId(String hp)throws Exception;
	public int findIdCheck(String hp)throws Exception;
	
	public int findPwCheck(MemberVO memberVO)throws Exception; 
	public void findPw(String hp,String id,String pwd)throws Exception;
	
}