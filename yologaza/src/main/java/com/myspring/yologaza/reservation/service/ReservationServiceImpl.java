package com.myspring.yologaza.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;
import com.myspring.yologaza.reservation.dao.ReservationDAO;
import com.myspring.yologaza.reservation.vo.ReservationVO;

@Service("reservationService")
@Transactional(propagation=Propagation.REQUIRED)
public class ReservationServiceImpl implements ReservationService {
	@Autowired
	private ReservationDAO reservationDAO;
	
	@Override
	public int reservationResult(Map newResMap) throws Exception{
		int rid = reservationDAO.insertReservation(newResMap);
		return rid;
	}
	
	@Override
	public void removeReservation(int rid) throws Exception{
		reservationDAO.deleteReservation(rid);
	}
	
	@Override
	public List<ReservationVO> reservationCheck(ReservationVO reservationVO) throws Exception {
		return reservationDAO.reservationCheck(reservationVO);
	}
	
	@Override
	public int business_point(Map newGoodsMap) throws Exception{
		int goods_id = reservationDAO.business_point(newGoodsMap);
		return goods_id; 
	}
	
	@Override
	public int cancel_point(Map newGoodsMap) throws Exception{
		int goods_id = reservationDAO.cancel_point(newGoodsMap);
		return goods_id; 
	}
}
