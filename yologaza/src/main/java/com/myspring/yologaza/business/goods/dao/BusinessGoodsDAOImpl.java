package com.myspring.yologaza.business.goods.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.goods.vo.GoodsVO;
import com.myspring.yologaza.goods.vo.ImageFileVO;

@Repository("businessGoodsDAO")
public class BusinessGoodsDAOImpl implements BusinessGoodsDAO {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	int totalCount;
	
	public int getTotalCount() {
		return totalCount;
	}
	
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
	public List<GoodsVO> selectNewGoodsList(Map condMap) throws DataAccessException {
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
	public void updateGoodsInfo(Map modGoodsMap) throws DataAccessException{
		sqlSession.update("mapper.business.goods.updateGoodsInfo",modGoodsMap);
	}
	
	@Override
	public void updateRoomInfo(Map modRoomMap) throws DataAccessException{
		sqlSession.update("mapper.business.goods.updateRoomInfo",modRoomMap);
	}
	
	@Override
	public void updateGoodsImage(List<ImageFileVO> imageFileList) throws DataAccessException {
		
		for(int i=0; i<imageFileList.size();i++){
			ImageFileVO imageFileVO = imageFileList.get(i);
			sqlSession.update("mapper.business.goods.updateGoodsImage",imageFileVO);	
		}
		
	}
	
	@Override
	public void deleteGoodsImage(int goods_uimg) throws DataAccessException{
		sqlSession.delete("mapper.business.goods.deleteGoodsImage",goods_uimg);
	}
	
	@Override
	public void deleteGoodsImage(List fileList) throws DataAccessException{
		int goods_uimg;
		for(int i=0; i<fileList.size();i++){
			ImageFileVO bean=(ImageFileVO) fileList.get(i);
			goods_uimg=bean.getGoods_uimg();
			sqlSession.delete("mapper.business.goods.deleteGoodsImage",goods_uimg);	
		}
	}
	
	@Override
	public GoodsVO selectNewGoodsRoom(String goods_uroom) throws DataAccessException {
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.business.goods.selectNewGoodsRoom",goods_uroom);
		return goodsVO;
	}

	@Override
	public List<ImageFileVO> selectNewGoodsRoomImg(String goods_uroom) throws DataAccessException {
		List<ImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.business.goods.selectNewGoodsRoomImg",goods_uroom);
		return imageList;
	}
	
	@Override
	public List selectAllGoodsList(String  uid) throws DataAccessException {
		List goodsList=(ArrayList)sqlSession.selectList("mapper.business.goods.selectAllGoodsList", uid);
		return goodsList;
	}
	
	@Override
	public List selectAllRoomList(String  goods_id) throws DataAccessException {
		List roomList=(ArrayList)sqlSession.selectList("mapper.business.goods.selectAllRoomList", goods_id);
		return roomList;
	}
	
	@Override
	public List<GoodsVO> selectReservation(long date1, long date2, int offset, int count, String uid, int type) throws DataAccessException{
		List<GoodsVO> reservationList = new ArrayList<GoodsVO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("date1", date1);
		params.put("date2", date2);
		params.put("offset", offset);
		params.put("count", count);
		params.put("uid", uid);
		params.put("type", type);
		
		try {
			reservationList = session.selectList("mapper.reservation.selectReservation",params);
			this.totalCount = session.selectOne("mapper.reservation.countAllGoods");
		}finally {
			session.close();
		}
		return reservationList;
	}
	
	@Override
	public List<GoodsVO> selectReservationHistory(long date1, long date2, int offset, int count, String uid, int type) throws DataAccessException{
		List<GoodsVO> reservationList = new ArrayList<GoodsVO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("date1", date1);
		params.put("date2", date2);
		params.put("offset", offset);
		params.put("count", count);
		params.put("uid", uid);
		params.put("type", type);
		
		try {
			reservationList = session.selectList("mapper.reservation.selectReservationHistory",params);
			this.totalCount = session.selectOne("mapper.reservation.countAllGoods");
		}finally {
			session.close();
		}
		return reservationList;
	}
	
	@Override
	public List<GoodsVO> selectCalHistory(long date1, long date2, int offset, int count, String uid) throws DataAccessException{
		List<GoodsVO> reservationList = new ArrayList<GoodsVO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("date1", date1);
		params.put("date2", date2);
		params.put("offset", offset);
		params.put("count", count);
		params.put("uid", uid);
		
		try {
			reservationList = session.selectList("mapper.reservation.selectCalHistory",params);
			this.totalCount = session.selectOne("mapper.reservation.countAllGoods");
		}finally {
			session.close();
		}
		return reservationList;
	}
	
	@Override 
	public int selectBusinessPoint(String uid) throws DataAccessException{
		int businessPoint = sqlSession.selectOne("mapper.reservation.selectBusinessPoint", uid);
		return businessPoint;
	}
	
	@Override
	public List selectSalesHistory(String uid, int term) throws DataAccessException{
		List salesList = new ArrayList();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("uid", uid);
		params.put("term", term);
		
		try {
			salesList = session.selectList("mapper.reservation.selectSalesHistory",params);
		}finally {
			session.close();
		}
		return salesList;
	}
	
	@Override
	public List<GoodsVO> selectReservationBusinessMain(int offset, int count, String uid) throws DataAccessException{
		List<GoodsVO> reservationList = new ArrayList<GoodsVO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("offset", offset);
		params.put("count", count);
		params.put("uid", uid);
		
		try {
			reservationList = session.selectList("mapper.reservation.selectReservationBusinessMain",params);
			this.totalCount = session.selectOne("mapper.reservation.countAllGoods");
		}finally {
			session.close();
		}
		return reservationList;
	}
	
	@Override
	public List selectReservationCountBusinessMain(String uid) throws DataAccessException{
		List CountList = new ArrayList();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("uid", uid);
		
		try {
			CountList = session.selectList("mapper.reservation.selectReservationCountBusinessMain",params);
		}finally {
			session.close();
		}
		return CountList;
	}
}
