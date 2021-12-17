package com.myspring.yologaza.CC.service;

import java.util.List;
import java.util.Map;

import com.myspring.yologaza.CC.dao.CC_DAO;
import com.myspring.yologaza.CC.vo.Announce_VO;
import com.myspring.yologaza.CC.vo.Frequent_VO;
import com.myspring.yologaza.CC.vo.Question_VO;

public interface CC_Service {

	public CC_DAO getCC_DAO();
	public List<Announce_VO> listAnnounce(int offset, int count) throws Exception;
	public List<Frequent_VO> listFrequent() throws Exception;
	public Announce_VO viewAnnounce(int articleNo) throws Exception;
	public int addQuestion(Map questionMap) throws Exception;
	public List<Question_VO> listQuestion(int offset, int count, String id) throws Exception;
	public Question_VO listReply(int articleNo) throws Exception;
}
