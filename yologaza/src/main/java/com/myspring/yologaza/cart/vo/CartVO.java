package com.myspring.yologaza.cart.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	private String id;
	private int goods_uroom;
	private int cart_uid;
	private int cart_goods_qty;
	private double price;
	private String checkIn;
	private String checkOut;
	private Date creaDatetime;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getGoods_uroom() {
		return goods_uroom;
	}
	public void setGoods_uroom(int goods_uroom) {
		this.goods_uroom = goods_uroom;
	}
	public int getCart_uid() {
		return cart_uid;
	}
	public void setCart_uid(int cart_uid) {
		this.cart_uid = cart_uid;
	}
	public int getCart_goods_qty() {
		return cart_goods_qty;
	}
	public void setCart_goods_qty(int cart_goods_qty) {
		this.cart_goods_qty = cart_goods_qty;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public Date getCreaDatetime() {
		return creaDatetime;
	}
	public void setCreaDatetime(Date creaDatetime) {
		this.creaDatetime = creaDatetime;
	}
	
}
