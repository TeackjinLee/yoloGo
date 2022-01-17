package com.myspring.yologaza.admin.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.admin.member.dao.AdminMemberDAO;
import com.myspring.yologaza.member.vo.MemberVO;

public interface AdminMemberService {
	public AdminMemberDAO getAdminMemberDAO();
	public List<MemberVO> listMembers(String type, String query, String auth, long date1, long date2, int offset, int count) throws DataAccessException;
	public List<MemberVO> listMembersByAuth(String auth, int offset, int count) throws DataAccessException;
	public List<MemberVO> deletelistMembers(String type, String query, String auth, long date1, long date2, int offset, int count) throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public int removeMember(String id) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
	public String overlapped(String id) throws Exception;
	public List<MemberVO> findId(String hp)throws Exception;
	public int findIdCheck(String hp)throws Exception;
	
	public void findPw(String hp,String id, String pwd)throws Exception;
	public int findPwCheck(MemberVO memberVO)throws Exception;
	
}
