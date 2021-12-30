package com.myspring.yologaza.CC.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface CC_Controller {
	public ModelAndView announceList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView frequentList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewAnnounce(@RequestParam("articleNo") int articleNo,
            HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addQuestion(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	public ResponseEntity addAnnounce(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	public ResponseEntity addFrequent(MultipartHttpServletRequest multipartRequest,
			HttpServletResponse response) throws Exception;
	public ModelAndView questionList(HttpServletRequest Request, HttpServletResponse response) throws Exception;
	
}