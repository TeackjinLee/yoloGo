package com.myspring.yologaza.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.cart.dao.CartDAO;
import com.myspring.yologaza.cart.vo.CartVO;
import com.myspring.yologaza.goods.vo.GoodsVO;

@Service("cartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	public Map<String ,List> myCartList(CartVO cartVO) throws Exception{
		Map<String,List> cartMap=new HashMap<String,List>();
		List<CartVO> myCartList=cartDAO.selectCartList(cartVO);
		if(myCartList.size()==0){ //카트에 저장된 상품이없는 경우
			return null;
		}
		List<GoodsVO> myGoodsList=cartDAO.selectGoodsList(myCartList);
		cartMap.put("myCartList", myCartList);
		cartMap.put("myGoodsList",myGoodsList);
		return cartMap;
	}
	
	public boolean findCartGoods(CartVO cartVO) throws Exception{
		 return cartDAO.selectCountInCart(cartVO);
		
	}	
	public void addGoodsInCart(CartVO cartVO) throws Exception{
		cartDAO.insertGoodsInCart(cartVO);
	}
	
	public boolean modifyCartQty(CartVO cartVO) throws Exception{
		boolean result=true;
		cartDAO.updateCartGoodsQty(cartVO);
		return result;
	}
	public void removeCartGoods(int cart_uid) throws Exception{
		cartDAO.deleteCartGoods(cart_uid);
	}
}
