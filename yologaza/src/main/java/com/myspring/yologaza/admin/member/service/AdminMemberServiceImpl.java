package com.myspring.yologaza.admin.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.admin.member.dao.AdminMemberDAO;
import com.myspring.yologaza.member.vo.MemberVO;

@Service("adminMemberService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService{
	private static final MemberVO String = null;
	@Autowired
	private AdminMemberDAO adminMemberDAO;
	private MemberVO memberVO;
	
	@Override
	public AdminMemberDAO getAdminMemberDAO() {
		return adminMemberDAO;
	}
	
	@Override
	public List<MemberVO> listMembers(String type, String query, String auth, long date1, long date2, int offset, int count) throws DataAccessException {
		return adminMemberDAO.selectAllMemberList(type, query, auth, date1, date2, offset, count);
	}
	
	@Override
	public List<MemberVO> listMembersByAuth(String auth, int offset, int count) throws DataAccessException {
		return adminMemberDAO.selectAllMemberListByAuth(auth, offset, count);
	}
	
	@Override
	public List<MemberVO> deletelistMembers(String type, String query, String auth, long date1, long date2, int offset, int count) throws DataAccessException {
		return adminMemberDAO.selectAllDeleteMemberList(type, query, auth, date1, date2, offset, count);
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
