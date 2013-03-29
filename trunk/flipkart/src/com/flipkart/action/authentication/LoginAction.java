package com.flipkart.action.authentication;

import java.util.Map;

import com.flipkart.model.authentication.LoginModel;
import com.flipkart.util.MyLog;
import com.flipkart.util.MyUtilityFunctions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LoginAction extends ActionSupport {
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

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String login() {
		MyLog.log("LoginAction: login()");
		if (LoginModel.isAuthentic(emailAddress,
				MyUtilityFunctions.generateMD5(password))) {
			Map session = ActionContext.getContext().getSession();
			session.put("login", true);
			session.put("userID", LoginModel.getUserID(emailAddress));
			session.put("emailAddress", emailAddress);
			return SUCCESS;
		} else {
			MyLog.log("Incorrect email address/password.");
			addActionError("Incorrect email address/password.");
			return ERROR;
		}
	}

	@SuppressWarnings("rawtypes")
	public String logout() {
		// remove user from session
		Map sess = ActionContext.getContext().getSession();
		sess.remove("login");
		sess.remove("userID");
		sess.remove("emailAddress");
		return SUCCESS;
	}

}
