package com.myspring.yologaza.goods.vo;

public class ImageFileVO {
	private int goods_id;
	private int goods_uroom;
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

	public int getGoods_uroom() {
		return goods_uroom;
	}

	public void setGoods_uroom(int goods_uroom) {
		this.goods_uroom = goods_uroom;
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
