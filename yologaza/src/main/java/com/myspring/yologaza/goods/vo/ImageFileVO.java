package com.myspring.yologaza.goods.vo;

public class ImageFileVO {
	private int goods_id;
	private int goodsRoom;
	private String fileName;
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

	public int getGoodsRoom() {
		return goodsRoom;
	}

	public void setGoodsRoom(int goodsRoom) {
		this.goodsRoom = goodsRoom;
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
