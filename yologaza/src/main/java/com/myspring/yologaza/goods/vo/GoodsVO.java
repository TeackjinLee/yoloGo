package com.myspring.yologaza.goods.vo;

import java.sql.Date;
import java.sql.Time;

public class GoodsVO {
	// goods
	private int goods_id;
	private String goodsEmail1;
	private String goodsEmail2;
	private String goodsHp;
	private String goodsTel1;
	private String goodsTel2;
	private String goodsTel3;
	private String account_bank;
	private String account_name;
	private String account;
	private String goods_homePage;
	private String goodsName;
	private String goodsAddress;
	private String goodsDescription;
	private Time goodsCheckIn;
	private Time goodsCheckOut;
	private char goodsAcess;
	private Date goodsCreDate;
	// goods_detail
	private String goodsRoom;
	private String goodsRoomName;
	private String goodsType;
	private String goodsCapacity;
	private String goodsIntroduce;
	private int goodsPrice1;
	private int goodsPrice2;
	private Date goodsRoomCreDate;
	// goods_peak
	private int peak_id;
	private Date peak1;
	private Date peak2;
	private Date Mpeak1;
	private Date Mpeak2;
	// goods_service
	private String goodsService;

	public GoodsVO() {
	}

	public int getGoods_id() {
		return goods_id;
	}

	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}

	public String getGoodsEmail1() {
		return goodsEmail1;
	}

	public void setGoodsEmail1(String goodsEmail1) {
		this.goodsEmail1 = goodsEmail1;
	}

	public String getGoodsEmail2() {
		return goodsEmail2;
	}

	public void setGoodsEmail2(String goodsEmail2) {
		this.goodsEmail2 = goodsEmail2;
	}

	public String getGoodsHp() {
		return goodsHp;
	}

	public void setGoodsHp(String goodsHp) {
		this.goodsHp = goodsHp;
	}

	public String getGoodsTel1() {
		return goodsTel1;
	}

	public void setGoodsTel1(String goodsTel1) {
		this.goodsTel1 = goodsTel1;
	}

	public String getGoodsTel2() {
		return goodsTel2;
	}

	public void setGoodsTel2(String goodsTel2) {
		this.goodsTel2 = goodsTel2;
	}

	public String getGoodsTel3() {
		return goodsTel3;
	}

	public void setGoodsTel3(String goodsTel3) {
		this.goodsTel3 = goodsTel3;
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

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsAddress() {
		return goodsAddress;
	}

	public void setGoodsAddress(String goodsAddress) {
		this.goodsAddress = goodsAddress;
	}

	public String getGoodsDescription() {
		return goodsDescription;
	}

	public void setGoodsDescription(String goodsDescription) {
		this.goodsDescription = goodsDescription;
	}

	public Time getGoodsCheckIn() {
		return goodsCheckIn;
	}

	public void setGoodsCheckIn(Time goodsCheckIn) {
		this.goodsCheckIn = goodsCheckIn;
	}

	public Time getGoodsCheckOut() {
		return goodsCheckOut;
	}

	public void setGoodsCheckOut(Time goodsCheckOut) {
		this.goodsCheckOut = goodsCheckOut;
	}

	public char getGoodsAcess() {
		return goodsAcess;
	}

	public void setGoodsAcess(char goodsAcess) {
		this.goodsAcess = goodsAcess;
	}

	public Date getGoodsCreDate() {
		return goodsCreDate;
	}

	public void setGoodsCreDate(Date goodsCreDate) {
		this.goodsCreDate = goodsCreDate;
	}

	public String getGoodsRoom() {
		return goodsRoom;
	}

	public void setGoodsRoom(String goodsRoom) {
		this.goodsRoom = goodsRoom;
	}

	public String getGoodsRoomName() {
		return goodsRoomName;
	}

	public void setGoodsRoomName(String goodsRoomName) {
		this.goodsRoomName = goodsRoomName;
	}

	public String getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}

	public String getGoodsCapacity() {
		return goodsCapacity;
	}

	public void setGoodsCapacity(String goodsCapacity) {
		this.goodsCapacity = goodsCapacity;
	}

	public String getGoodsIntroduce() {
		return goodsIntroduce;
	}

	public void setGoodsIntroduce(String goodsIntroduce) {
		this.goodsIntroduce = goodsIntroduce;
	}

	public int getGoodsPrice1() {
		return goodsPrice1;
	}

	public void setGoodsPrice1(int goodsPrice1) {
		this.goodsPrice1 = goodsPrice1;
	}

	public int getGoodsPrice2() {
		return goodsPrice2;
	}

	public void setGoodsPrice2(int goodsPrice2) {
		this.goodsPrice2 = goodsPrice2;
	}

	public Date getGoodsRoomCreDate() {
		return goodsRoomCreDate;
	}

	public void setGoodsRoomCreDate(Date goodsRoomCreDate) {
		this.goodsRoomCreDate = goodsRoomCreDate;
	}

	public int getPeak_id() {
		return peak_id;
	}

	public void setPeak_id(int peak_id) {
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

	public String getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(String goodsService) {
		this.goodsService = goodsService;
	}
	
}
