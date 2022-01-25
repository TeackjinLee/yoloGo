package com.myspring.yologaza.admin.goods.dao;

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

@Repository("adminGoodsDAO")
public class AdminGoodsDAOImpl implements AdminGoodsDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	int totalCount;
	
	public int getTotalCount() {
		return totalCount;
	}
	
	@Override
	public List<GoodsVO> selectAllGoodsList(long date1, long date2, int offset, int count) throws DataAccessException {
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		SqlSession session = sqlSessionFactory.openSession();
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		params.put("date1", date1);
		params.put("date2", date2);
		params.put("offset", offset);
		params.put("count", count);
		
		try {
			goodsList = session.selectList("mapper.admin.goods.selectAllGoodsList",params);
			this.totalCount = session.selectOne("mapper.admin.goods.countGoods");
		}finally {
			session.close();
		}
		return goodsList;
	}
	
	@Override
	public void updateGoodsAcess(Map GoodsAcessMap) throws DataAccessException{
		sqlSession.update("mapper.admin.goods.updateGoodsAcess",GoodsAcessMap);
	}
	
	@Override
	public void updateMemberAcess(Map GoodsAcessMap) throws DataAccessException{
		sqlSession.update("mapper.admin.goods.updateMemberAcess",GoodsAcessMap);
	}
}
