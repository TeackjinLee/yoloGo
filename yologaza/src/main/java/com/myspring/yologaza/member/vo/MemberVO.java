package com.myspring.yologaza.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String uid;
	private String id;
	private String pwd;
	private String name;
	private String nickName;
	private String email1;
	private String email2;
	private String hp;
	private String auth;
	private String detail1;
	private String detail2;
	private String memFileName;
	private String kakaoImg;
	private int member_point;
	private int business_point;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public String getDetail1() {
		return detail1;
	}

	public void setDetail1(String detail1) {
		this.detail1 = detail1;
	}

	public String getDetail2() {
		return detail2;
	}

	public void setDetail2(String detail2) {
		this.detail2 = detail2;
	}

	public String getMemFileName() {
		return memFileName;
	}

	public void setMemFileName(String memFileName) {
		this.memFileName = memFileName;
	}

	public String getKakaoImg() {
		return kakaoImg;
	}

	public void setKakaoImg(String kakaoImg) {
		this.kakaoImg = kakaoImg;
	}

	public int getMember_point() {
		return member_point;
	}

	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}

	public int getBusiness_point() {
		return business_point;
	}

	public void setBusiness_point(int business_point) {
		this.business_point = business_point;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	
}
