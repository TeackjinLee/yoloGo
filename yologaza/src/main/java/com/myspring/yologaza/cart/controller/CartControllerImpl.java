package com.myspring.yologaza.cart.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.yologaza.cart.service.CartService;
import com.myspring.yologaza.cart.vo.CartVO;
import com.myspring.yologaza.common.base.BaseController;
import com.myspring.yologaza.member.vo.MemberVO;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController {
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	
	@RequestMapping(value="/myCartList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		MemberVO memberVO=(MemberVO)session.getAttribute("member");
		String id = memberVO.getId();
		cartVO.setId(id);
		Map<String ,List> cartMap=cartService.myCartList(cartVO);
		session.setAttribute("cartMap", cartMap);//장바구니 목록 화면에서 상품 주문 시 사용하기 위해서 장바구니 목록을 세션에 저장한다.
		//mav.addObject("cartMap", cartMap);
		return mav;
	}
	@RequestMapping(value="/addGoodsInCart.do" ,method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public  @ResponseBody String addGoodsInCart(@RequestParam("goods_uroom") int goods_uroom,
												@RequestParam("price") double price,
												@RequestParam("checkIn") String checkIn,
												@RequestParam("checkOut") String checkOut,
			                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("member");
		String id=memberVO.getId();
		
		//cartVO.setMember_id(member_id);
		//카트 등록전에 이미 등록된 제품인지 판별한다.
		cartVO.setGoods_uroom(goods_uroom);
		cartVO.setId(id);
		cartVO.setPrice(price);
		cartVO.setCheckIn(checkIn);
		cartVO.setCheckOut(checkOut);
		boolean isAreadyExisted=cartService.findCartGoods(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		if(isAreadyExisted==true){
			return "already_existed";
		}else{
			cartService.addGoodsInCart(cartVO);
			return "add_success";
		}
	}
	
	@RequestMapping(value="/modifyCartQty.do" ,method = RequestMethod.POST)
	public @ResponseBody String  modifyCartQty(@RequestParam("goods_uroom") int goods_uroom,
			                                   @RequestParam("cart_goods_qty") int cart_goods_qty,
			                                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("member");
		String id=memberVO.getId();
		cartVO.setGoods_uroom(goods_uroom);
		cartVO.setId(id);
		cartVO.setCart_goods_qty(cart_goods_qty);
		boolean result=cartService.modifyCartQty(cartVO);
		
		if(result==true){
		   return "modify_success";
		}else{
			  return "modify_failed";	
		}
		
	}
	
	@RequestMapping(value="/removeCartGoods.do" ,method = RequestMethod.POST)
	public ModelAndView removeCartGoods(@RequestParam("cart_uid") int cart_uid,
			                          HttpServletRequest request, HttpServletResponse response)  throws Exception{
		ModelAndView mav=new ModelAndView();
		cartService.removeCartGoods(cart_uid);
		mav.setViewName("redirect:/cart/myCartList.do");
		return mav;
	}
}
