package com.myspring.yologaza.reservation.service;

import java.util.List;
import java.util.Map;

import com.myspring.yologaza.reservation.vo.ReservationVO;

public interface ReservationService {

	public int reservationResult(Map newResMap) throws Exception;

	public void removeReservation(int rid) throws Exception;

	public List<ReservationVO> reservationCheck(ReservationVO reservationVO) throws Exception;

	public int business_point(Map newGoodsMap) throws Exception;

	public int cancel_point(Map newGoodsMap) throws Exception;

}
