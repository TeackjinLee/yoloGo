package com.myspring.yologaza.business.goods.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.maven.model.Model;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.goods.vo.GoodsVO;

public interface BusinessGoodsController {
	public ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;

	public ResponseEntity addNewGoodsRoom(@RequestParam("goods_id") int goods_id, MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;

	public ModelAndView viewNewGoods(@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	public ResponseEntity modGoods(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

}
