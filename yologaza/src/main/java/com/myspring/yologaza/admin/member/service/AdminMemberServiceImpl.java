package com.myspring.yologaza.admin.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.admin.member.dao.AdminMemberDAO;
import com.myspring.yologaza.member.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("adminMemberService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService{
	private static final MemberVO String = null;
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	private MemberVO memberVO;
	
	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = adminMemberDAO.selectAllMemberList();
		return membersList;
	}
	
	@Override
	public List deletlistMembers() throws DataAccessException {
		List deleteMemberList = null;
		deleteMemberList = adminMemberDAO.selectAllDeleteMemberList();
		return deleteMemberList;
	}
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return adminMemberDAO.insertMember(member);
	}
	@Override
	public int removeMember(String id) throws DataAccessException {
		return adminMemberDAO.deleteMember(id);
	}
	@Override
	public MemberVO login(MemberVO memberVO) {
		return adminMemberDAO.loginById(memberVO);
	}
	@Override
	public String overlapped(String id) throws Exception{
		return adminMemberDAO.selectOverlappedID(id);
	}
	@Override
	public List<MemberVO> findId(String hp) throws Exception {
		return adminMemberDAO.findId(hp);
	}
	@Override
	public int findIdCheck(String hp) throws Exception {
		return  adminMemberDAO.findIdCheck(hp);
	}
	
	@Override
	public int findPwCheck(MemberVO memberVO)throws Exception{
		return adminMemberDAO.findPwCheck(memberVO);
	}
    
    @Override
	public void findPw(String hp,String id, String pwd)throws Exception{
    	adminMemberDAO.findPw(hp, id, pwd);
	}

}
