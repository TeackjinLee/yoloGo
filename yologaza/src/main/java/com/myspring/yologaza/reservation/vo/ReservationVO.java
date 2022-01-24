package com.myspring.yologaza.reservation.vo;

import java.sql.Date;

public class ReservationVO {
	private int rid;
	private int uid;
	private String name;
	private String hp;
	private int goods_id;
	private int goods_uroom;
	private String goods_hp;
	private String goods_name;
	private String zipcode;
	private String roadAddress;
	private String jibunAddress;
	private String namujiAddress;
	private String goods_checkIn;
	private String goods_checkOut;
	private String goods_motel_endtime;
	private String goods_motel_usetime;
	private String fileName;
	private int price;
	private Date checkIn;
	private Date checkOut;
	private Date rDate;
	private String goods_room_type;
	
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
	public int getGoods_id() {
		return goods_id;
	}
	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}
	public int getGoods_uroom() {
		return goods_uroom;
	}
	public void setGoods_uroom(int goods_uroom) {
		this.goods_uroom = goods_uroom;
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
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getJibunAddress() {
		return jibunAddress;
	}
	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}
	public String getNamujiAddress() {
		return namujiAddress;
	}
	public void setNamujiAddress(String namujiAddress) {
		this.namujiAddress = namujiAddress;
	}
	public String getGoods_checkIn() {
		return goods_checkIn;
	}
	public void setGoods_checkIn(String goods_checkIn) {
		this.goods_checkIn = goods_checkIn;
	}
	public String getGoods_checkOut() {
		return goods_checkOut;
	}
	public void setGoods_checkOut(String goods_checkOut) {
		this.goods_checkOut = goods_checkOut;
	}
	public String getGoods_motel_endtime() {
		return goods_motel_endtime;
	}
	public void setGoods_motel_endtime(String goods_motel_endtime) {
		this.goods_motel_endtime = goods_motel_endtime;
	}
	public String getGoods_motel_usetime() {
		return goods_motel_usetime;
	}
	public void setGoods_motel_usetime(String goods_motel_usetime) {
		this.goods_motel_usetime = goods_motel_usetime;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	public String getGoods_room_type() {
		return goods_room_type;
	}
	public void setGoods_room_type(String goods_room_type) {
		this.goods_room_type = goods_room_type;
	}
	
}
