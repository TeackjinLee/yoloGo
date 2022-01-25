package com.myspring.yologaza.admin.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface AdminGoodsController {

	public ModelAndView listGoods(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ResponseEntity goodsAcess(@RequestParam("goods_id") int goods_id, @RequestParam("uid") int uid, HttpServletRequest Request, HttpServletResponse response) throws Exception;

}
