package com.myspring.yologaza.CC.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.CC.dao.CC_DAO;
import com.myspring.yologaza.CC.vo.Announce_VO;
import com.myspring.yologaza.CC.vo.Frequent_VO;
import com.myspring.yologaza.CC.vo.Question_VO;

@Service("cc_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class CC_ServiceImpl implements CC_Service{
	@Autowired
	CC_DAO cc_DAO;
	
	@Override
	public CC_DAO getCC_DAO() {
		return cc_DAO;
	}
	
	@Override
	public List<Announce_VO> listAnnounce(int offset, int count) throws Exception{
		return cc_DAO.selectAnnounceList(offset, count);
	}
	
	@Override
	public List<Frequent_VO> listFrequent() throws Exception{
		return cc_DAO.selectFrequentList();
	}
	
	@Override
	public List<Question_VO> listQuestion(int offset, int count, String id) throws Exception{
		return cc_DAO.selectInPersonQuestion(offset, count, id);
	}
	
	@Override
	public Question_VO listReply(int articleNo) throws Exception{
		Question_VO question_VO = cc_DAO.selectReply(articleNo);
		return question_VO;
	}
	
	@Override
	public Announce_VO viewAnnounce(int articleNo) throws Exception {
		Announce_VO announce_VO = cc_DAO.selectAnnounce(articleNo);
		return announce_VO;
	}
	
	@Override
	public int addQuestion(Map questionMap) throws Exception{
		return cc_DAO.insertNewQuestion(questionMap);
	}
}
