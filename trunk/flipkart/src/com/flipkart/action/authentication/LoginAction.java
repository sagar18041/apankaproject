package com.flipkart.action.authentication;

import java.util.Map;

import com.flipkart.action.cartmanagement.CartAction;
import com.flipkart.model.authentication.LoginModel;
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

	@SuppressWarnings("rawtypes")
	Map session = ActionContext.getContext().getSession();

	@SuppressWarnings("unchecked")
	public String login() {
		if (LoginModel.isAuthentic(emailAddress,
				MyUtilityFunctions.generateMD5(password))) {

			session.put("login", true);
			session.put("userID", LoginModel.getUserID(emailAddress));
			session.put("emailAddress", emailAddress);
			LoginModel.setStatus(LoginModel.getUserID(emailAddress));
			return SUCCESS;
		} else {
			addActionError("Incorrect email address/password.");
			session.put("hasErrors", 1);
			session.put("errorForm", "login");
			session.put("errorMsg", "Incorrect email address/password.");
			return ERROR;
		}
	}

	@SuppressWarnings("rawtypes")
	public String logout() {
		// remove user from session
		Map sess = ActionContext.getContext().getSession();
		sess.clear();
		CartAction.firstItem=0;
		return SUCCESS;
	}

}
