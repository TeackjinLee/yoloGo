package com.myspring.yologaza.main;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.admin.member.service.AdminMemberService;
import com.myspring.yologaza.board.service.BoardService;
import com.myspring.yologaza.common.base.BaseController;
import com.myspring.yologaza.common.file.Pagination;
import com.myspring.yologaza.member.controller.MemberControllerImpl;
import com.myspring.yologaza.member.service.MemberService;
import com.myspring.yologaza.member.vo.MemberVO;

@Controller("mainController")
@EnableAspectJAutoProxy
public class MainController{
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	MemberVO memberVO;
	@Autowired
	private BoardService boardService;
	@Autowired
	private AdminMemberService adminMemberService;
	

	@RequestMapping(value = {"/","/main.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView main(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
			String viewName = (String) request.getAttribute("viewName");
			List mainBoard = boardService.mainBoard();
			ModelAndView mav = new ModelAndView();
			mav.addObject("mainBoard", mainBoard);
			mav.setViewName(viewName);
			return mav;
	}
	
	@RequestMapping(value = {"/business_main.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView business_main(HttpServletRequest request,
								HttpServletResponse response) throws Exception{
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	@RequestMapping(value = {"/admin_main.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView admin_main(HttpServletRequest request,
								HttpServletResponse response) throws Exception{
		String auth = "1";
		//pagination
		Pagination pagination = new Pagination();
		pagination.setPage(1);
		pagination.setCountList(5);
		pagination.setCountPage(6);
		pagination.setTotalCount(adminMemberService.getAdminMemberDAO().getTotalCount());
		if(request.getParameter("pages") != null)
			pagination.setPage(Integer.parseInt(request.getParameter("pages")));
		if(request.getParameter("auth") != null)
			auth = request.getParameter("auth");
		request.setAttribute("auth", auth);
		int offset = (pagination.getPage()-1)*pagination.getCountList();
		pagination.Paging();
		String viewName = (String) request.getAttribute("viewName");
		List<MemberVO> membersList = adminMemberService.listMembersByAuth(auth, offset, pagination.getCountList());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		mav.addObject(pagination);
		return mav;
	}
}
