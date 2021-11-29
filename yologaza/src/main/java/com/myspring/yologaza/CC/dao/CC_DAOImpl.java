package com.myspring.yologaza.CC.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("cc_DAO")
public class CC_DAOImpl implements CC_DAO{
	@Autowired
	private SqlSession sqlSession;
	
}