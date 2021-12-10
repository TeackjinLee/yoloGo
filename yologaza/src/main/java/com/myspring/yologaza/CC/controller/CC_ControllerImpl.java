package com.myspring.yologaza.CC.controller;

import java.util.List;

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

@Controller("cc_Controller")
public class CC_ControllerImpl implements CC_Controller {
	private static final Logger logger = LoggerFactory.getLogger(CC_ControllerImpl.class);
	@Autowired
	private CC_Service cc_Service;
	@Autowired
	Announce_VO announce_VO;
	
	@Override
	@RequestMapping(value= "/CC/announceList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView announceList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List announceList = cc_Service.listAnnounce();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("announceList", announceList);
		return mav;
	}
	
	@RequestMapping(value="/CC/*Form.do", method=RequestMethod.GET)
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
	
	@RequestMapping(value="/CC/viewAnnounce.do" ,method = RequestMethod.GET)
	public ModelAndView viewAnnounce(@RequestParam("articleNo") int articleNo,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		announce_VO=cc_Service.viewAnnounce(articleNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("announce", announce_VO);
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
