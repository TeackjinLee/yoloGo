package com.myspring.yologaza.reservation.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.common.base.BaseController;
import com.myspring.yologaza.goods.service.GoodsService;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;
import com.myspring.yologaza.member.vo.MemberVO;
import com.myspring.yologaza.reservation.service.ReservationService;
import com.myspring.yologaza.reservation.vo.ReservationVO;
import com.myspring.yologaza.sms.service.certificationService;

@Controller("reservationController")
@RequestMapping(value="/reservation")
public class ReservationControllerImpl extends BaseController implements ReservationController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private ReservationService reservationService;
	
	@RequestMapping(value="/reservationForm.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView reservationForm(@RequestParam("goods_id") String goods_id, 
								HttpServletRequest request, 
								HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		Map goodsMap=goodsService.goodsDetail(goods_id);
		mav.addObject("goodsMap", goodsMap);
		GoodsVO goodsVO=(GoodsVO)goodsMap.get("goodsVO");
		mav.setViewName(viewName);
		
		
		long today = (System.currentTimeMillis()/1000) + 32400;
		Date date = new Date(System.currentTimeMillis()+32400000);
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		String todayDate = timeFormat.format(date);
		long date1 = 0;
		long date2 = 0;
		if(request.getParameter("date1") != null)
			date1 = Long.parseLong(request.getParameter("date1"));
		if(request.getParameter("date2") != null)
			date2 = Long.parseLong(request.getParameter("date2"));
		date1 = (date1/86400) * 86400;
		date2 = ((date2/86400) * 86400)+1;
		request.setAttribute("date1", date1);
		request.setAttribute("date2", date2);
		String Ddate1 = todayDate;
		String Ddate2 = todayDate;
		String Ddate3 = todayDate;
		String Ddate4 = todayDate;
		if(date1 != 0 && date2 != 0) {
			Ddate1 = timeFormat.format(date1*1000);
			Ddate2 = timeFormat.format(date2*1000);
			Ddate3 = timeFormat2.format(date1*1000);
			Ddate4 = timeFormat2.format(date2*1000);
		} else if( date1 == 0 && date2 == 1) {
			Ddate1 = timeFormat.format(today*1000);
			Ddate2 = timeFormat.format((today+86400)*1000);
			Ddate3 = timeFormat2.format(today*1000);
			Ddate4 = timeFormat2.format((today+86400)*1000);
		}
		request.setAttribute("Ddate1", Ddate1);
		request.setAttribute("Ddate2", Ddate2);
		request.setAttribute("Ddate3", Ddate3);
		request.setAttribute("Ddate4", Ddate4);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.POST)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) {
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		certificationService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		return Integer.toString(randomNumber);
	}
	
	@RequestMapping(value="/INIStdPay*.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView form(HttpServletRequest request, 
							HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/INIStdPayReturn.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView INIStdPayReturn(HttpServletRequest request, 
							HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		
		long today = (System.currentTimeMillis()/1000) + 32400;
		Date date = new Date(System.currentTimeMillis()+32400000);
		SimpleDateFormat timeFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		String todayDate = timeFormat.format(date);
		long date1 = 0;
		long date2 = 0;
		if(request.getParameter("date1") != null)
			date1 = Long.parseLong(request.getParameter("date1"));
		if(request.getParameter("date2") != null)
			date2 = Long.parseLong(request.getParameter("date2"));
		date1 = (date1/86400) * 86400;
		date2 = ((date2/86400) * 86400)+1;
		request.setAttribute("date1", date1);
		request.setAttribute("date2", date2);
		String Ddate1 = todayDate;
		String Ddate2 = todayDate;
		String Ddate3 = todayDate;
		String Ddate4 = todayDate;
		if(date1 != 0 && date2 != 0) {
			Ddate1 = timeFormat.format(date1*1000);
			Ddate2 = timeFormat.format(date2*1000);
			Ddate3 = timeFormat2.format(date1*1000);
			Ddate4 = timeFormat2.format(date2*1000);
		} else if( date1 == 0 && date2 == 1) {
			Ddate1 = timeFormat.format(today*1000);
			Ddate2 = timeFormat.format((today+86400)*1000);
			Ddate3 = timeFormat2.format(today*1000);
			Ddate4 = timeFormat2.format((today+86400)*1000);
		}
		request.setAttribute("Ddate1", Ddate1);
		request.setAttribute("Ddate2", Ddate2);
		request.setAttribute("Ddate3", Ddate3);
		request.setAttribute("Ddate4", Ddate4);
		return mav;
	}
	@Override
	@RequestMapping(value="/addReservation.do" ,method={RequestMethod.POST})
	public ResponseEntity addReservation( HttpServletRequest request, HttpServletResponse response)  throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String fileName=null;
		
		Map newGoodsMap = new HashMap();
		Enumeration enu=request.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=request.getParameter(name);
			newGoodsMap.put(name,value);
		}
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			reservationService.reservationResult(newGoodsMap);
			System.out.println("실행");
			message= "<script>";
			message += " alert('주문내역을 저장했습니다.');";
			message +=" location.href='"+request.getContextPath()+"/mypage/Mypage3.do';";
			message +=("</script>");
		}catch(Exception e) {
			System.out.println("Exception실행");
			message= "<script>";
			message += " alert('주문내역을 저장했습니다.');";
			message +=" location.href='"+request.getContextPath()+"/mypage/Mypage3.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	@Override
	@RequestMapping(value="/removeReservation.do" ,method = RequestMethod.POST)
	public ModelAndView removeCartGoods(@RequestParam("rid") int rid,
			                          HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		reservationService.removeReservation(rid);
		mav.setViewName("redirect:/mypage/Mypage3.do");
		return mav;
	}
}
