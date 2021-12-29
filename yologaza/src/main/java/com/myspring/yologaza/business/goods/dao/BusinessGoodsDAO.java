package com.myspring.yologaza.business.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.goods.vo.GoodsVO;

public interface BusinessGoodsDAO {

	public List<GoodsVO>selectNewGoodsList(Map condMap) throws DataAccessException;

}
