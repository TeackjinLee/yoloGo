package com.myspring.yologaza.cart.vo;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	private String id;
	private int goods_uroom;
	private int cart_uid;
	private int cart_goods_qty;
	private String creaDatetime;
	
	
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
	public String getCreaDatetime() {
		return creaDatetime;
	}
	public void setCreaDatetime(String creaDatetime) {
		this.creaDatetime = creaDatetime;
	}
	
}
