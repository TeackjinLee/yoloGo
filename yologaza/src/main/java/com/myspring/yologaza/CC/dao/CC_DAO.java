package com.myspring.yologaza.CC.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface CC_DAO {
	public List selectAllAnnounceList() throws DataAccessException;
}