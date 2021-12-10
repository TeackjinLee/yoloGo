package com.myspring.yologaza.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String uid;
	private String id;
	private String pwd;
	private String name;
	private String email1;
	private String email2;
	private String hp;
	private String auth;
	private Date joinDate;
	
	public MemberVO() {
		
	}

	public MemberVO(String uid, String id, String pwd, String name, String email1, String email2, String hp, String auth) {
		this.uid = uid;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email1 = email1;
		this.email2 = email2;
		this.hp = hp;
		this.auth = auth;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
}
