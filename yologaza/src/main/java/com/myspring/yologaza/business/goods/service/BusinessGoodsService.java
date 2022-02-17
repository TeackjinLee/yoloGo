package com.myspring.yologaza.business.goods.service;

import java.util.List;
import java.util.Map;

import com.myspring.yologaza.business.goods.dao.BusinessGoodsDAO;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;

public interface BusinessGoodsService {
	public BusinessGoodsDAO getBusinessGoodsDAO();
	public int  addNewGoods(Map newGoodsMap) throws Exception;
	public int addNewGoodsRoom(Map newGoodsRoomMap) throws Exception;
	public List<GoodsVO> listNewGoods(Map condMap) throws Exception;
	public Map selectNewGoods(String goods_id) throws Exception;
	public void modifyGoodsInfo(Map modGoodsMap) throws Exception;
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception;
	public void removeGoodsImage(int goods_uimg) throws Exception;
	public void addNewGoodsImage(List imageFileList) throws Exception;
	public Map selectNewGoodsRoom(String goods_uroom) throws Exception;
	public Map selectAllGoodsList(String uid) throws Exception;
	public Map selectAllRoomList(String goods_id) throws Exception;
	public void modifyRoomInfo(Map modRoomMap) throws Exception;	
	public List<GoodsVO> selectReservation(long date1, long date2, int offset, int count, String uid, int type) throws Exception;
	public List<GoodsVO> selectReservationHistory(long date1, long date2, int offset, int count, String uid, int type) throws Exception;
	public List<GoodsVO> selectCalHistory(long date1, long date2, int offset, int count, String uid) throws Exception;
	public int selectBusinessPoint(String uid) throws Exception;
	public List selectSalesHistory(String uid, int term) throws Exception;
	public List<GoodsVO> selectReservationBusinessMain(int offset, int count, String uid) throws Exception;
	public List selectReservationCountBusinessMain(String uid) throws Exception;
}
