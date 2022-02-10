package com.myspring.yologaza.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.reservation.vo.ReservationVO;

public interface GoodsController {
	public ModelAndView listArticles(@RequestParam("goods_id") String goods_id, ReservationVO reservationVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchGoods(GoodsVO goodsVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchWorld(@RequestParam("searchWord") String searchWord, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	
}
