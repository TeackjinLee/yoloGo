package com.myspring.yologaza.mypage.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.member.vo.MemberVO;
import com.myspring.yologaza.reservation.vo.ReservationVO;


public interface MypageDAO {

	public void updateMyInfo(Map memberMap) throws DataAccessException;
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException;
	public void updateMember(Map memberImgMap) throws DataAccessException;
	public List mypageReservation(String hp) throws DataAccessException;
	public List nonReservation(ReservationVO reservationVO) throws Exception;

}