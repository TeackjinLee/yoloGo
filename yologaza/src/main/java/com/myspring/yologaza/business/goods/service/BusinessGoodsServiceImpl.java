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
	public BusinessGoodsDAO getBusinessGoodsDAO() {
		return businessGoodsDAO;
	}
	
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
	public void modifyRoomInfo(Map modRoomMap) throws Exception{
		businessGoodsDAO.updateRoomInfo(modRoomMap);
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
	
	@Override
	public Map selectNewGoodsRoom(String goods_uroom) throws Exception {
		Map<String, Object> goodsRoomMap=new HashMap();
		GoodsVO roomVO = businessGoodsDAO.selectNewGoodsRoom(goods_uroom);
		goodsRoomMap.put("roomVO", roomVO);
		List<ImageFileVO> roomImageList =businessGoodsDAO.selectNewGoodsRoomImg(goods_uroom);
		goodsRoomMap.put("roomImageList", roomImageList);
		return goodsRoomMap;
	}
	
	@Override
	public Map selectAllGoodsList(String uid) throws Exception {
		Map<String, Object> listGoodsMap=new HashMap();
		List goodsList =businessGoodsDAO.selectAllGoodsList(uid);
		listGoodsMap.put("goodsList", goodsList);
		return listGoodsMap;
	}
	
	@Override
	public Map selectAllRoomList(String goods_id) throws Exception {
		Map<String, Object> listRoomMap=new HashMap();
		List roomList =businessGoodsDAO.selectAllRoomList(goods_id);
		listRoomMap.put("roomList", roomList);
		return listRoomMap;
	}
	
	@Override
	public List<GoodsVO> selectReservation(long date1, long date2, int offset, int count, String uid, int type) throws Exception{
		return businessGoodsDAO.selectReservation(date1, date2, offset, count, uid, type);
	}
	
	@Override
	public List<GoodsVO> selectReservationHistory(long date1, long date2, int offset, int count, String uid, int type) throws Exception{
		return businessGoodsDAO.selectReservationHistory(date1, date2, offset, count, uid, type);
	}
	
	@Override
	public List<GoodsVO> selectCalHistory(long date1, long date2, int offset, int count, String uid) throws Exception{
		return businessGoodsDAO.selectCalHistory(date1, date2, offset, count, uid);
	}
	
	@Override
	public int selectBusinessPoint(String uid) throws Exception{
		return businessGoodsDAO.selectBusinessPoint(uid);
	}
	
	@Override
	public List selectSalesHistory(String uid, int term) throws Exception{
		return businessGoodsDAO.selectSalesHistory(uid, term);
	}
	
	@Override
	public List<GoodsVO> selectReservationBusinessMain(int offset, int count, String uid) throws Exception{
		return businessGoodsDAO.selectReservationBusinessMain(offset, count, uid);
	}
	
	@Override
	public List selectReservationCountBusinessMain(String uid) throws Exception {
		return businessGoodsDAO.selectReservationCountBusinessMain(uid);
	}
}
