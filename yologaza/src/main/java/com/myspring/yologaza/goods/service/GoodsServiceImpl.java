package com.myspring.yologaza.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.myspring.yologaza.goods.dao.GoodsDAO;
import com.myspring.yologaza.goods.vo.GoodsVO;

	@Service("goodsService")
	@Transactional(propagation=Propagation.REQUIRED)
	public class GoodsServiceImpl implements GoodsService{
		@Autowired
		private GoodsDAO goodsDAO;
		@Override
		public Map<String,List<GoodsVO>> listGoods() throws Exception {
			Map<String,List<GoodsVO>> goodsMap=new HashMap<String,List<GoodsVO>>();
			List<GoodsVO> goodsList=goodsDAO.selectGoodsList("hotel");
			goodsMap.put("hotel",goodsList);
//			goodsList=goodsDAO.selectGoodsList("motel");
//			goodsMap.put("motel",goodsList);
//			
//			goodsList=goodsDAO.selectGoodsList("hotel");
//			goodsMap.put("hotel",goodsList);
//			
//			goodsList=goodsDAO.selectGoodsList("hotel");
//			goodsMap.put("hotel",goodsList);
//			
//			goodsList=goodsDAO.selectGoodsList("guestHouse");
//			goodsMap.put("guestHouse",goodsList);
//			
//			goodsList=goodsDAO.selectGoodsList("hanok");
//			goodsMap.put("hanok",goodsList);
			return goodsMap;
		}
}
