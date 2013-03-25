package com.flipkart.action.accountmanagement;

import com.opensymphony.xwork2.ActionSupport;

public class PasswordChangeAction extends ActionSupport {
	
	private String userID;
	private String emailAddress;
	private String oldPassword;
	private String newPassword;
	private String retypedPassword;
	public String loadPage(){
		return SUCCESS;
	}
	
	public String modifyPassword(){
		return SUCCESS;
	}

}
