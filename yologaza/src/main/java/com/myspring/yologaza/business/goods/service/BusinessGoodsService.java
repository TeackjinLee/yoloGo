package com.myspring.yologaza.business.goods.service;

import java.util.List;
import java.util.Map;

import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;

public interface BusinessGoodsService {
	public int  addNewGoods(Map newGoodsMap) throws Exception;
	public int addNewGoodsRoom(Map newGoodsRoomMap) throws Exception;
	public List<GoodsVO> listNewGoods(Map condMap) throws Exception;
	public Map selectNewGoods(String goods_id) throws Exception;
	public void modifyGoodsInfo(Map modGoodsMap) throws Exception;
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception;	
}
