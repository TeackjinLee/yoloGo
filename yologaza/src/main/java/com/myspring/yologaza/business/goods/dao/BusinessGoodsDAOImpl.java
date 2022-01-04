package com.myspring.yologaza.business.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.board.vo.ArticleVO;
import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;

@Repository("businessGoodsDAO")
public class BusinessGoodsDAOImpl implements BusinessGoodsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertNewGoods(Map newGoodsMap) throws DataAccessException {
		sqlSession.insert("mapper.business.goods.insertNewGoods",newGoodsMap);
		return Integer.parseInt((String)newGoodsMap.get("goods_id"));
	}
	
	@Override
	public int insertNewGoodsRoom(Map newGoodsRoomMap) throws DataAccessException {
		sqlSession.insert("mapper.business.goods.insertNewGoodsRoom",newGoodsRoomMap);
		return  Integer.parseInt(String.valueOf(newGoodsRoomMap.get("goods_uroom")));
	}
	
	@Override
	public void insertGoodsImageFile(List fileList)  throws DataAccessException {
		for(int i=0; i<fileList.size();i++){
			ImageFileVO imageFileVO=(ImageFileVO)fileList.get(i);
			sqlSession.insert("mapper.business.goods.insertGoodsImageFile",imageFileVO);
		}
	}
	
	@Override
	public List<GoodsVO>selectNewGoodsList(Map condMap) throws DataAccessException {
		ArrayList goodsList=(ArrayList)sqlSession.selectList("mapper.business.goods.selectNewGoodsList", condMap);
		return goodsList;
	}
	
	@Override
	public void insertGoodsRoomImageFile(List fileList)  throws DataAccessException {
		for(int i=0; i<fileList.size();i++){
			ImageFileVO imageFileVO=(ImageFileVO)fileList.get(i);
			sqlSession.insert("mapper.business.goods.insertGoodsRoomImageFile",imageFileVO);
		}
	}
	
	@Override
	public GoodsVO selectNewGoods(String goods_id) throws DataAccessException {
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.business.goods.selectNewGoods",goods_id);
		return goodsVO;
	}
	
	@Override
	public List<ImageFileVO> selectNewGoodsImg(String goods_id) throws DataAccessException {
		List<ImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.business.goods.selectNewGoodsImg",goods_id);
		return imageList;
	}
	
	@Override
	public void updateGoodsInfo(Map goodsMap) throws DataAccessException{
		sqlSession.update("mapper.business.goods.updateGoodsInfo",goodsMap);
	}
}
