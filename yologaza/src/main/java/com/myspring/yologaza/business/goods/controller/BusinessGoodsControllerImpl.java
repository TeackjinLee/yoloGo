package com.myspring.yologaza.business.goods.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.maven.model.Model;
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

import com.myspring.yologaza.CC.vo.Question_VO;
import com.myspring.yologaza.business.goods.service.BusinessGoodsService;
import com.myspring.yologaza.common.base.BaseController;
import com.myspring.yologaza.common.file.Pagination;
import com.myspring.yologaza.goods.service.GoodsService;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;
import com.myspring.yologaza.member.vo.MemberVO;

@Controller("BusinessGoodsController")
@RequestMapping(value="/business/goods")
public class BusinessGoodsControllerImpl  extends BaseController implements BusinessGoodsController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\yoloshopping\\file_repo";
	private static final String ROOM_IMAGE_REPO_PATH = "C:\\yoloshopping\\file_repo";
	@Autowired
	private BusinessGoodsService businessGoodsService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private MemberVO memberVO;
	
	@RequestMapping(value="/businessGoodsMain.do" ,method=RequestMethod.POST)
	public ModelAndView businessGoodsMain(@RequestParam Map<String, String> dateMap,
			                           HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("member");
		String id=memberVO.getId();
		
		String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
		String beginDate=null,endDate=null;
		
		String [] tempDate=calcSearchPeriod(fixedSearchPeriod).split(",");
		beginDate=tempDate[0];
		endDate=tempDate[1];
		dateMap.put("beginDate", beginDate);
		dateMap.put("endDate", endDate);
		dateMap.put("id", id);
		List<GoodsVO> newGoodsList=businessGoodsService.listNewGoods(dateMap);
		
		String beginDate1[]=beginDate.split("-"); //검색일자를 년,월,일로 분리해서 화면에 전달합니다.
		String endDate1[]=endDate.split("-");
		mav.addObject("beginYear",beginDate1[0]);
		mav.addObject("beginMonth",beginDate1[1]);
		mav.addObject("beginDay",beginDate1[2]);
		mav.addObject("endYear",endDate1[0]);
		mav.addObject("endMonth",endDate1[1]);
		mav.addObject("endDay",endDate1[2]);
		mav.addObject("newGoodsList", newGoodsList);
		return mav;
		
	}
	
	@RequestMapping(value="/addNewGoods.do" ,method={RequestMethod.POST})
	public ResponseEntity addNewGoods( MultipartHttpServletRequest multipartRequest,HttpServletRequest request, HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String fileName=null;
		
		Map newGoodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			newGoodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getId();
		
		List<ImageFileVO> imageFileList =upload(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setReg_id(reg_id);
			}
			newGoodsMap.put("imageFileList", imageFileList);
		}
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int goods_id = businessGoodsService.addNewGoods(newGoodsMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+fileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('새상품을 추가했습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/business/goods/addNewGoodsRoomForm.do?goods_id="+goods_id+"';";
			message +=("</script>");
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+fileName);
					srcFile.delete();
				}
			}
			
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/business/goods/addNewGoodsForm.do';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}

	@Override
	@RequestMapping(value="/addNewGoodsRoom.do" ,method={RequestMethod.POST})
	public ResponseEntity addNewGoodsRoom(@RequestParam("goods_id") int goods_id, MultipartHttpServletRequest multipartRequest, 
											 HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String fileName=null;
		
		Map newGoodsRoomMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			newGoodsRoomMap.put(name,value);
		}
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getId();

		List<ImageFileVO> imageFileList =upload(multipartRequest);
		if(imageFileList!= null && imageFileList.size()!=0) {
			for(ImageFileVO imageFileVO : imageFileList) {
				imageFileVO.setReg_id(reg_id);
				imageFileVO.setGoods_id(goods_id);
			}
			newGoodsRoomMap.put("imageFileList", imageFileList);
		}

		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int goods_uroom = businessGoodsService.addNewGoodsRoom(newGoodsRoomMap);
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(ROOM_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+ fileName);
					File destDir = new File(ROOM_IMAGE_REPO_PATH+"\\"+ goods_id +"\\"+goods_uroom);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
			message= "<script>";
			message += " alert('새상품을 수정했습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/business/goods/addNewGoodsRoomForm.do?goods_id="+goods_id+"';";
			message +="</script>";
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(ROOM_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+fileName);
				}
			}
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/business/goods/addNewGoodsRoomForm.do?goods_id="+goods_id+"';";
			message +="</script>";
			e.printStackTrace();
		}
		
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	// 숙박 등록 검색
	@Override
	@RequestMapping(value="/viewNewGoods.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewNewGoods(@RequestParam("goods_id") String goods_id,
									HttpServletRequest request, 
									HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		Map goodsMap=businessGoodsService.selectNewGoods(goods_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/modGoods.do" ,method={RequestMethod.POST})
	@ResponseBody
	public ResponseEntity modGoods(@RequestParam("goods_id") int goods_id, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String fileName=null;
		
		Map modGoodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			modGoodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			businessGoodsService.modifyGoodsInfo(modGoodsMap);
			message= "<script>";
			message += " alert('상품을 수정했습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/business/goods/viewNewGoods.do?goods_id="+goods_id+"';";
			message +=("</script>");
		}catch(Exception e) {
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/business/goods/viewNewGoods.do?goods_id="+goods_id+"';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/addNewGoodsImage.do" ,method={RequestMethod.POST})
	public void addNewGoodsImage(@RequestParam("goods_id") int goods_id, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		System.out.println("addNewGoodsImage");
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String fileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getId();
		
		List<ImageFileVO> imageFileList=null;
		
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(ImageFileVO imageFileVO : imageFileList) {
					goods_id = Integer.parseInt((String)goodsMap.get("goods_id"));
					imageFileVO.setGoods_id(goods_id);
					imageFileVO.setReg_id(reg_id);

				}
				
				businessGoodsService.addNewGoodsImage(imageFileList);
				System.out.println("addNewGoodsImage2");
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+fileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
					
				}
				
			}
		}catch(Exception e) {
			if(imageFileList!=null || imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+fileName);
					System.out.println("addNewGoodsImage3");
					srcFile.delete();
				}
				System.out.println("addNewGoodsImage4");
			}
			
			e.printStackTrace();
		}
	}
	
	@Override
	@RequestMapping(value="/modifyGoodsImageInfo.do" ,method={RequestMethod.POST})
	public void modifyGoodsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		System.out.println("modifyGoodsImageInfo");
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String fileName=null;
		
		Map goodsMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			goodsMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String reg_id = memberVO.getId();
		
		List<ImageFileVO> imageFileList=null;
		int goods_id=1;
		int goods_uimg=1;
		try {
			imageFileList =upload(multipartRequest);
			if(imageFileList!= null && imageFileList.size()!=0) {
				for(ImageFileVO imageFileVO : imageFileList) {
					goods_id = Integer.parseInt((String)goodsMap.get("goods_id"));
					goods_uimg = Integer.parseInt((String)goodsMap.get("goods_uimg"));
					imageFileVO.setGoods_id(goods_id);
					imageFileVO.setGoods_uimg(goods_uimg);
					imageFileVO.setReg_id(reg_id);
				}
				businessGoodsService.modifyGoodsImage(imageFileList);
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + fileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+fileName);
					
				}
			}
			e.printStackTrace();
		}
		System.out.println("modifyGoodsImageInfo2");
	}
	
	@Override
	@RequestMapping(value="/removeGoodsImage.do" ,method={RequestMethod.POST})
	public void  removeGoodsImage(@RequestParam("goods_id") int goods_id,
			                      @RequestParam("goods_uimg") int goods_uimg,
			                      @RequestParam("fileName") String fileName,
			                      HttpServletRequest request, HttpServletResponse response)  throws Exception {
		
		businessGoodsService.removeGoodsImage(goods_uimg);
		try{
			File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+goods_id+"\\"+fileName);
			srcFile.delete();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 객실 등록 검색
	@Override
	@RequestMapping(value="/viewNewGoodsRoom.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView viewNewGoodsRoom(@RequestParam("goods_id") String goods_id,
								@RequestParam("goods_uroom") String goods_uroom,
									HttpServletRequest request, 
									HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		Map goodsRoomMap=businessGoodsService.selectNewGoodsRoom(goods_uroom);
		Map goodsMap=businessGoodsService.selectNewGoods(goods_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("goodsMap", goodsMap);
		mav.addObject("goodsRoomMap", goodsRoomMap);
		return mav;
	}
	// 숙박 검색
	@Override
	@RequestMapping(value="/listGoods.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listGoods(HttpServletRequest request, 
									HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String uid = memberVO.getUid();
		Map listGoodsMap=businessGoodsService.selectAllGoodsList(uid);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("listGoodsMap", listGoodsMap);
		return mav;
	}
	
	// 룸 검색
	@Override
	@RequestMapping(value="/listRoom.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listRoom(@RequestParam("goods_id") String goods_id,
									HttpServletRequest request, 
									HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		Map listRoomMap=businessGoodsService.selectAllRoomList(goods_id);
		Map goodsMap=businessGoodsService.selectNewGoods(goods_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("listRoomMap", listRoomMap);
		mav.addObject("goodsMap", goodsMap);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/modRoom.do" ,method={RequestMethod.POST})
	@ResponseBody
	public ResponseEntity modRoom(@RequestParam("goods_id") int goods_id,
									@RequestParam("goods_uroom") int goods_uroom,
									MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String fileName=null;
		
		Map modRoomMap = new HashMap();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			modRoomMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			businessGoodsService.modifyRoomInfo(modRoomMap);
			message= "<script>";
			message += " alert('상품을 수정했습니다.');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/business/goods/viewNewGoodsRoom.do?goods_id="+goods_id+"&goods_uroom="+goods_uroom+"';";
			message +=("</script>");
		}catch(Exception e) {
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/business/goods/viewNewGoodsRoom.do?goods_id="+goods_id+"&goods_uroom="+goods_uroom+"';";
			message +=("</script>");
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value="/reviewManagement.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reviewManagement(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = {"/reservationCheck.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView reservationCheck(HttpServletRequest request,
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
		int type = 0;
		if(request.getParameter("type") != null)
			type = Integer.parseInt(request.getParameter("type"));
		request.setAttribute("type", type);
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView(viewName);
		if(memberVO != null) {
			String uid = memberVO.getUid();
			List<GoodsVO> selectReservation = businessGoodsService.selectReservation(date1, date2, offset, pagination.getCountList(), uid, type);
			pagination.setTotalCount(businessGoodsService.getBusinessGoodsDAO().getTotalCount());
			pagination.Paging();
			mav.addObject("selectReservation", selectReservation);
			mav.addObject(pagination);
			mav.addObject("today1", today1);
			mav.addObject("today2", today2);
		}
		return mav;
	}
	
	@RequestMapping(value = {"/reservationHistory.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView reservationHistory(HttpServletRequest request,
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
		int type = 0;
		if(request.getParameter("type") != null)
			type = Integer.parseInt(request.getParameter("type"));
		request.setAttribute("type", type);
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView(viewName);
		if(memberVO != null) {
			String uid = memberVO.getUid();
			List<GoodsVO> selectReservationHistory = businessGoodsService.selectReservationHistory(date1, date2, offset, pagination.getCountList(), uid, type);
			pagination.setTotalCount(businessGoodsService.getBusinessGoodsDAO().getTotalCount());
			pagination.Paging();
			mav.addObject("selectReservationHistory", selectReservationHistory);
			mav.addObject(pagination);
			mav.addObject("today1", today1);
			mav.addObject("today2", today2);
		}
		return mav;
	}
	
	@RequestMapping(value = {"/calHistory.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView calHistory(HttpServletRequest request,
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
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView(viewName);
		if(memberVO != null) {
			String uid = memberVO.getUid();
			List<GoodsVO> selectCalHistory = businessGoodsService.selectCalHistory(date1, date2, offset, pagination.getCountList(), uid);
			pagination.setTotalCount(businessGoodsService.getBusinessGoodsDAO().getTotalCount());
			pagination.Paging();
			int businessPoint = businessGoodsService.selectBusinessPoint(uid);
			mav.addObject("selectCalHistory", selectCalHistory);
			mav.addObject("businessPoint", businessPoint);
			mav.addObject(pagination);
			mav.addObject("today1", today1);
			mav.addObject("today2", today2);
		}
		return mav;
	}
	
	@RequestMapping(value = {"/salesHistory.do"} ,method={RequestMethod.POST,RequestMethod.GET})
	private ModelAndView salesHistory(HttpServletRequest request,
								HttpServletResponse response) throws Exception{
		int term = 1;
		if(request.getParameter("term") != null)
			term = Integer.parseInt(request.getParameter("term"));
		request.setAttribute("term", term);
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ModelAndView mav = new ModelAndView(viewName);
		if(memberVO != null) {
			String uid = memberVO.getUid();
			List selectSalesHistory = businessGoodsService.selectSalesHistory(uid, term);
			mav.addObject("selectSalesHistory", selectSalesHistory);
		}
		return mav;
	}

}
