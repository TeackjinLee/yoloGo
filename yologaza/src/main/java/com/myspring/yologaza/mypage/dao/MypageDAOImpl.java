package com.myspring.yologaza.mypage.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.yologaza.member.vo.MemberVO;

@Repository("mypageDAO")
public class MypageDAOImpl implements MypageDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void updateMyInfo(Map memberMap) throws DataAccessException{
		sqlSession.update("mapper.member.updateMyInfo",memberMap);
	}
	@Override
	public MemberVO selectMyDetailInfo(String id) throws DataAccessException{
		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.member.selectMyDetailInfo",id);
		return memberVO;
		
	}

	
}