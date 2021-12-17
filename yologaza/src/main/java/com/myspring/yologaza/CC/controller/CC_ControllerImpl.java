package com.myspring.yologaza.CC.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.CC.service.CC_Service;
import com.myspring.yologaza.CC.vo.Announce_VO;
import com.myspring.yologaza.CC.vo.Question_VO;
import com.myspring.yologaza.common.file.Pagination;
import com.myspring.yologaza.member.vo.MemberVO;

@Controller("cc_Controller")
public class CC_ControllerImpl implements CC_Controller {
	private static final Logger logger = LoggerFactory.getLogger(CC_ControllerImpl.class);
	@Autowired
	private CC_Service cc_Service;
	Announce_VO announce_VO;
	Question_VO question_VO;
	
	@Override
	@RequestMapping(value= "/CC/announceList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView announceList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//pagination
		Pagination pagination = new Pagination();
		pagination.setPage(1);
		pagination.setCountList(5);
		pagination.setCountPage(6);
		pagination.setTotalCount(cc_Service.getCC_DAO().getTotalCount());
		if(request.getParameter("pages") != null)
			pagination.setPage(Integer.parseInt(request.getParameter("pages")));
		int offset = (pagination.getPage()-1)*pagination.getCountList();
		pagination.Paging();
		String viewName = (String)request.getAttribute("viewName");
		List announceList = cc_Service.listAnnounce(offset, pagination.getCountList());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("announceList", announceList);
		mav.addObject(pagination);
		return mav;
	}
	
	@RequestMapping(value= "/CC/frequentList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView frequentList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		List frequentList = cc_Service.listFrequent();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("frequentList", frequentList);
		return mav;
	}
	
	@RequestMapping(value= "/CC/inPersonQuestion.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView questionList(HttpServletRequest Request, HttpServletResponse response) throws Exception {
		Pagination pagination = new Pagination();
		pagination.setPage(1);
		pagination.setCountList(5);
		pagination.setCountPage(6);
		pagination.setTotalCount(cc_Service.getCC_DAO().getCountPerId());
		if(Request.getParameter("pages") != null)
			pagination.setPage(Integer.parseInt(Request.getParameter("pages")));
		int offset = (pagination.getPage()-1)*pagination.getCountList();
		pagination.Paging();
		HttpSession session = Request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		String viewName = (String)Request.getAttribute("viewName");
		List questionList = cc_Service.listQuestion(offset, pagination.getCountList(), id);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("questionList", questionList);
		mav.addObject(pagination);
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
	
	@Override
	@RequestMapping(value={"/CC/addQuestion.do"}, method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addQuestion(MultipartHttpServletRequest multipartRequest,
										HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		articleMap.put("parentNO", 0);
		articleMap.put("id", id);
		articleMap.put("auth", 1);
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
				cc_Service.addQuestion(articleMap);
				message = "<script>";
				message += " alert('새글을 추가했습니다.');";
				message += "location.href='"+multipartRequest.getContextPath()+"/CC/inPersonQuestion.do'; ";
				message +=" </script>";
				 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				message = " <script>";
				message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
				message +=" location.href='"+multipartRequest.getContextPath()+"/CC/questionForm.do'; ";
				message +=" </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
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
