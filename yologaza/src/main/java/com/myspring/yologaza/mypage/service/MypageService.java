package com.myspring.yologaza.mypage.service;

import java.util.Map;

import com.myspring.yologaza.member.vo.MemberVO;

public interface MypageService {

	public MemberVO  modifyMyInfo(Map memberMap) throws Exception;
}
