package com.flipkart.model.browseitem;

public class Rating {
	private Integer ratingStar;
	private Integer UserID;
	private Integer ProductID;
	public Integer getRatingStar() {
		return ratingStar;
	}
	public void setRatingStar(Integer ratingStar) {
		this.ratingStar = ratingStar;
	}
	public Integer getUserID() {
		return UserID;
	}
	public void setUserID(Integer userID) {
		UserID = userID;
	}
	public Integer getProductID() {
		return ProductID;
	}
	public void setProductID(Integer productID) {
		ProductID = productID;
	}
}
