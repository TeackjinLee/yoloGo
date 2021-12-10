package com.myspring.yologaza.CC.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface CC_Controller {
	public ModelAndView announceList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}