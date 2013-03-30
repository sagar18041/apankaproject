package com.flipkart.action.authentication;

import com.flipkart.model.authentication.ForgotPasswordModel;
import com.flipkart.model.authentication.SignUpModel;
import com.flipkart.util.EmailManager;
import com.flipkart.util.MyLog;
import com.flipkart.util.RuntimeSettings;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ForgotPasswordAction extends ActionSupport {
	String emailAddress;
	String resetLink;

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getResetLink() {
		return resetLink;
	}

	public void setResetLink(String resetLink) {
		this.resetLink = resetLink;
	}

	public String getLink() {
		System.out.println("inside ForgotPasswordAction: getLink()");
		System.out.println("emailAddress: " + emailAddress);
		if (SignUpModel.checkUser(emailAddress)) {

			ForgotPasswordModel.deleteIfPresent(emailAddress);
			ForgotPasswordModel.saveRequest(emailAddress);
			String link = ForgotPasswordModel.getLink(emailAddress);
			String messageSubject = "Flipkart: Password reset link.";
			String messageBody = "Please click on the link below to reset your password: "
					+ link;

			if (EmailManager.sendMail(emailAddress, messageSubject,
					messageBody, RuntimeSettings.smtpFrom,
					RuntimeSettings.smtpPassword)) {
				MyLog.log("Email Sent.");
				return SUCCESS;
			} else {
				MyLog.log("Error in sending email.");
				System.out.println("returning error 1");
				return ERROR;
			}
		}
		System.out.println("returning error 2");
		return ERROR;

	}

	public String validateLink() {
		return null;

	}

	public String resetPassword() {
		return null;

	}

}
