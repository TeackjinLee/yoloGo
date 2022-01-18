package com.myspring.yologaza.mypage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.board.vo.ArticleVO;
import com.myspring.yologaza.member.vo.MemberVO;
import com.myspring.yologaza.mypage.dao.MypageDAO;
import com.myspring.yologaza.reservation.vo.ReservationVO;

@Service("mypageService")
@Transactional(propagation = Propagation.REQUIRED)
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageDAO mypageDAO;
	
	public MemberVO  modifyMyInfo(Map memberMap) throws Exception{
		 String id=(String)memberMap.get("id");
		 mypageDAO.updateMyInfo(memberMap);
		 return mypageDAO.selectMyDetailInfo(id);
	}
	
	public MemberVO myDetailInfo(String id) throws Exception{
		return mypageDAO.selectMyDetailInfo(id);
	}
	
	@Override
	public void modImgMember(Map memberImgMap) throws Exception {
		mypageDAO.updateMember(memberImgMap);
	}
	
	@Override
	public List<ReservationVO> mypageReservation(String hp) throws Exception{
		List<ReservationVO> mypageReservation = mypageDAO.mypageReservation(hp);
		return mypageReservation;
	}
	
	@Override
	public List<ReservationVO> nonReservation(ReservationVO reservationVO)throws Exception{
		return mypageDAO.nonReservation(reservationVO);
	}
	
}
