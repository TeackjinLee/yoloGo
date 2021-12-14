package com.myspring.yologaza.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface GoodsController {

	public ModelAndView searchGoods(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
