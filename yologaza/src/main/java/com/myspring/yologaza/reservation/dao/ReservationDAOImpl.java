package com.myspring.yologaza.reservation.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.reservation.vo.ReservationVO;

@Repository("reservationDAO")
public class ReservationDAOImpl implements ReservationDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertReservation(Map newResMap) throws DataAccessException {
		sqlSession.insert("mapper.reservation.insertReservation",newResMap);
		return Integer.parseInt((String)newResMap.get("rid"));
	}
	
	@Override
	public void deleteReservation(int rid) throws DataAccessException{
		sqlSession.delete("mapper.reservation.deleteReservation",rid);
	}
	
	@Override
	public List<ReservationVO> reservationCheck(ReservationVO reservationVO) throws DataAccessException {
		List<ReservationVO> reservationCheck=(ArrayList)sqlSession.selectList("mapper.reservation.reservationCheck", reservationVO);
		return reservationCheck;
	}
	
	@Override
	public int business_point(Map newGoodsMap) throws DataAccessException{
		sqlSession.update("mapper.member.business_point", newGoodsMap);
		return Integer.parseInt((String)newGoodsMap.get("goods_id"));
	}
	
	@Override
	public int cancel_point(Map newGoodsMap) throws DataAccessException{
		sqlSession.update("mapper.member.cancel_point", newGoodsMap);
		return Integer.parseInt((String)newGoodsMap.get("goods_id"));
	}
}
