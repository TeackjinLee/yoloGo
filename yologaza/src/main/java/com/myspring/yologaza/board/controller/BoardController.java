package com.myspring.yologaza.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface BoardController {
	public ResponseEntity addNewArticle(@RequestParam("goods_id") String goods_id, MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	public ResponseEntity addReply(@RequestParam("goods_id") String goods_id, MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO, HttpServletRequest request, HttpServletResponse response)throws Exception;
}
