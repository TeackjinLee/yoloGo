package com.myspring.yologaza.goods.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("goodsDAO")
public class GoodsDAOImpl implements GoodsDAO {
	@Autowired
	private SqlSession sqlSession;
}
