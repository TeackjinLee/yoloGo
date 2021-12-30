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
	public List<Announce_VO> selectAnnounceList(int auth, int offset, int count) throws DataAccessException;
	public List<Frequent_VO> selectFrequentList(int auth) throws DataAccessException;
	public Announce_VO selectAnnounce(int articleNo) throws DataAccessException;
	public int insertNewQuestion(Map questionMap) throws DataAccessException;
	public int insertNewAnnounce(Map announceMap) throws DataAccessException;
	public int insertNewFrequent(Map frequentMap) throws DataAccessException;
	public List<Question_VO> selectInPersonQuestion(int offset, int count, String id) throws DataAccessException;
	public List<Question_VO> selectInPersonReply(List<Question_VO> questionList) throws DataAccessException;
}