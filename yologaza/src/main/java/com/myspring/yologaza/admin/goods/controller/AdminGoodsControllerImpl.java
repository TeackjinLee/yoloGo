package com.myspring.yologaza.admin.goods.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.admin.goods.service.AdminGoodsService;
import com.myspring.yologaza.common.base.BaseController;
import com.myspring.yologaza.common.file.Pagination;
import com.myspring.yologaza.goods.vo.GoodsVO;

@Controller("AdminGoodsController")
@RequestMapping(value="/admin/goods")
public class AdminGoodsControllerImpl extends BaseController implements AdminGoodsController {
	@Autowired
	private AdminGoodsService adminGoodsService;
	
	@Override
	@RequestMapping(value="/listGoods.do", method=RequestMethod.GET)
	public ModelAndView listGoods(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		long date1 = 0;
		long date2 = 0;
		if(request.getParameter("date1") != null)
			date1 = Long.parseLong(request.getParameter("date1"));
		if(request.getParameter("date2") != null)
			date2 = Long.parseLong(request.getParameter("date2"));
		date1 = (date1/86400) * 86400;
		date2 = ((date2/86400) * 86400)+1;
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
		
		String viewName = (String) request.getAttribute("viewName");
		List<GoodsVO> listGoods = adminGoodsService.listGoods(date1, date2, offset, pagination.getCountList());
		pagination.Paging();
		pagination.setTotalCount(adminGoodsService.getAdminGoodsDAO().getTotalCount());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("listGoods", listGoods);
		mav.addObject(pagination);
		mav.addObject("today", today);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/goodsAcess.do" ,method={RequestMethod.POST})
	@ResponseBody
	public ResponseEntity goodsAcess(@RequestParam("goods_id") int goods_id,
									@RequestParam("uid") int uid,
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
			adminGoodsService.updateMemberAcess(GoodsAcessMap);
			message= "<script>";
			message += " alert('검수를 완료했습니다.');";
			message +=" location.href='"+Request.getContextPath()+"/admin/goods/listGoods.do';";
			message +=("</script>");
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
