package com.myspring.yologaza.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface AdminGoodsDAO {

	public List selectAllGoodsList() throws DataAccessException;

	public void updateGoodsAcess(Map GoodsAcessMap) throws DataAccessException;

}
