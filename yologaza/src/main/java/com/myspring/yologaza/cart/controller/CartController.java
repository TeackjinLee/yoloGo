package com.myspring.yologaza.cart.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public @ResponseBody String addGoodsInCart(@RequestParam("goods_uroom") int goods_uroom,
												@RequestParam("price") double price, 
												@RequestParam("checkIn") String checkIn,
												@RequestParam("checkOut") String checkOut,
												HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public  @ResponseBody String modifyCartQty(@RequestParam("goods_uroom") int goods_uroom,@RequestParam("cart_goods_qty") int cart_goods_qty,
			                  HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ModelAndView removeCartGoods(@RequestParam("cart_uid") int cart_uid,HttpServletRequest request, HttpServletResponse response)  throws Exception;
}
