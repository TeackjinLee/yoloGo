package com.myspring.yologaza.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;
import com.myspring.yologaza.reservation.vo.ReservationVO;

public interface GoodsDAO {

	public List<GoodsVO> selectGoodsList(GoodsVO goodsVO ) throws DataAccessException;

	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException;

	public List<ImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException;

	public List<GoodsVO> selectGoodsDetailRoom(String goods_id) throws DataAccessException;
	
	public List<ImageFileVO> selectGoodsDetailImageRoom(String goods_id) throws DataAccessException;

	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;

	public ArrayList selectGoodsBySearchWord(String searchWord) throws DataAccessException;

}
