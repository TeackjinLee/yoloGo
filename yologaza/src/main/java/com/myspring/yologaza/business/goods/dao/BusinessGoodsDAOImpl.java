package com.myspring.yologaza.business.goods.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.goods.vo.GoodsVO;

@Repository("businessGoodsDAO")
public class BusinessGoodsDAOImpl implements BusinessGoodsDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<GoodsVO>selectNewGoodsList(Map condMap) throws DataAccessException {
		ArrayList goodsList=(ArrayList)sqlSession.selectList("mapper.business.goods.selectNewGoodsList", condMap);
		return goodsList;
	}

}
