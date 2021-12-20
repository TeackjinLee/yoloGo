package com.myspring.yologaza.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;


import com.myspring.yologaza.member.vo.MemberVO;

public interface MemberDAO {
	public List selectAllMemberList() throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public int deleteMember(String id) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public List<MemberVO> findId(String hp)throws Exception;
	public int findIdCheck(String hp)throws Exception;
	
	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String id) throws DataAccessException;
}