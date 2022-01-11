package com.myspring.yologaza.admin.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface AdminGoodsService {

	public List listGoods() throws DataAccessException;

	public void updateGoodsAcess(Map GoodsAcessMap) throws Exception;

}
