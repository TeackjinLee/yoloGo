package com.myspring.yologaza.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.yologaza.admin.goods.dao.AdminGoodsDAO;
import com.myspring.yologaza.goods.vo.GoodsVO;

@Service("adminGoodsService")
public class AdminGoodsServiceImpl implements AdminGoodsService{
	@Autowired
	private AdminGoodsDAO adminGoodsDAO;

	public AdminGoodsDAO getAdminGoodsDAO() {
		return adminGoodsDAO;
	}
	@Override
	public List<GoodsVO> listGoods(long date1, long date2, int offset, int count) throws DataAccessException{
		return adminGoodsDAO.selectAllGoodsList(date1, date2, offset, count);
	}
	
	@Override
	public void updateGoodsAcess(Map GoodsAcessMap) throws Exception{
		adminGoodsDAO.updateGoodsAcess(GoodsAcessMap);
	}
	
	@Override
	public void updateMemberAcess(Map GoodsAcessMap) throws Exception{
		adminGoodsDAO.updateMemberAcess(GoodsAcessMap);
	}
}
