package com.flipkart.action.authentication;

import java.util.Map;

import com.flipkart.model.authentication.SignUpModel;
import com.flipkart.util.MyLog;
import com.flipkart.util.MyUtilityFunctions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SignUpAction extends ActionSupport {

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

	@SuppressWarnings("rawtypes")
	Map session = ActionContext.getContext().getSession();

	@SuppressWarnings("unchecked")
	public String createAccount() {

		if (SignUpModel.checkUser(emailAddress)) {
			addActionError("An account already exists with the same email address."
					+ " Login or create an account with another email address.");
			MyLog.log("An account already exists with the same email address."
					+ " Login or create an account with another email address.");
			session.put("hasErrors", 1);
			session.put("errorForm", "signup");
			session.put(
					"errorMsg",
					"An account already exists with the same email address. "
							+ "Login or create an account with another email address.");
			return ERROR;
		} else
			SignUpModel.createAccount(emailAddress,
					MyUtilityFunctions.generateMD5(password));
		return SUCCESS;

	}
}
