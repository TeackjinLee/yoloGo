package com.myspring.yologaza.reservation.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ReservationController {

	public String sendSMS(String userPhoneNumber);

	public ResponseEntity addReservation(HttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

	public ModelAndView removeCartGoods(@RequestParam("rid") int rid, HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView INIStdPayReturn(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView reservationForm(@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;

}
