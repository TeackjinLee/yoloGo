package com.myspring.yologaza.goods.vo;

public class ImageFileVO {
	private int goods_id;
	private String goodsRoom;
	private String fileName;
	private char auth;
	private String fileType;
	

	public ImageFileVO() {
		super();
	}


	public int getGoods_id() {
		return goods_id;
	}


	public void setGoods_id(int goods_id) {
		this.goods_id = goods_id;
	}


	public String getGoodsRoom() {
		return goodsRoom;
	}


	public void setGoodsRoom(String goodsRoom) {
		this.goodsRoom = goodsRoom;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public char getAuth() {
		return auth;
	}


	public void setAuth(char auth) {
		this.auth = auth;
	}


	public String getFileType() {
		return fileType;
	}


	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
		
}
