package com.myspring.yologaza.business.goods.controller;

import java.io.File;
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

import com.myspring.yologaza.business.goods.service.BusinessGoodsService;
import com.myspring.yologaza.common.base.BaseController;
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
	public ResponseEntity addNewGoods( MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception {
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
					srcFile.delete();
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
				System.out.println("addNewGoodsImage");
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+fileName);
					File destDir = new File(CURR_IMAGE_REPO_PATH+"\\"+goods_id);
					FileUtils.moveFileToDirectory(srcFile, destDir,true);
					
				}
			}
		}catch(Exception e) {
			if(imageFileList!=null && imageFileList.size()!=0) {
				for(ImageFileVO  imageFileVO:imageFileList) {
					fileName = imageFileVO.getFileName();
					File srcFile = new File(CURR_IMAGE_REPO_PATH+"\\"+"temp"+"\\"+fileName);
					srcFile.delete();
				}
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
		int goods_id=0;
		int goods_uimg=0;
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
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("listRoomMap", listRoomMap);
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
		
		
		
}
