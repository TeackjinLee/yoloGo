package com.myspring.yologaza.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.member.dao.MemberDAO;
import com.myspring.yologaza.member.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	private static final MemberVO String = null;
	@Autowired
	private MemberDAO memberDAO;
	private MemberVO memberVO;
	
	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}
	@Override
	public MemberVO login(MemberVO memberVO) {
		return memberDAO.loginById(memberVO);
	}
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}
	@Override
	public List<MemberVO> findId(String hp) throws Exception {
		return memberDAO.findId(hp);
	}
	@Override
	public int findIdCheck(String hp) throws Exception {
		return  memberDAO.findIdCheck(hp);
	}
	
	@Override
	public int findPwCheck(MemberVO memberVO)throws Exception{
		return memberDAO.findPwCheck(memberVO);
	}
    
    @Override
	public void findPw(String hp,String id, String pwd)throws Exception{
    	memberDAO.findPw(hp, id, pwd);
	}

}
