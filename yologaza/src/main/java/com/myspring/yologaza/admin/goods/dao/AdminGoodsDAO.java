package com.myspring.yologaza.admin.goods.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.goods.vo.GoodsVO;

public interface AdminGoodsDAO {
	public int getTotalCount();

	public List<GoodsVO> selectAllGoodsList(long date1, long date2, int offset, int count) throws DataAccessException;

	public void updateGoodsAcess(Map GoodsAcessMap) throws DataAccessException;

	public void updateMemberAcess(Map GoodsAcessMap) throws DataAccessException;

}
