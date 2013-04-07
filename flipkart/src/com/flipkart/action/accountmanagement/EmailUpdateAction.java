package com.flipkart.action.accountmanagement;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.flipkart.model.accountmanagement.UserEmail;
import com.flipkart.model.accountmanagement.UserEmailModel;
import com.flipkart.model.accountmanagement.UserPasswordModel;
import com.flipkart.util.EmailManager;
import com.flipkart.util.MyUtilityFunctions;
import com.flipkart.util.RuntimeSettings;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EmailUpdateAction extends ActionSupport{

	Map sess=ActionContext.getContext().getSession();
	private int userID;
	private String emailAddress;
	private String newEmailAddress;
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
	
	public String getNewEmailAddress() {
		return newEmailAddress;
	}
	
	public void setNewEmailAddress(String newEmailAddress) {
		this.newEmailAddress = newEmailAddress;
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
	
	
	public String loadPage(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		setEmailAddress(sess.get("emailAddress").toString());
		return SUCCESS;
	}

	public String sendResetLink(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		setEmailAddress(sess.get("emailAddress").toString());
		Pattern p = Pattern.compile(".+@.+\\.[a-z]+");
		Matcher m = p.matcher(newEmailAddress);
		boolean validity = m.matches();
		if(validity==false){
			addActionError("Please specify a valid Email Address");
			return ERROR;
		}
		else if(emailAddress.equals(newEmailAddress)){
			addActionError("Old and new emails are same. Please enter different email id.");
			return ERROR;
		}
		else{
			String link = UserEmailModel.getLink(newEmailAddress);
			
			String messageSubject = "Flipkart account - Update Email Link";
			String messageBody = "Dear Customer,"
					+ "\n\nGreetings from Flipkart!"
					+ "\n\nYou received this email because we received a request from "+emailAddress+" to update that email id to your email Id."
					+ "\n\nClick on the following link to set a new password:\n\n"
					+ link
					+ "\n\nPlease ignore this email if it wasn't you who requested update of your email id - your current email id will remain unchanged."
					+ "\n\nPlease contact us should you have any questions or need further assistance."
					+ "\n\n\nThank you for shopping with us!"
					+ "\n\n..............................................................................................................."
					+ "\n\nFlipkart.com... The Online Megastore!";

			if (EmailManager.sendMail(newEmailAddress, messageSubject,
					messageBody, RuntimeSettings.smtpFrom,
					RuntimeSettings.smtpPassword)) {
				addActionMessage("Email sent successfully.");
				return SUCCESS;
			}
			else{
				addActionError("Some error occured. Please try again.");
				return ERROR;
			}
		}
	}
	
	public String loadResetPage(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		setEmailAddress(sess.get("emailAddress").toString());
		return SUCCESS;
	}
	
	public String resetEmail(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		setEmailAddress(sess.get("emailAddress").toString());
		if(oldPassword.equals("") || newPassword.equals("") || retypedPassword.equals("")){
			addActionError("Password cannot be left empty.");
			return ERROR;
		}
		else{
			UserEmail ue = new UserEmail();
			ue.setNewEmailAddress(newEmailAddress);
			ue.setOldPassword(MyUtilityFunctions.generateMD5(oldPassword));
			ue.setNewPassword(MyUtilityFunctions.generateMD5(newPassword));
			ue.setRetypedPassword(MyUtilityFunctions.generateMD5(retypedPassword));
			System.out.println(oldPassword);
			String passwordFromDB = UserPasswordModel.getUserPassword(userID);
			System.out.println(passwordFromDB);
			System.out.println("before match");
			if(ue.getOldPassword().equalsIgnoreCase(passwordFromDB)){
				System.out.println("pwd match");
				if(ue.getNewPassword().equalsIgnoreCase(ue.getRetypedPassword())){
					int result = UserPasswordModel.updateUserPassword(ue.getNewPassword(), userID);
					if(result!=0){
						result = UserEmailModel.modifyEmail(ue.getNewEmailAddress(),emailAddress,userID);
						if(result!=0){
							sess.put("emailAddress", ue.getNewEmailAddress());
							addActionMessage("Your changes have been saved successfully.");
							return SUCCESS;
						}
						else{
							addActionError("Email Update failed. Please try again.");
							return ERROR;
						}
					}
					else{
						addActionError("Some error has occured. Please try again.");
						return ERROR;
					}
				}
				else{
					addActionError("Password change failed. New Passwords do not match.");
					return ERROR;
				}
			}
			else{
				addActionError("Email/Password combination is wrong.");
				return ERROR;
			}
		}
	}

}
