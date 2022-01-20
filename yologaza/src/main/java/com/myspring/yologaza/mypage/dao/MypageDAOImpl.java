package com.myspring.yologaza.mypage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.board.vo.ArticleVO;
import com.myspring.yologaza.member.vo.MemberVO;
import com.myspring.yologaza.reservation.vo.ReservationVO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void updateMyInfo(Map memberMap) throws DataAccessException{
		sqlSession.update("mapper.member.updateMyInfo",memberMap);
	}
	@Override
	public MemberVO selectMyDetailInfo(String id) throws DataAccessException{
		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.member.selectMyDetailInfo",id);
		return memberVO;
	}
	
	@Override
	public void updateMember(Map memberImgMap) throws DataAccessException {
		sqlSession.update("mapper.member.updateImgMember", memberImgMap);
	}
	
	@Override
	public List mypageReservation(String hp) throws DataAccessException{
		List<ReservationVO> reservation=sqlSession.selectList("mapper.reservation.mypageSelectReservation", hp);
		return reservation;
	}
	
	@Override
	public List nonReservation(ReservationVO reservationVO)throws Exception{
	return sqlSession.selectList("mapper.reservation.nonReservation", reservationVO);	
	}
}