package com.myspring.yologaza.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.member.vo.MemberVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
	public String overlapped(String id) throws Exception;
	public List<MemberVO> findId(MemberVO memberVO)throws Exception;
	public void findPw(String hp,String id, String pwd)throws Exception;
	public int findPwCheck(MemberVO memberVO)throws Exception;
	public int removeMember(String id) throws DataAccessException;
	public int addDeletedMember(Map deleteMap) throws DataAccessException;
}
