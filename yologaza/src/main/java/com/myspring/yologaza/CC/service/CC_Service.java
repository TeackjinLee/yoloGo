package com.myspring.yologaza.CC.service;

import java.util.List;

import com.myspring.yologaza.CC.dao.CC_DAO;
import com.myspring.yologaza.CC.vo.Announce_VO;

public interface CC_Service {

	public CC_DAO getCC_DAO();
	public List<Announce_VO> listAnnounce(int offset, int count) throws Exception;
	public Announce_VO viewAnnounce(int articleNo) throws Exception;
}
