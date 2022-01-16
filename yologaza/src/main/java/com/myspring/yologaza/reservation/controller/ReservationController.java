package com.myspring.yologaza.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;

public interface ReservationController {

	public String sendSMS(String userPhoneNumber);

	public ResponseEntity addReservation(HttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

}
