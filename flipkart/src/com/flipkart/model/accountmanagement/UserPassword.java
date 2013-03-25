package com.flipkart.model.accountmanagement;

public class UserPassword {
	
	private int userID;
	private String emailAddress;
	private String oldPassword;
	private String newPassword;
	private String retypedPassword;
	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getEmailAddress() {
		return emailAddress;
	}
	
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	
	public String getOldPassword() {
		return oldPassword;
	}
	
	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}
	
	public String getNewPassword() {
		return newPassword;
	}
	
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	
	public String getRetypedPassword() {
		return retypedPassword;
	}
	
	public void setRetypedPassword(String retypedPassword) {
		this.retypedPassword = retypedPassword;
	}
	
}
