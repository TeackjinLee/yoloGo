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
	public ResponseEntity addNewGoods(MultipartHttpServletRequest multipartRequest,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity addNewGoodsRoom(@RequestParam("goods_id") int goods_id, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView viewNewGoods(@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modGoods(@RequestParam("goods_id") int goods_id, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

	public void removeGoodsImage(@RequestParam("goods_id") int goods_id,
									@RequestParam("goods_uimg") int goods_uimg,
									@RequestParam("fileName") String fileName, HttpServletRequest request,
									HttpServletResponse response) throws Exception;

	public void modifyGoodsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public void addNewGoodsImage(@RequestParam("goods_id") int goods_id, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView viewNewGoodsRoom(@RequestParam("goods_id") String goods_id, @RequestParam("goods_uroom") String goods_uroom, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listGoods(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView listRoom(@RequestParam("goods_id") String goods_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modRoom(@RequestParam("goods_id") int goods_id,@RequestParam("goods_uroom") int goods_uroom, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
