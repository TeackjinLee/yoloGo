package com.myspring.yologaza.goods.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.board.service.BoardService;
import com.myspring.yologaza.board.vo.ArticleVO;
import com.myspring.yologaza.common.base.BaseController;
import com.myspring.yologaza.goods.service.GoodsService;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.member.service.MemberService;
import com.myspring.yologaza.member.vo.MemberVO;
import com.myspring.yologaza.reservation.service.ReservationService;
import com.myspring.yologaza.reservation.vo.ReservationVO;

import net.sf.json.JSONObject;

@Controller("goodsController")
public class GoodsControllerImpl extends BaseController implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private static final String ARTICLE_IMAGE_REPO = "C:\\board\\article_image";
	@Autowired
	private static final String MEMBER_IMAGE_REPO = "C:\\member\\member_image";
	@Autowired
	private static final String ROOM_IMAGE_REPO_PATH = "C:\\yoloshopping\\file_repo";
	@Autowired
	BoardService boardService;
	@Autowired
	ArticleVO articleVO;
	@Autowired
	MemberService memberService;
	@Autowired
	ReservationService reservationService;
	
	@Override
	@RequestMapping(value="/goods/goodsInformation.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles(@RequestParam("goods_id") String goods_id, ReservationVO reservationVO,
					HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		HttpSession session=request.getSession();
		List articlesList = boardService.listArticles();
		Map goodsMap=goodsService.goodsDetail(goods_id);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
		mav.addObject("goodsMap", goodsMap);
		// reservationCheck
		List<ReservationVO> reservationCheck=reservationService.reservationCheck(reservationVO);
		mav.addObject("reservationCheck", reservationCheck);
		// 퀵 사용시
		GoodsVO goodsVO=(GoodsVO)goodsMap.get("goodsVO");
		
		addGoodsInQuick(goods_id,goodsVO,session);
    	
		long today = (System.currentTimeMillis()/1000) + 32400;
		Date date = new Date(System.currentTimeMillis()+32400000);
		SimpleDateFormat timeFormat = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat timeFormat2 = new SimpleDateFormat("yyyy-MM-dd");
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
		String Ddate3 = todayDate;
		String Ddate4 = todayDate;
		if(date1 != 0 && date2 != 0) {
			Ddate1 = timeFormat.format(date1*1000);
			Ddate2 = timeFormat.format(date2*1000);
			Ddate3 = timeFormat2.format(date1*1000);
			Ddate4 = timeFormat2.format(date2*1000);
		} else if( date1 == 0 && date2 == 1) {
			Ddate1 = timeFormat.format(today*1000);
			Ddate2 = timeFormat.format((today+86400)*1000);
			Ddate3 = timeFormat2.format(today*1000);
			Ddate4 = timeFormat2.format((today+86400)*1000);
		}
		request.setAttribute("Ddate1", Ddate1);
		request.setAttribute("Ddate2", Ddate2);
		request.setAttribute("Ddate3", Ddate3);
		request.setAttribute("Ddate4", Ddate4);
		
		return mav;
	}
	@Override
	@RequestMapping(value = {"/searchGoods"},method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView searchGoods(GoodsVO goodsVO,
									HttpServletRequest request, 
									HttpServletResponse response) throws Exception{
		ModelAndView mav=new ModelAndView();
		String viewName=(String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		Map<String, Object> param = new HashMap<String, Object>();
		
		HttpSession session=request.getSession();
		
		List<GoodsVO> goodsMap=goodsService.listGoods(goodsVO);
		mav.addObject("goodsMap", goodsMap);
		
		long today = (System.currentTimeMillis()/1000) + 32400;
		Date date = new Date(System.currentTimeMillis()+32400000);
		SimpleDateFormat timeFormat = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat timeFormat2 = new SimpleDateFormat("yyyy-MM-dd");
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
		String Ddate3 = todayDate;
		String Ddate4 = todayDate;
		if(date1 != 0 && date2 != 0) {
			Ddate1 = timeFormat.format(date1*1000);
			Ddate2 = timeFormat.format(date2*1000);
			Ddate3 = timeFormat2.format(date1*1000);
			Ddate4 = timeFormat2.format(date2*1000);
		} else if( date1 == 0 && date2 == 1) {
			Ddate1 = timeFormat.format(today*1000);
			Ddate2 = timeFormat.format((today+86400)*1000);
			Ddate3 = timeFormat2.format(today*1000);
			Ddate4 = timeFormat2.format((today+86400)*1000);
		}
		request.setAttribute("Ddate1", Ddate1);
		request.setAttribute("Ddate2", Ddate2);
		request.setAttribute("Ddate3", Ddate3);
		request.setAttribute("Ddate4", Ddate4);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public @ResponseBody String keywordSearch(@RequestParam("keyword") String keyword,
			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		//System.out.println(keyword);
		if(keyword == null || keyword.equals(""))
		   return null ;
	
		keyword = keyword.toUpperCase();
	    List<String> keywordList =goodsService.keywordSearch(keyword);
	    
	 // 최종 완성될 JSONObject 선언(전체)
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		 		
	    String jsonInfo = jsonObject.toString();
	   // System.out.println(jsonInfo);
	    return jsonInfo ;
	}

	@Override
	@RequestMapping(value="/searchWorld.do" ,method = RequestMethod.GET)
	public ModelAndView searchWorld(@RequestParam("searchWord") String searchWord,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		List<GoodsVO> goodsMap=goodsService.searchGoods(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsMap", goodsMap);
		
		long today = (System.currentTimeMillis()/1000) + 32400;
		Date date = new Date(System.currentTimeMillis()+32400000);
		SimpleDateFormat timeFormat = new SimpleDateFormat("MM/dd/yyyy");
		SimpleDateFormat timeFormat2 = new SimpleDateFormat("yyyy-MM-dd");
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
		String Ddate3 = todayDate;
		String Ddate4 = todayDate;
		if(date1 != 0 && date2 != 0) {
			Ddate1 = timeFormat.format(date1*1000);
			Ddate2 = timeFormat.format(date2*1000);
			Ddate3 = timeFormat2.format(date1*1000);
			Ddate4 = timeFormat2.format(date2*1000);
		} else if( date1 == 0 && date2 == 1) {
			Ddate1 = timeFormat.format(today*1000);
			Ddate2 = timeFormat.format((today+86400)*1000);
			Ddate3 = timeFormat2.format(today*1000);
			Ddate4 = timeFormat2.format((today+86400)*1000);
		}
		request.setAttribute("Ddate1", Ddate1);
		request.setAttribute("Ddate2", Ddate2);
		request.setAttribute("Ddate3", Ddate3);
		request.setAttribute("Ddate4", Ddate4);
		
		return mav;
		
	}
	
	private void addGoodsInQuick(String goods_id,GoodsVO goodsVO,HttpSession session){
		boolean already_existed=false;
		List<GoodsVO> quickGoodsList; //최근 본 상품 저장 ArrayList
		quickGoodsList=(ArrayList<GoodsVO>)session.getAttribute("quickGoodsList");
		
		if(quickGoodsList!=null){
			if(quickGoodsList.size() < 4){ //미리본 상품 리스트에 상품개수가 세개 이하인 경우
				for(int i=0; i<quickGoodsList.size();i++){
					GoodsVO _goodsBean=(GoodsVO)quickGoodsList.get(i);
					if(goods_id.equals(_goodsBean.getGoods_id())){
						already_existed=true;
						break;
					}
				}
				if(already_existed==false){
					quickGoodsList.add(goodsVO);
				}
			}
			
		}else{
			quickGoodsList =new ArrayList<GoodsVO>();
			quickGoodsList.add(goodsVO);
			
		}
		session.setAttribute("quickGoodsList",quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}
}
