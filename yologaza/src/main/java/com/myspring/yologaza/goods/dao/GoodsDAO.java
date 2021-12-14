package com.myspring.yologaza.goods.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.goods.vo.GoodsVO;

public interface GoodsDAO {

	public List<GoodsVO> selectGoodsList(String goods_type ) throws DataAccessException;

}
