package com.myspring.yologaza.admin.member.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.myspring.yologaza.common.file.Pagination;
import com.myspring.yologaza.member.vo.MemberVO;

@Controller("AdminMemberController")
@RequestMapping(value="/admin/member")
public class AdminMemberControllerImpl  extends BaseController implements AdminMemberController {
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private AdminMemberService adminMemberService;
	
	@RequestMapping(value = {"/listMember.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView listMember(HttpServletRequest request,
								HttpServletResponse response) throws Exception{
		//pagination
		Pagination pagination = new Pagination();
		pagination.setPage(1);
		pagination.setCountList(10);
		pagination.setCountPage(5);
		if(request.getParameter("pages") != null)
			pagination.setPage(Integer.parseInt(request.getParameter("pages")));
		int offset = (pagination.getPage()-1)*pagination.getCountList();
		//time (date = long type / Ddate = MM/dd/yyyy date type)
		long today = (System.currentTimeMillis()/1000) + 32400;
		Date date = new Date(System.currentTimeMillis()+32400000);
		SimpleDateFormat timeFormat = new SimpleDateFormat("MM/dd/yyyy");
		String todayDate = timeFormat.format(date);
		long today1 = (today/86400) * 86400;
		long today2 = (((today/86400)+1) * 86400);
		long date1 = 0;
		long date2 = 0;
		if(request.getParameter("date1") != null)
			date1 = Long.parseLong(request.getParameter("date1"));
		if(request.getParameter("date2") != null)
			date2 = Long.parseLong(request.getParameter("date2"));
		date1 = (date1/86400) * 86400;
		date2 = ((date2/86400) * 86400);
		request.setAttribute("date1", date1);
		request.setAttribute("date2", date2);
		String Ddate1 = todayDate;
		String Ddate2 = todayDate;
		if(date1 != 0 && date2 != 0) {
			Ddate1 = timeFormat.format(date1*1000);
			Ddate2 = timeFormat.format(date2*1000);
		}
		request.setAttribute("Ddate1", Ddate1);
		request.setAttribute("Ddate2", Ddate2);
		//auth
		String auth = "";
		auth = request.getParameter("auth");
		request.setAttribute("auth", auth);
		//query
		String query = "";
		query = request.getParameter("query");
		request.setAttribute("query", query);
		//type
		String type = "";
		type = request.getParameter("type");
		request.setAttribute("type", type);
		String viewName = (String) request.getAttribute("viewName");
		List<MemberVO> membersList = adminMemberService.listMembers(type, query, auth, date1, date2, offset, pagination.getCountList());
		pagination.setTotalCount(adminMemberService.getAdminMemberDAO().getTotalCount());
		pagination.Paging();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		mav.addObject(pagination);
		mav.addObject("today1", today1);
		mav.addObject("today2", today2);
		return mav;
	}
	@RequestMapping(value = {"/deleteMemberList.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView deleteMemberList(HttpServletRequest request,
								HttpServletResponse response) throws Exception{
		//pagination
		Pagination pagination = new Pagination();
		pagination.setPage(1);
		pagination.setCountList(10);
		pagination.setCountPage(5);
		if(request.getParameter("pages") != null)
			pagination.setPage(Integer.parseInt(request.getParameter("pages")));
		int offset = (pagination.getPage()-1)*pagination.getCountList();
		//time (date = long type / Ddate = MM/dd/yyyy date type)
		long today = (System.currentTimeMillis()/1000) + 32400;
		Date date = new Date(System.currentTimeMillis()+32400000);
		SimpleDateFormat timeFormat = new SimpleDateFormat("MM/dd/yyyy");
		String todayDate = timeFormat.format(date);
		long today1 = (today/86400) * 86400;
		long today2 = (((today/86400)+1) * 86400);
		long date1 = 0;
		long date2 = 0;
		if(request.getParameter("date1") != null)
			date1 = Long.parseLong(request.getParameter("date1"));
		if(request.getParameter("date2") != null)
			date2 = Long.parseLong(request.getParameter("date2"));
		date1 = (date1/86400) * 86400;
		date2 = ((date2/86400) * 86400);
		request.setAttribute("date1", date1);
		request.setAttribute("date2", date2);
		String Ddate1 = todayDate;
		String Ddate2 = todayDate;
		if(date1 != 0 && date2 != 0) {
			Ddate1 = timeFormat.format(date1*1000);
			Ddate2 = timeFormat.format(date2*1000);
		}
		request.setAttribute("Ddate1", Ddate1);
		request.setAttribute("Ddate2", Ddate2);
		//auth
		String auth = "";
		auth = request.getParameter("auth");
		request.setAttribute("auth", auth);
		//query
		String query = "";
		query = request.getParameter("query");
		request.setAttribute("query", query);
		//type
		String type = "";
		type = request.getParameter("type");
		request.setAttribute("type", type);
		String viewName = (String) request.getAttribute("viewName");
		List<MemberVO> deleteMemberList = adminMemberService.deletelistMembers(type, query, auth, date1, date2, offset, pagination.getCountList());
		pagination.setTotalCount(adminMemberService.getAdminMemberDAO().getTotalCount());
		pagination.Paging();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("deleteMemberList", deleteMemberList);
		mav.addObject(pagination);
		mav.addObject("today1", today1);
		mav.addObject("today2", today2);
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
	
	@RequestMapping(value = {"/loginForm.do", "/logoutForm.do"}, method= {RequestMethod.POST, RequestMethod.GET} )
	//@RequestMapping(value="/member/*Form.do", method=RequestMethod.GET)
	public ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member,
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
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin_main.do");
		return mav;
	}
	
	@RequestMapping(value="/*Form.do", method={RequestMethod.POST,RequestMethod.GET})
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
