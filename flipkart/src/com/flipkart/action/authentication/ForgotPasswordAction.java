package com.flipkart.action.authentication;

import java.util.Map;

import com.flipkart.model.authentication.ForgotPasswordModel;
import com.flipkart.model.authentication.SignUpModel;
import com.flipkart.util.EmailManager;
import com.flipkart.util.MyLog;
import com.flipkart.util.RuntimeSettings;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ForgotPasswordAction extends ActionSupport {
	String emailAddress;
	String newPassword;
	String requestID;

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getRequestID() {
		return requestID;
	}

	public void setRequestID(String requestID) {
		this.requestID = requestID;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	
	@SuppressWarnings("unchecked")
	public String getLink() {

		System.out.println("inside ForgotPasswordAction: getLink()");
		System.out.println("emailAddress: " + emailAddress);
		
		Map session = ActionContext.getContext().getSession();

		if (SignUpModel.checkUser(emailAddress)) {

			ForgotPasswordModel.deleteIfPresent(emailAddress);
			ForgotPasswordModel.saveRequest(emailAddress);
			String link = ForgotPasswordModel.getLink(emailAddress);
			System.out.println("Link: " + link);
			String messageSubject = "Flipkart: Password reset link.";
			String messageBody = "Dear Customer,"
					+ "\n\nGreetings from Flipkart!"
					+ "\n\nYou received this email because you filled out a form on Flipkart.com indicating that you had forgotten your "
					+ "\npassword."
					+ "\n\nClick on the following link to set a new password:\n\n"
					+ link
					+ "\n\nPlease ignore this email if it wasn't you who requested help with your password - your current password "
					+ "\nwill remain unchanged."
					+ "\n\nPlease contact us should you have any questions or need further assistance."
					+ "\n\n\nThank you for shopping with us!"
					+ "\n\n..............................................................................................................."
					+ "\n\nFlipkart.com... The Online Megastore!";

			if (EmailManager.sendMail(emailAddress, messageSubject,
					messageBody, RuntimeSettings.smtpFrom,
					RuntimeSettings.smtpPassword)) {
				MyLog.log("Email Sent.");
				return SUCCESS;
			} else {
				MyLog.log("Error in sending email.");
				System.out.println("returning error 1");
				session.put("hasErrors", 1);
				session.put("errorForm", "forgotpassword");
				session.put("errorMsg", "Error! please try again.");
				return ERROR;
			}
		}

		System.out.println("returning error 2");
		session.put("hasErrors", 1);
		session.put("errorForm", "forgotpassword");
		session.put("errorMsg", "The given email address does not exist.");
		return ERROR;

	}

	public String validateLink() {

		MyLog.log("inside validateLink: " + requestID);

		if (ForgotPasswordModel.isValidLink(requestID)) {
			emailAddress = ForgotPasswordModel.getEmailAddress(requestID);
			MyLog.log("inside validateLink: " + emailAddress);
			return SUCCESS;
		}
		return ERROR;

	}

	public String resetPassword() {
		MyLog.log("Inside resetPassword:");
		MyLog.log("emailAddress: " + emailAddress);
		MyLog.log("password: " + newPassword);
		ForgotPasswordModel.resetPassword(emailAddress, newPassword);
		ForgotPasswordModel.deleteIfPresent(emailAddress);
		return SUCCESS;

	}

}
