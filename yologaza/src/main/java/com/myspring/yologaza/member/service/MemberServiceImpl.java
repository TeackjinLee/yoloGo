package com.myspring.yologaza.member.service;

import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.yologaza.member.dao.MemberDAO;
import com.myspring.yologaza.member.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	@Override
	public int removeMember(String id) throws DataAccessException {
		return memberDAO.deleteMember(id);
	}
	@Override
	public MemberVO login(MemberVO memberVO) {
		return memberDAO.loginById(memberVO);
	}
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}
	@Override
	public List<MemberVO> findId(String hp) throws Exception {
		return memberDAO.findId(hp);
	}
	@Override
	public int findIdCheck(String hp) throws Exception {
		return  memberDAO.findIdCheck(hp);
	}

	@Override
	public void certifiedhpNumber(String userhpNumber, int randomNumber) {
	
	    String api_key = "NCSLV2XOTGGJEVIN";
	    String api_secret = "OJLWVOHLPE1FKBKNI8EFTP3AOCUDZWSE";
	    Message coolsms = new Message(api_key, api_secret);
	
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userhpNumber);    // 수신전화번호
	    params.put("from", "01026158643");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "[TEST] 휴대폰인증 테스트 메시지 : 인증번호는" + "["+randomNumber+"]" + "입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version
	
	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	    }
	
	}
	
}
