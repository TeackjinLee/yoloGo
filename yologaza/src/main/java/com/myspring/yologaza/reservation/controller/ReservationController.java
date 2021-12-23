package com.myspring.yologaza.reservation.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myspring.yologaza.member.vo.MemberVO;
import com.myspring.yologaza.reservation.vo.ReservationVO;

public class ReservationController {
	 @RequestMapping(value = "/reservationView",method=RequestMethod.POST)
	  public String reservationView(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			  ReservationVO ReservationVO, Model model,int totalPrice,int totalVol) throws Exception{
		  List<ReservationVO> reservationList = new ArrayList<>(); 
		  /*
		  for(int i=0; i < (ReservationVO.getItem_no()).length; i++) {
			
			  ReservationVO VO = new ReservationVO();
			  VO.setreservation_item_img(ReservationVO.getItem_img()[i]);
			  VO.setreservation_item_name(ReservationVO.getItem_name()[i]);
			  VO.setreservation_item_option(ReservationVO.getItem_option()[i]);
			  VO.setreservation_item_price(ReservationVO.getItem_price()[i]);
			  VO.setreservation_option_no(ReservationVO.getOption_no()[i]);
			  VO.setreservation_item_no(ReservationVO.getItem_no()[i]);
			  VO.setreservation_select_vol(ReservationVO.getSelect_vol()[i]);
			  reservationList.add(VO);

		  }
		  
		  model.addAttribute("reservation", reservationList);
		  model.addAttribute("totalPrice", totalPrice);
		  model.addAttribute("totalVol", totalVol);
		  */
		  if(session.getAttribute("member") != null) {
		  	MemberVO memberVO = (MemberVO) session.getAttribute("member");
		  }
		  return "/reservationView";
	  }
}
