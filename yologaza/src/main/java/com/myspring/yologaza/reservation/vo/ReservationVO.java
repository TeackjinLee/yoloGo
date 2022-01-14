package com.myspring.yologaza.reservation.vo;

import java.sql.Date;

public class ReservationVO {
	private int rid;
	private int uid;
	private int goods_uroom;
	private String name;
	private String hp;
	private String goods_hp;
	private String goods_name;
	private String goodsType;
	private int rePrice;
	private String card_select;
	private Date checkInDate;
	private Date checkOutDate;
	private String account;
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getGoods_uroom() {
		return goods_uroom;
	}
	public void setGoods_uroom(int goods_uroom) {
		this.goods_uroom = goods_uroom;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getGoods_hp() {
		return goods_hp;
	}
	public void setGoods_hp(String goods_hp) {
		this.goods_hp = goods_hp;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(String goodsType) {
		this.goodsType = goodsType;
	}
	public int getRePrice() {
		return rePrice;
	}
	public void setRePrice(int rePrice) {
		this.rePrice = rePrice;
	}
	public String getCard_select() {
		return card_select;
	}
	public void setCard_select(String card_select) {
		this.card_select = card_select;
	}
	public Date getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}
	public Date getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	
}
