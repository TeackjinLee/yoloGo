package com.myspring.yologaza.CC.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.yologaza.CC.vo.Announce_VO;

public interface CC_DAO {
	public List selectAllAnnounceList() throws DataAccessException;
	public Announce_VO selectAnnounce(int articleNo) throws DataAccessException;
}