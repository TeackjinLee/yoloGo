package com.myspring.yologaza.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.goods.vo.GoodsVO;

public interface GoodsController {
	public ModelAndView listArticles(String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView searchGoods(GoodsVO goodsVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView kewordSearchGoods(@RequestParam("searchWord") String searchWord, GoodsVO goodsVO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
