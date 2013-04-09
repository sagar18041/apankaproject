package com.flipkart.model.browseitem;

public class Rating {
	private Integer ratingStar;
	private String userName;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getRatingStar() {
		return ratingStar;
	}
	public void setRatingStar(Integer ratingStar) {
		this.ratingStar = ratingStar;
	}
}
