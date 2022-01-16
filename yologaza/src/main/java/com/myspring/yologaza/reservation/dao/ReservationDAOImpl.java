package com.myspring.yologaza.reservation.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("reservationDAO")
public class ReservationDAOImpl implements ReservationDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertReservation(Map newResMap) throws DataAccessException {
		sqlSession.insert("mapper.reservation.insertReservation",newResMap);
		return Integer.parseInt((String)newResMap.get("rid"));
	}
}
