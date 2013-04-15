package com.flipkart.action.accountmanagement;

import java.sql.SQLException;
import java.util.Map;

import com.flipkart.action.authentication.HomeAction;
import com.flipkart.model.accountmanagement.PersonalInformationModel;
import com.flipkart.model.accountmanagement.UserPassword;
import com.flipkart.model.accountmanagement.UserPasswordModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.flipkart.util.MyUtilityFunctions;

public class PasswordChangeAction extends ActionSupport {

	private int userID;
	private String emailAddress;
	private String oldPassword;
	private String newPassword;
	private String retypedPassword;
	private String errorMsg;
	private String actionMsg;
	
	Map sess=ActionContext.getContext().getSession();
	
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
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getActionMsg() {
		return actionMsg;
	}

	public void setActionMsg(String actionMsg) {
		this.actionMsg = actionMsg;
	}

	public String loadPage(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		setEmailAddress(UserPasswordModel.getUserEmailAddress(userID));
		return SUCCESS;
	}

	public String modifyPassword(){
		
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		setEmailAddress(UserPasswordModel.getUserEmailAddress(userID));
		if(oldPassword.equals("") || newPassword.equals("") || retypedPassword.equals("")){
			errorMsg="Password cannot be left empty.";
			//addActionError("");
			return ERROR;
		}
		else{
			UserPassword up = new UserPassword();
			up.setOldPassword(MyUtilityFunctions.generateMD5(oldPassword));
			up.setNewPassword(MyUtilityFunctions.generateMD5(newPassword));
			up.setRetypedPassword(MyUtilityFunctions.generateMD5(retypedPassword));


			String passwordFromDB = UserPasswordModel.getUserPassword(userID);

			if(up.getOldPassword().equalsIgnoreCase(passwordFromDB)){

				if(up.getNewPassword().equalsIgnoreCase(up.getRetypedPassword())){
					int result = UserPasswordModel.updateUserPassword(up.getNewPassword(), userID);
					if(result!=0){
						actionMsg = "Your changes have been saved successfully.";
						//addActionMessage("Your changes have been saved successfully.");
						return SUCCESS;
					}
					else{
						errorMsg = "Some error has occured. Please try again.";
						//addActionError("Some error has occured. Please try again.");
						return ERROR;
					}
				}
				else{
					errorMsg = "Password change failed. New Passwords do not match.";
					//addActionError("");
					return ERROR;
				}
			}
			else{
				errorMsg = "Email/Password combination is wrong.";
				//addActionError("");
				return ERROR;
			}
		}
	}

}
