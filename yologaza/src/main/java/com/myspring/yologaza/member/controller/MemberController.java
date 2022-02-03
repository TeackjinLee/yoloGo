package com.myspring.yologaza.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.yologaza.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addMember(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeMember(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception;
	public ModelAndView quit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public String sendSMS(String userPhoneNumber);
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
						@RequestParam(value = "code", required = false) String code,
						RedirectAttributes rAttr, 
						HttpServletRequest request, 
						HttpServletResponse response) throws Exception;
}