package com.myspring.yologaza.reservation.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.reservation.vo.ReservationVO;

public interface ReservationDAO {

	public int insertReservation(Map newResMap) throws DataAccessException;

	public void deleteReservation(int rid) throws DataAccessException;

	public List<ReservationVO> reservationCheck(ReservationVO reservationVO) throws DataAccessException;

	public int business_point(Map newGoodsMap) throws DataAccessException;

	public int cancel_point(Map newGoodsMap) throws DataAccessException;

}
