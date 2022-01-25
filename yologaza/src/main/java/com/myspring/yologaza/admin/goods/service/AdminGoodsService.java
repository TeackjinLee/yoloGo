package com.myspring.yologaza.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.admin.goods.dao.AdminGoodsDAO;
import com.myspring.yologaza.goods.vo.GoodsVO;

public interface AdminGoodsService {
	public AdminGoodsDAO getAdminGoodsDAO();

	public List<GoodsVO> listGoods(long date1, long date2, int offset, int count) throws DataAccessException;

	public void updateGoodsAcess(Map GoodsAcessMap) throws Exception;

	public void updateMemberAcess(Map GoodsAcessMap) throws Exception;

}
