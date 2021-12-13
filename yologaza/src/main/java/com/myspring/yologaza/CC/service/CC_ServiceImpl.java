package com.myspring.yologaza.CC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.CC.dao.CC_DAO;
import com.myspring.yologaza.CC.vo.Announce_VO;

@Service("cc_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class CC_ServiceImpl implements CC_Service{
	@Autowired
	private CC_DAO cc_DAO;
	
	public List<Announce_VO> listAnnounce() throws Exception{
		List<Announce_VO> announceList =  cc_DAO.selectAllAnnounceList();
        return announceList;
	}
	
	@Override
	public Announce_VO viewAnnounce(int articleNo) throws Exception {
		Announce_VO announce_VO = cc_DAO.selectAnnounce(articleNo);
		return announce_VO;
	}
}
