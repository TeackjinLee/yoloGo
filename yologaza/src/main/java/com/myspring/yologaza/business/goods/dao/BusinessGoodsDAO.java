package com.myspring.yologaza.business.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;

public interface BusinessGoodsDAO {
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException;
	public int insertNewGoodsRoom(Map newGoodsRoomMap) throws DataAccessException;
	public List<GoodsVO>selectNewGoodsList(Map condMap) throws DataAccessException;
	public void insertGoodsImageFile(List fileList)  throws DataAccessException;
	public void insertGoodsRoomImageFile(List fileList) throws DataAccessException;
	public GoodsVO selectNewGoods(String goods_id) throws DataAccessException;
	public List<ImageFileVO> selectNewGoodsImg(String goods_id) throws DataAccessException;
	public void updateGoodsInfo(Map goodsMap) throws DataAccessException;
}
