package com.flipkart.action.accountmanagement;

import java.util.Map;

import com.flipkart.model.accountmanagement.DeactivateAccountModel;
import com.flipkart.model.authentication.LoginModel;
import com.flipkart.util.MyUtilityFunctions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DeactivateAccountAction extends ActionSupport {

	String emailAddress;
	String password;

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@SuppressWarnings({ "rawtypes" })
	public String init() {
		Map session = ActionContext.getContext().getSession();
		int userID = (int) session.get("userID");
		emailAddress = DeactivateAccountModel.getEmailAddress(userID);
		return SUCCESS;

	}

	@SuppressWarnings({ "rawtypes" })
	public String deactivateAccount() {
		Map session = ActionContext.getContext().getSession();
		int userID = (int) session.get("userID");
		emailAddress = DeactivateAccountModel.getEmailAddress(userID);
		if (LoginModel.isAuthentic(emailAddress,
				MyUtilityFunctions.generateMD5(password))) {
			DeactivateAccountModel.deactivateAccount(userID);
		} else {
			addActionError("Email/Password combination is wrong.");
			return ERROR;
		}
		return SUCCESS;

	}

}
