package com.myspring.yologaza.business.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.business.goods.dao.BusinessGoodsDAO;
import com.myspring.yologaza.goods.vo.GoodsVO;

@Service("businessGoodsService")
@Transactional(propagation=Propagation.REQUIRED)
public class BusinessGoodsServiceImpl implements BusinessGoodsService {
	@Autowired
	private BusinessGoodsDAO businessGoodsDAO;
	
	@Override
	public List<GoodsVO> listNewGoods(Map condMap) throws Exception{
		return businessGoodsDAO.selectNewGoodsList(condMap);
	}
}
