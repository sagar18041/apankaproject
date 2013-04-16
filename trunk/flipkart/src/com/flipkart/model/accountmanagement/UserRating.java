package com.flipkart.model.accountmanagement;

public class UserRating {
	
	private int productID;
	private int ratingStar;
	private String productName;
	private String price;
	private String thumbnail;
	
	
	public int getProductID() {
		return productID;
	}
	
	public void setProductID(int productID) {
		this.productID = productID;
	}
	
	public int getRatingStar() {
		return ratingStar;
	}
	
	public void setRatingStar(int ratingStar) {
		this.ratingStar = ratingStar;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	

}
