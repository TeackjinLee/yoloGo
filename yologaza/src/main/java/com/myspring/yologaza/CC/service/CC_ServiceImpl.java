package com.myspring.yologaza.CC.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.member.dao.MemberDAO;

@Service("cc_Service")
@Transactional(propagation = Propagation.REQUIRED)
public class CC_ServiceImpl implements CC_Service{
	@Autowired
	private MemberDAO memberDAO;
	
	
}
