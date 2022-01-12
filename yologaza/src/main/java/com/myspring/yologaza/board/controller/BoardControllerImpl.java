package com.myspring.yologaza.board.controller;

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

import com.myspring.yologaza.board.service.BoardService;
import com.myspring.yologaza.board.vo.ArticleVO;
import com.myspring.yologaza.goods.service.GoodsService;
import com.myspring.yologaza.member.vo.MemberVO;

@Controller("boardController")
public class BoardControllerImpl implements BoardController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	BoardService boardService;
	@Autowired
	ArticleVO articleVO;
	@Autowired
	private GoodsService goodsService;
	

	
	@Override
	@RequestMapping(value={"/board/addNewArticle.do"}, method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(@RequestParam("goods_id") String goods_id, MultipartHttpServletRequest multipartRequest,
										HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ArticleVO aritcleVO = (ArticleVO) session.getAttribute("article");
		String id = memberVO.getId();
		articleMap.put("parentNO", 0);
		articleMap.put("id", id);
		articleMap.put("imageFileName", imageFileName);
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
				int articleNO = boardService.addNewArticle(articleMap);
				if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new 
				File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
				}
				message = "<script>";
				message += "location.href='"+multipartRequest.getContextPath()+"/goods/goodsInformation.do?goods_id=" + goods_id + "';";
				message +=" </script>";
				 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
				srcFile.delete();
				message = " <script>";
				message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
				message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
				message +=" </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
	}
	
	@Override
	@RequestMapping(value={"/board/addReply.do"}, method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addReply(@RequestParam("goods_id") String goods_id, MultipartHttpServletRequest multipartRequest,
										HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> articleMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			articleMap.put(name,value);
		}
		String imageFileName= upload(multipartRequest);
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		ArticleVO aritcleVO = (ArticleVO) session.getAttribute("article");
		String id = memberVO.getId();
		int articleNO1 = articleVO.getArticleNO();
		articleMap.put("parentNO", articleNO1);
		articleMap.put("id", id);
		articleMap.put("imageFileName", imageFileName);
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
				int articleNO = boardService.addReply(articleMap);
				if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+ "\\" + "temp"+ "\\" + imageFileName);
				File destDir = new 
				File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir,true);
			}
				message = "<script>";
				message += " alert('댓글 추가했습니다.');";
				message += "location.href='"+multipartRequest.getContextPath()+"/goods/goodsInformation.do?goods_id=" + goods_id + "';";
				message +=" </script>";
				 resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			}catch(Exception e) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
				srcFile.delete();
				message = " <script>";
				message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
				message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
				message +=" </script>";
				resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				e.printStackTrace();
			}
			return resEnt;
	}
	@RequestMapping(value = "/board/articleForm.do", method= {RequestMethod.POST, RequestMethod.GET})
	private ModelAndView articleForm(@RequestParam("goods_id") String goods_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		Map goodsMap=goodsService.goodsDetail(goods_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsMap", goodsMap);
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value = "/board/replyForm.do", method= {RequestMethod.POST, RequestMethod.GET})
	private ModelAndView replyForm(@RequestParam("goods_id") String goods_id,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		Map goodsMap=goodsService.goodsDetail(goods_id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsMap", goodsMap);
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "/board/*Form.do", method= {RequestMethod.POST, RequestMethod.GET})
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	//한개 이미지 업로드하기
	private String upload(MultipartHttpServletRequest multipartRequest) 
	throws Exception{
		String imageFileName= null;
		Map<String, String> articleMap = new HashMap<String, String>();
		Iterator<String> fileNames = multipartRequest.getFileNames();
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+"\\" + fileName);
			if(mFile.getSize()!=0){
				if(!file.exists()){
					if(file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFileName));
			}
		}
		return imageFileName;
		
	}
	
	//한개의 이미지 보여주기
	@RequestMapping(value="/board/viewArticle.do" ,method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
									HttpServletRequest request, 
									HttpServletResponse response) throws Exception{
	String viewName = (String)request.getAttribute("viewName");
	articleVO=boardService.viewArticle(articleNO);
	ModelAndView mav = new ModelAndView();
	mav.setViewName(viewName);
	mav.addObject("article", articleVO);
	return mav;
	}
	
	//한 개 이미지 수정 기능
	 @RequestMapping(value="/board/modArticle.do" ,method = RequestMethod.POST)
	 @ResponseBody
	 public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest, 
	 HttpServletResponse response) throws Exception{
		 multipartRequest.setCharacterEncoding("utf-8");
		 Map<String,Object> articleMap = new HashMap<String, Object>();
		 Enumeration enu=multipartRequest.getParameterNames();
		 while(enu.hasMoreElements()){
			 String name=(String)enu.nextElement();
			 String value=multipartRequest.getParameter(name);
			 articleMap.put(name,value);
		 }
		 String imageFileName= upload(multipartRequest);
		 articleMap.put("imageFileName", imageFileName);
		 String articleNO=(String)articleMap.get("articleNO");
		 String message;
		 ResponseEntity resEnt=null;
		 HttpHeaders responseHeaders = new HttpHeaders();
		 responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		  try {
			  boardService.modArticle(articleMap);
			  if(imageFileName!=null && imageFileName.length()!=0) {
				File srcFile = new 
				File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
				   
				String originalFileName = (String)articleMap.get("originalFileName");
				File oldFile = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO+"\\"+originalFileName);
				oldFile.delete();
			  }
			  message = "<script>";
			  message += " alert('글을 수정했습니다.');";
			  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			  message +=" </script>";
			  resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		  } catch(Exception e) {
			  File srcFile = new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
			  srcFile.delete();
			  message = "<script>";
			  message += " alert('오류가 발생했습니다.다시 수정해주세요');";
			  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewArticle.do?articleNO="+articleNO+"';";
			  message +=" </script>";
			  resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		  }
		  return resEnt;

	 }
	 
	@Override
	@RequestMapping(value="/board/removeArticle.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity removeArticle(@RequestParam("articleNO") int articleNO,
										HttpServletRequest request,
										HttpServletResponse response) throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			boardService.removeArticle(articleNO);
			File destDir = new File(ARTICLE_IMAGE_REPO+"\\"+articleNO);
			FileUtils.deleteDirectory(destDir);
			message = "<script>";
			message += " alert('글을 삭제했습니다.');";
			message += " location.href='"+request.getContextPath()+"/main.do';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch(Exception e) {
			message = "<script>";
			message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
			message += " location.href='"+request.getContextPath()+"/main.do';";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
	return resEnt;
	}
}
