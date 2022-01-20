package com.myspring.yologaza.mypage.service;

import java.util.List;
import java.util.Map;

import com.myspring.yologaza.member.vo.MemberVO;
import com.myspring.yologaza.reservation.vo.ReservationVO;

public interface MypageService {
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception;
	public MemberVO myDetailInfo(String id) throws Exception;
	public void modImgMember(Map memberImgMap) throws Exception;
	public List<ReservationVO> mypageReservation(String hp) throws Exception;
	public List<ReservationVO> nonReservation(ReservationVO reservationVO) throws Exception;
}
