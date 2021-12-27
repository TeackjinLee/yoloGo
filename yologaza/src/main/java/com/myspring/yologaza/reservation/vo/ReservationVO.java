package com.myspring.yologaza.reservation.vo;

import java.sql.Date;

public class ReservationVO {
	private int reservation_num;
	private int uid;
	private int goods_uroom;
	private String name;
	private String hp;
	private Date checkInDate;
	private Date checkOutDate;
	private Date reservationDate;
	public int getReservation_num() {
		return reservation_num;
	}
	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
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
	public Date getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}
}
