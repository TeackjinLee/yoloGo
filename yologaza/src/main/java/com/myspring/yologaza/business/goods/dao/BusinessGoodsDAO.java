package com.myspring.yologaza.business.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;

public interface BusinessGoodsDAO {
	public int getTotalCount();
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException;
	public int insertNewGoodsRoom(Map newGoodsRoomMap) throws DataAccessException;
	public List<GoodsVO>selectNewGoodsList(Map condMap) throws DataAccessException;
	public void insertGoodsImageFile(List fileList)  throws DataAccessException;
	public void insertGoodsRoomImageFile(List fileList) throws DataAccessException;
	public GoodsVO selectNewGoods(String goods_id) throws DataAccessException;
	public List<ImageFileVO> selectNewGoodsImg(String goods_id) throws DataAccessException;
	public void updateGoodsInfo(Map modGoodsMap) throws DataAccessException;
	public void updateGoodsImage(List<ImageFileVO> imageFileList) throws DataAccessException;
	public void deleteGoodsImage(int goods_uimg) throws DataAccessException;
	public void deleteGoodsImage(List fileList) throws DataAccessException;
	public GoodsVO selectNewGoodsRoom(String goods_uroom) throws DataAccessException;
	public List<ImageFileVO> selectNewGoodsRoomImg(String goods_uroom) throws DataAccessException;
	public List selectAllGoodsList(String uid) throws DataAccessException;
	public List selectAllRoomList(String goods_id) throws DataAccessException;
	public void updateRoomInfo(Map modRoomMap) throws DataAccessException;
	public List<GoodsVO> selectReservation(long date1, long date2, int offset, int count, String uid, int type) throws DataAccessException;
	public List<GoodsVO> selectReservationHistory(long date1, long date2, int offset, int count, String uid, int type) throws DataAccessException;
	public List<GoodsVO> selectCalHistory(long date1, long date2, int offset, int count, String uid) throws DataAccessException;
	public int selectBusinessPoint(String uid) throws DataAccessException;
	public List selectSalesHistory(String uid, int term) throws DataAccessException;
	public List<GoodsVO> selectReservationBusinessMain(int offset, int count, String uid) throws DataAccessException;
	public List selectReservationCountBusinessMain(String uid) throws DataAccessException;
}
