package com.myspring.yologaza.business.goods.service;

import java.util.List;
import java.util.Map;

import com.myspring.yologaza.goods.vo.GoodsVO;

public interface BusinessGoodsService {
	public int  addNewGoods(Map newGoodsMap) throws Exception;
	public List<GoodsVO> listNewGoods(Map condMap) throws Exception;
	
}
