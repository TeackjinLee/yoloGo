package com.myspring.yologaza.sms.service;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class certificationService {
	public static void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) { 
		String api_key = "NCSLV2XOTGGJEVIN"; 
		String api_secret = "OJLWVOHLPE1FKBKNI8EFTP3AOCUDZWSE"; 
		Message coolsms = new Message(api_key, api_secret); 
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>(); 
		params.put("to", userPhoneNumber); // 수신전화번호 
		params.put("from", "01026158643"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		params.put("type", "SMS"); params.put("text", "YOLO가자! 회원가입 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력 
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
