package com.myspring.yologaza.business.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
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
		
		int goods_uroom = businessGoodsDAO.insertNewGoodsRoom(newGoodsRoomMap);
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
	
	@Override
	public Map selectNewGoods(String goods_id) throws Exception {
		Map goodsMap=new HashMap();
		GoodsVO goodsVO = businessGoodsDAO.selectNewGoods(goods_id);
		goodsMap.put("goodsVO", goodsVO);
		List<ImageFileVO> imageList =businessGoodsDAO.selectNewGoodsImg(goods_id);
		goodsMap.put("imageList", imageList);
		return goodsMap;
	}
	
	@Override
	public void modifyGoodsInfo(Map modGoodsMap) throws Exception{
		businessGoodsDAO.updateGoodsInfo(modGoodsMap);
	}
	
	@Override
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception{
		businessGoodsDAO.updateGoodsImage(imageFileList); 
	}
	
	@Override
	public void removeGoodsImage(int goods_uimg) throws Exception{
		businessGoodsDAO.deleteGoodsImage(goods_uimg);
	}
	
	@Override
	public void addNewGoodsImage(List imageFileList) throws Exception{
		businessGoodsDAO.insertGoodsImageFile(imageFileList);
	}
}
