package com.myspring.yologaza.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.yologaza.admin.member.service.AdminMemberService;
import com.myspring.yologaza.common.base.BaseController;
import com.myspring.yologaza.member.service.MemberService;
import com.myspring.yologaza.member.vo.MemberVO;

@Controller("AdminMemberController")
@RequestMapping(value="/admin/member")
public class AdminMemberControllerImpl  extends BaseController implements AdminMemberController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private MemberService memberService;
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value = {"/listMember.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView listMember(HttpServletRequest request,
								HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		List membersList = adminMemberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	@RequestMapping(value = {"/deleteMemberList.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView deleteMemberList(HttpServletRequest request,
								HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		List deleteMemberList = adminMemberService.deletlistMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("deleteMemberList", deleteMemberList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/removeAdminMember.do", method=RequestMethod.GET)
	public ModelAndView removeAdminMember(@RequestParam("id") String id,
							HttpServletRequest request, 
							HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		adminMemberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/admin/member/listMember.do");
		return mav;
	}
	
	@RequestMapping(value = {"/adminloginForm.do", "/adminlogoutForm.do"}, method= {RequestMethod.POST, RequestMethod.GET} )
	//@RequestMapping(value="/member/*Form.do", method=RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/adminlogin.do", method = RequestMethod.POST)
	public ModelAndView adminlogin(@ModelAttribute("member") MemberVO member,
							RedirectAttributes rAttr,
							HttpServletRequest request, 
							HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = adminMemberService.login(member);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			String action = (String)session.getAttribute("action");
			session.removeAttribute("action");
			if(action != null) {
				mav.setViewName("redirect:action");
			} else {
				mav.setViewName("redirect:/admin_main.do");
			}
		} else if(member.getId() == null || member.getId() == "" ) {
			rAttr.addAttribute("result", "idFailed");
			mav.setViewName("redirect:/admin/member/admin_loginForm.do");
		} else if(member.getPwd() == null || member.getPwd() == "" ) {
			rAttr.addAttribute("result", "PwdFailed");
			mav.setViewName("redirect:/admin/member/admin_loginForm.do");
		}else if(member.getAuth() == null || member.getAuth() != "3" ) {
			rAttr.addAttribute("result", "AuthFailed");
			mav.setViewName("redirect:/admin/member/admin_loginForm.do");
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/admin/member/admin_loginForm.do");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/adminlogout.do", method = RequestMethod.GET)
	public ModelAndView adminlogout(HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin_main.do");
		return mav;
	}
	
	@RequestMapping(value="/admin*Form.do", method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView adminform(@RequestParam(value="result", required=false) String result,
							@RequestParam(value= "action", required=false) String action,
								HttpServletRequest request, 
								HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		
		int begin = 0;
		if(!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		String viewName = uri.substring(begin, end);
		if(viewName.indexOf(".")!=-1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if(viewName.lastIndexOf("/")!=-1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1),viewName.length());
		}
		return viewName;
	}

}