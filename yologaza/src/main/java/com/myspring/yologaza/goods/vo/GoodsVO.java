package com.myspring.yologaza.goods.vo;

import java.sql.Date;
import java.sql.Time;

public class GoodsVO {
	// goods
	private int goods_id;
	private String goods_type;
	private String goods_email1;
	private String goods_email2;
	private String goods_hp;
	private String goods_tel1;
	private String goods_tel2;
	private String goods_tel3;
	private String account_bank;
	private String account_name;
	private String account;
	private String goods_homePage;
	private String goods_name;
	private String goods_address;
	private String goods_description;
	private String goods_around;
	private Time   goods_checkIn;
	private Time   goods_checkOut;
	private int goods_price1;
	private int goods_price2;
	private char   goods_acess;
	private Date   goods_creDate;
	
	// goods_detail
	private String goods_room;
	private String goods_room_name;
	private String goods_room_type;
	private String goods_capacity;
	private String goods_introduce;
	private String goods_room_creDate;
	
	// goods_peak
	private String peak_id;
	private Date peak1;
	private Date peak2;
	private Date Mpeak1;
	private Date Mpeak2;
	
	// goods_service
	private String goods_service;
	
	// goods_img
	private String fileName;
	private String fileType;
	
	public GoodsVO() {
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoods_type() {
		return goods_type;
	}

	public void setGoods_type(String goods_type) {
		this.goods_type = goods_type;
	}

	public String getGoods_email1() {
		return goods_email1;
	}

	public void setGoods_email1(String goods_email1) {
		this.goods_email1 = goods_email1;
	}

	public String getGoods_email2() {
		return goods_email2;
	}

	public void setGoods_email2(String goods_email2) {
		this.goods_email2 = goods_email2;
	}

	public String getGoods_hp() {
		return goods_hp;
	}

	public void setGoods_hp(String goods_hp) {
		this.goods_hp = goods_hp;
	}

	public String getGoods_tel1() {
		return goods_tel1;
	}

	public void setGoods_tel1(String goods_tel1) {
		this.goods_tel1 = goods_tel1;
	}

	public String getGoods_tel2() {
		return goods_tel2;
	}

	public void setGoods_tel2(String goods_tel2) {
		this.goods_tel2 = goods_tel2;
	}

	public String getGoods_tel3() {
		return goods_tel3;
	}

	public void setGoods_tel3(String goods_tel3) {
		this.goods_tel3 = goods_tel3;
	}

	public String getAccount_bank() {
		return account_bank;
	}

	public void setAccount_bank(String account_bank) {
		this.account_bank = account_bank;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getGoods_homePage() {
		return goods_homePage;
	}

	public void setGoods_homePage(String goods_homePage) {
		this.goods_homePage = goods_homePage;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getGoods_address() {
		return goods_address;
	}

	public void setGoods_address(String goods_address) {
		this.goods_address = goods_address;
	}

	public String getGoods_description() {
		return goods_description;
	}

	public void setGoods_description(String goods_description) {
		this.goods_description = goods_description;
	}

	public String getGoods_around() {
		return goods_around;
	}

	public void setGoods_around(String goods_around) {
		this.goods_around = goods_around;
	}

	public Time getGoods_checkIn() {
		return goods_checkIn;
	}

	public void setGoods_checkIn(Time goods_checkIn) {
		this.goods_checkIn = goods_checkIn;
	}

	public Time getGoods_checkOut() {
		return goods_checkOut;
	}

	public void setGoods_checkOut(Time goods_checkOut) {
		this.goods_checkOut = goods_checkOut;
	}

	public char getGoods_acess() {
		return goods_acess;
	}

	public void setGoods_acess(char goods_acess) {
		this.goods_acess = goods_acess;
	}

	public Date getGoods_creDate() {
		return goods_creDate;
	}

	public void setGoods_creDate(Date goods_creDate) {
		this.goods_creDate = goods_creDate;
	}

	public String getGoods_room() {
		return goods_room;
	}

	public void setGoods_room(String goods_room) {
		this.goods_room = goods_room;
	}

	public String getGoods_room_name() {
		return goods_room_name;
	}

	public void setGoods_room_name(String goods_room_name) {
		this.goods_room_name = goods_room_name;
	}

	public String getGoods_room_type() {
		return goods_room_type;
	}

	public void setGoods_room_type(String goods_room_type) {
		this.goods_room_type = goods_room_type;
	}

	public String getGoods_capacity() {
		return goods_capacity;
	}

	public void setGoods_capacity(String goods_capacity) {
		this.goods_capacity = goods_capacity;
	}

	public String getGoods_introduce() {
		return goods_introduce;
	}

	public void setGoods_introduce(String goods_introduce) {
		this.goods_introduce = goods_introduce;
	}

	public int getGoods_price1() {
		return goods_price1;
	}

	public void setGoods_price1(int goods_price1) {
		this.goods_price1 = goods_price1;
	}

	public int getGoods_price2() {
		return goods_price2;
	}

	public void setGoods_price2(int goods_price2) {
		this.goods_price2 = goods_price2;
	}

	public String getGoods_room_creDate() {
		return goods_room_creDate;
	}

	public void setGoods_room_creDate(String goods_room_creDate) {
		this.goods_room_creDate = goods_room_creDate;
	}

	public String getPeak_id() {
		return peak_id;
	}

	public void setPeak_id(String peak_id) {
		this.peak_id = peak_id;
	}

	public Date getPeak1() {
		return peak1;
	}

	public void setPeak1(Date peak1) {
		this.peak1 = peak1;
	}

	public Date getPeak2() {
		return peak2;
	}

	public void setPeak2(Date peak2) {
		this.peak2 = peak2;
	}

	public Date getMpeak1() {
		return Mpeak1;
	}

	public void setMpeak1(Date mpeak1) {
		Mpeak1 = mpeak1;
	}

	public Date getMpeak2() {
		return Mpeak2;
	}

	public void setMpeak2(Date mpeak2) {
		Mpeak2 = mpeak2;
	}

	public String getGoods_service() {
		return goods_service;
	}

	public void setGoods_service(String goods_service) {
		this.goods_service = goods_service;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

}
