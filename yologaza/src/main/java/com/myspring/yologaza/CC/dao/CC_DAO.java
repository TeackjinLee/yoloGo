package com.myspring.yologaza.CC.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.CC.vo.Announce_VO;
import com.myspring.yologaza.CC.vo.Frequent_VO;
import com.myspring.yologaza.CC.vo.Question_VO;

public interface CC_DAO {
	public int getTotalCount();
	public int getCountPerId();
	public List selectAnnounceList(int offset, int count) throws DataAccessException;
	public List<Frequent_VO> selectFrequentList() throws DataAccessException;
	public Announce_VO selectAnnounce(int articleNo) throws DataAccessException;
	public int insertNewQuestion(Map questionMap) throws DataAccessException;
	public List<Question_VO> selectInPersonQuestion(int offset, int count, String id) throws DataAccessException;
	public Question_VO selectReply(int articleNo) throws DataAccessException;
}