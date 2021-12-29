package com.myspring.yologaza.mypage.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.member.vo.MemberVO;


public interface MypageDAO {

	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;

}