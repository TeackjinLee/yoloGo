package com.myspring.yologaza.admin.goods.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.myspring.yologaza.admin.goods.service.AdminGoodsService;
import com.myspring.yologaza.common.base.BaseController;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.member.vo.MemberVO;

@Controller("AdminGoodsController")
@RequestMapping(value="/admin/goods")
public class AdminGoodsControllerImpl extends BaseController implements AdminGoodsController {
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@Override
	@RequestMapping(value="/listGoods.do", method=RequestMethod.GET)
	public ModelAndView listGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		
		List listGoods = adminGoodsService.listGoods();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("listGoods", listGoods);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/goodsAcess.do" ,method={RequestMethod.POST})
	@ResponseBody
	public ResponseEntity goodsAcess(@RequestParam("goods_id") int goods_id, 
									HttpServletRequest Request, 
									HttpServletResponse response)  throws Exception {
		Request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String fileName=null;
		
		Map GoodsAcessMap = new HashMap();
		Enumeration enu=Request.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=Request.getParameter(name);
			GoodsAcessMap.put(name,value);
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			adminGoodsService.updateGoodsAcess(GoodsAcessMap);
			
		}catch(Exception e) {
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='"+Request.getContextPath()+"/admin/goods/listGoods.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
}
