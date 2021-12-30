package com.myspring.yologaza.business.goods.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.business.goods.dao.BusinessGoodsDAO;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;

@Service("businessGoodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class BusinessGoodsServiceImpl implements BusinessGoodsService {
	@Autowired
	private BusinessGoodsDAO businessGoodsDAO;
	
	@Override
	public int addNewGoods(Map newGoodsMap) throws Exception{
		int goods_id = businessGoodsDAO.insertNewGoods(newGoodsMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList)newGoodsMap.get("imageFileList");
		for(ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setGoods_id(goods_id);
		}
		businessGoodsDAO.insertGoodsImageFile(imageFileList);
		return goods_id;
	}
	
	@Override
	public int addNewGoodsRoom(Map newGoodsRoomMap) throws Exception{
		int goods_uroom = businessGoodsDAO.insertNewGoods(newGoodsRoomMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList)newGoodsRoomMap.get("imageFileList");
		for(ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setGoods_uroom(goods_uroom);
		}
		businessGoodsDAO.insertGoodsRoomImageFile(imageFileList);
		return goods_uroom;
	}
	
	@Override
	public List<GoodsVO> listNewGoods(Map condMap) throws Exception{
		return businessGoodsDAO.selectNewGoodsList(condMap);
	}
}
