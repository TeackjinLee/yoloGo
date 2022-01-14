package com.myspring.yologaza.reservation.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.reservation.dao.ReservationDAO;

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
	
}
