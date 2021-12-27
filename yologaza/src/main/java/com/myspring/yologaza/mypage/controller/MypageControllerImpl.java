package com.myspring.yologaza.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.CC.service.CC_Service;
import com.myspring.yologaza.CC.vo.Announce_VO;
import com.myspring.yologaza.board.service.BoardService;
import com.myspring.yologaza.goods.service.GoodsService;
import com.myspring.yologaza.goods.vo.GoodsVO;

@Controller("mypage_Controller")
public class MypageControllerImpl implements MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageControllerImpl.class);
	@Autowired
	private CC_Service cc_Service;
	@Autowired
	Announce_VO cc_VO;
	@Autowired
	private BoardService boardService;
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value="/mypage/*.do", method=RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="result", required=false) String result,
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
	
	@RequestMapping(value="/mypage/Mypage4.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView Mypage4(
					HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		List articlesList = boardService.listArticles();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);

		return mav;
	}

}
