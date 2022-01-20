package com.myspring.yologaza.goods.service;

import java.util.List;
import java.util.Map;

import com.myspring.yologaza.goods.vo.GoodsVO;

public interface GoodsService {
	public List<GoodsVO> listGoods(GoodsVO goodsVO) throws Exception;
	public Map goodsDetail(String goods_id) throws Exception;
	public List<String> keywordSearch(String keyword) throws Exception;
	public List<GoodsVO> searchGoods(String searchWord) throws Exception;
}
