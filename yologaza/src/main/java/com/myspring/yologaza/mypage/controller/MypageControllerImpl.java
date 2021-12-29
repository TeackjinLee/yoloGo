package com.myspring.yologaza.mypage.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.CC.service.CC_Service;
import com.myspring.yologaza.CC.vo.Announce_VO;
import com.myspring.yologaza.board.service.BoardService;
import com.myspring.yologaza.board.vo.ArticleVO;
import com.myspring.yologaza.goods.service.GoodsService;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.member.service.MemberService;
import com.myspring.yologaza.member.vo.MemberVO;
import com.myspring.yologaza.mypage.service.MypageService;

@Controller("mypageController")
public class MypageControllerImpl implements MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageControllerImpl.class);
	private static final String MEMBER_IMAGE_REPO = "C:\\member\\member_image";
	@Autowired
	Announce_VO cc_VO;
	@Autowired
	private MypageService mypageService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	
	
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
	
	@Override
	@RequestMapping(value="/mypage/Mypage1.do" ,method = RequestMethod.GET)
	public ModelAndView Mypage1(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
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
	
	@Override
	@RequestMapping(value="/mypage/modifyMyInfo.do" ,method = RequestMethod.POST)
	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
			                 @RequestParam("value")  String value,
			               HttpServletRequest request, HttpServletResponse response)  throws Exception {
		Map<String,String> memberMap=new HashMap<String,String>();
		String val[]=null;
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("member");
		String  id=memberVO.getId();
		if(attribute.equals("email")){
			val=value.split(",");
			memberMap.put("email1",val[0]);
			memberMap.put("email2",val[1]);
		} else {
			memberMap.put(attribute,value);	
		}

		memberMap.put("id", id);
		
		//수정된 회원 정보를 다시 세션에 저장한다.
		memberVO=(MemberVO)mypageService.modifyMyInfo(memberMap);
		session.removeAttribute("member");
		session.setAttribute("member", memberVO);
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		message  = "mod_success";
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

}
