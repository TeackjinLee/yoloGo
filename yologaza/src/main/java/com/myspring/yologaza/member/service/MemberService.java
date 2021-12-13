package com.myspring.yologaza.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.member.vo.MemberVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public int removeMember(String id) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws DataAccessException;
	public String overlapped(String id) throws Exception;
	public List<MemberVO> findId(String hp)throws Exception;
	public int findIdCheck(String hp)throws Exception;
	public void certifiedhpNumber(String userhpNumber, int randomNumber)throws Exception;
}
