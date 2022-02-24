package com.myspring.yologaza.main;

import java.util.List;

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
import com.myspring.yologaza.business.goods.service.BusinessGoodsService;
import com.myspring.yologaza.common.file.Pagination;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.member.controller.MemberControllerImpl;
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
	@Autowired
	private BusinessGoodsService businessGoodsService;
	

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
		Pagination pagination = new Pagination();
		pagination.setPage(1);
		pagination.setCountList(10);
		pagination.setCountPage(5);
		if(request.getParameter("pages") != null)
			pagination.setPage(Integer.parseInt(request.getParameter("pages")));
		int offset = (pagination.getPage()-1)*pagination.getCountList();
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView(viewName);
		if(memberVO != null) {
			String uid = memberVO.getUid();
			List<GoodsVO> selectReservationBusinessMain = businessGoodsService.selectReservationBusinessMain(offset, pagination.getCountList(), uid);
			List selectReservationCount = businessGoodsService.selectReservationCountBusinessMain(uid);
			pagination.setTotalCount(businessGoodsService.getBusinessGoodsDAO().getTotalCount());
			pagination.Paging();
			mav.addObject("selectReservationCount", selectReservationCount);
			mav.addObject("selectReservationBusinessMain", selectReservationBusinessMain);
			mav.addObject(pagination);
		}
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
		if(request.getParameter("pages") != null)
			pagination.setPage(Integer.parseInt(request.getParameter("pages")));
		if(request.getParameter("auth") != null)
			auth = request.getParameter("auth");
		request.setAttribute("auth", auth);
		int offset = (pagination.getPage()-1)*pagination.getCountList();
		String viewName = (String) request.getAttribute("viewName");
		List<MemberVO> membersList = adminMemberService.listMembersByAuth(auth, offset, pagination.getCountList());
		pagination.setTotalCount(adminMemberService.getAdminMemberDAO().getTotalCount());
		pagination.Paging();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		mav.addObject(pagination);
		return mav;
	}
}
