package com.myspring.yologaza.goods.vo;

public class ImageFileVO {
	private int goods_uimg;
	private int goods_id;
	private int goods_uroom;
	private int goods_uroom_detail;
	private String fileName;
	private String fileType;
	private String reg_id;
	
	public ImageFileVO() {
		super();
	}

	public int getGoods_uimg() {
		return goods_uimg;
	}


	public void setGoods_uimg(int goods_uimg) {
		this.goods_uimg = goods_uimg;
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

	public int getGoods_uroom_detail() {
		return goods_uroom_detail;
	}

	public void setGoods_uroom_detail(int goods_uroom_detail) {
		this.goods_uroom_detail = goods_uroom_detail;
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

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

}
