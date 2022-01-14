package com.myspring.yologaza.reservation.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface ReservationDAO {

	public int insertReservation(Map newResMap) throws DataAccessException;

}
