package com.myspring.yologaza.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.yologaza.admin.goods.dao.AdminGoodsDAO;
import com.myspring.yologaza.admin.goods.dao.AdminGoodsDAO;

@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService{
	@Autowired
	private AdminGoodsDAO adminGoodsDAO;
	
	@Override
	public List listGoods() throws DataAccessException{
		List listGoods = null;
		listGoods = adminGoodsDAO.selectAllGoodsList();
		return listGoods;
	}
	
	@Override
	public void updateGoodsAcess(Map GoodsAcessMap) throws Exception{
		adminGoodsDAO.updateGoodsAcess(GoodsAcessMap);
	}
}
