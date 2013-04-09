package com.flipkart.action.systemadminauthentication;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AdminLoginAction extends ActionSupport {
	String userID;
	String password;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String init() {
		return SUCCESS;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String login() {

		if (userID.equals("")) {
			addActionError("Please enter user name.");
			return ERROR;
		}

		if (password.equals("")) {
			addActionError("Please enter password.");
			return ERROR;
		}

		Map session = ActionContext.getContext().getSession();

		if (userID.equalsIgnoreCase("admin") && password.equals("secret")) {
			session.put("login", true);
			session.put("userID", userID.toUpperCase());
			return SUCCESS;
		} else {
			addActionError("Username/password combination is wrong.");
			return ERROR;
		}

	}

}
