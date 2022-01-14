package com.myspring.yologaza.reservation.vo;

import java.sql.Date;

public class ReservationVO {
	private int rid;
	private int goodes_id;
	private int goods_uroom;
	private int price;
	private Date checkIn;
	private Date checkOut;
	private Date rDate;
	
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getGoodes_id() {
		return goodes_id;
	}
	public void setGoodes_id(int goodes_id) {
		this.goodes_id = goodes_id;
	}
	public int getGoods_uroom() {
		return goods_uroom;
	}
	public void setGoods_uroom(int goods_uroom) {
		this.goods_uroom = goods_uroom;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	public Date getrDate() {
		return rDate;
	}
	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}
	
}
