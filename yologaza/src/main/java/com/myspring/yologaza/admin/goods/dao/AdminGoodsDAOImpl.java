package com.myspring.yologaza.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("adminGoodsDAO")
public class AdminGoodsDAOImpl implements AdminGoodsDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllGoodsList() throws DataAccessException {
		List goodsList = null;
		goodsList = sqlSession.selectList("mapper.admin.goods.selectAllGoodsList");
		return goodsList;
	}
	
	@Override
	public void updateGoodsAcess(Map GoodsAcessMap) throws DataAccessException{
		sqlSession.update("mapper.admin.goods.updateGoodsAcess",GoodsAcessMap);
	}
}
