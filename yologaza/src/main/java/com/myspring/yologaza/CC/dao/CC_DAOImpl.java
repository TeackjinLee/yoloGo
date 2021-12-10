package com.myspring.yologaza.CC.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.CC.vo.Announce_VO;

@Repository("cc_DAO")
public class CC_DAOImpl implements CC_DAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<Announce_VO> selectAllAnnounceList() throws DataAccessException {
		List<Announce_VO> announceList = announceList = sqlSession.selectList("mapper.CC.selectAllAnnounceList");
		return announceList;
	}
	
	@Override
	public Announce_VO selectAnnounce(int articleNo) throws DataAccessException {
		return sqlSession.selectOne("mapper.CC.selectAnnounce", articleNo);
	}
}