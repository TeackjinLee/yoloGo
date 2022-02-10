package com.myspring.yologaza.member.controller;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.yologaza.common.interceptor.ViewNameInterceptor;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.loginApi.service.KakaoService;
import com.myspring.yologaza.member.service.MemberService;
import com.myspring.yologaza.member.vo.MemberVO;
import com.myspring.yologaza.sms.service.certificationService;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl extends ViewNameInterceptor implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	MemberVO memberVO;
	@Autowired
	private KakaoService kakaoService;
	@Override
	@RequestMapping(value="/listMembers.do", method=RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		String viewName = (String)request.getAttribute("viewName");
		
		//System.out.println("info 레벨 : viewName = " + viewName);
		//logger.info("info 레벨 : viewName = " + viewName);
		//logger.debug("debug 레벨 : viewName = " + viewName);
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	@Override
	@RequestMapping(value="/addMember.do", method=RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			
			memberService.addMember(_memberVO);
			message = "<script>";
			message += " alert('YOLO가자!에 오신것을 환영합니다.');";
			message += " location.href='"+request.getContextPath()+"/member/loginForm.do';";
			message += " </script>";
		}catch(Exception e) {
			message = "<script>";
			message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='"+request.getContextPath()+"/admin_main.do';";
			message += " </script>";
			e.printStackTrace();
		}

		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
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
		memberVO = memberService.login(member);
		if(memberVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member", memberVO);
			session.setAttribute("isLogOn", true);
			String action = (String)session.getAttribute("action");
			session.removeAttribute("action");
			if(action != null) {
				mav.setViewName("redirect:action");
			} else {
				mav.setViewName("redirect:/main.do");
			}
		} else if(member.getId() == null || member.getId() == "") {
			rAttr.addAttribute("result", "idFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		} else if(member.getPwd() == null || member.getPwd() == "" ) {
			rAttr.addAttribute("result", "PwdFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
		return mav;
	}
	
	// kakaoLogin
	@Override
	@RequestMapping(value="/kakaologin", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView login(@ModelAttribute("member") MemberVO member,
    						@RequestParam(value = "code", required = false) String code,
    						RedirectAttributes rAttr,
							HttpServletRequest request, 
							HttpServletResponse response) throws Exception {
	 ModelAndView mav = new ModelAndView();
	 System.out.println("code: " + code); 
	 String access_token = kakaoService.getAccessToken(code); 
	 System.out.println("access_token" + access_token); 
	 HashMap<String,Object> userInfo = kakaoService.getUserInfo(access_token); 
	 
	 System.out.println(userInfo);
	 HttpSession session = request.getSession();
	 
	 if(userInfo != null) {
	        session.setAttribute("member", userInfo);
			session.setAttribute("isLogOn", true);
			String action = (String)session.getAttribute("action");
			session.removeAttribute("action");
			if(action != null) {
				mav.setViewName("redirect:action");
			} else {
				mav.setViewName("redirect:/main.do");
			}
		} else if(userInfo.get("id") == null || userInfo.get("id") == "") {
			rAttr.addAttribute("result", "idFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		} else {
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/member/loginForm.do");
		}
	 	System.out.println("###access_Token#### : " + access_token);
		System.out.println("###nickname#### : " + userInfo.get("name"));
		System.out.println("###email#### : " + userInfo.get("email"));
	 return mav;

    }

	@Override
	@RequestMapping(value = "/logout.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView logout(HttpServletRequest request,
								HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main.do");
		return mav;
	}
	
	// 아이디 찾기
	@RequestMapping(value="/findIdView", method=RequestMethod.GET)
	public ModelAndView findIdView(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public ModelAndView findId(MemberVO memberVO, Model model,
							HttpServletRequest request, HttpServletResponse response) throws Exception{
		String name = memberVO.getName();
		String hp = memberVO.getHp();
		List<MemberVO> member = memberService.findId(memberVO);
		if(name == null || name == "") {
			model.addAttribute("msg", "이름을 확인해주세요.");
			ModelAndView mav = new ModelAndView("/member/findIdView");
			return mav;
		} else if(hp == null || hp == ""){
			model.addAttribute("msg", "핸드폰번호를 확인해주세요.");
			ModelAndView mav = new ModelAndView("/member/findIdView");
			return mav;
		} else if(member==null) {
			model.addAttribute("msg", "가입된 아이디가 아닙니다.");
			ModelAndView mav = new ModelAndView("/member/findIdView");
			return mav;
		} else {
			model.addAttribute("member", memberService.findId(memberVO));
			ModelAndView mav = new ModelAndView("/member/findId");
			return mav;
		}
	}
	
	// 비밀번호 재설정
	@RequestMapping(value="/findPwView" , method=RequestMethod.GET)
	public ModelAndView findPwView(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
		
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public String findPw(MemberVO memberVO,Model model) throws Exception{
		logger.info("memberPw"+memberVO.getId());
		
		if(memberService.findPwCheck(memberVO)==0) {
			logger.info("memberPWCheck");
			model.addAttribute("msg", "아이디와 연락처를 확인해주세요");
			
			return "/member/findPwView";
		}else {
		memberService.findPw(memberVO.getHp(),memberVO.getId(),memberVO.getPwd());
		return"/member/findPw";
		} 
	}
	
	@Override
	@RequestMapping(value="/removeMember.do", method = RequestMethod.POST)
	public ModelAndView removeMember(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)throws Exception{
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
		articleMap.put("id", id);
		memberService.removeMember(id);
		memberService.addDeletedMember(articleMap);
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView("redirect:/main.do");
		return mav;
	}
	
	@RequestMapping(value="/*Form.do", method={RequestMethod.POST,RequestMethod.GET})
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
	@RequestMapping(value= "/QuitForm.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView quit(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getId();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("id",id);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) {
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
		certificationService.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		return Integer.toString(randomNumber);
	}
		
}
