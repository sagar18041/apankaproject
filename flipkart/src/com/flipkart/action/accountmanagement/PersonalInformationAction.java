package com.flipkart.action.accountmanagement;
import java.util.Map;

import com.flipkart.model.accountmanagement.PersonalInformation;
import com.flipkart.model.accountmanagement.PersonalInformationModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PersonalInformationAction extends ActionSupport{
	
	private int userID;
	private String firstName;
	private String lastName;
	private String mobileNumber;
	private String gender;
	private int genderFlag;
	
	private String actionMsg;
	Map sess=ActionContext.getContext().getSession();
	
	public String getFirstName() {
		return firstName;
	}


	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}


	public String getLastName() {
		return lastName;
	}


	public void setLastName(String lastName) {
		this.lastName = lastName;
	}


	public String getMobileNumber() {
		return mobileNumber;
	}


	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getGenderFlag() {
		return genderFlag;
	}


	public void setGenderFlag(int genderFlag) {
		this.genderFlag = genderFlag;
	}

	public int getUserID() {
		return userID;
	}


	public void setUserID(int userID) {
		this.userID = userID;
	}


	public String getActionMsg() {
		return actionMsg;
	}


	public void setActionMsg(String actionMsg) {
		this.actionMsg = actionMsg;
	}


	public String displayPersonalInformation(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		PersonalInformation pi = new PersonalInformation();
		pi = PersonalInformationModel.getUserInformation(userID);
		
		setFirstName(pi.getFirstName());
		setLastName(pi.getLastName());
		setGender(pi.getGender());
		System.out.println(gender);
		setMobileNumber(pi.getMobileNumber());
		if((gender==null)||(gender.equalsIgnoreCase(""))){
			setGenderFlag(0);
		}
		else if(gender.equalsIgnoreCase("male")){
			setGenderFlag(1);
		}
		else{
			setGenderFlag(2);
		}
		return SUCCESS;
	}
	
	public String modifyPersonalInformation(){
		PersonalInformation pi = new PersonalInformation();
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		pi.setFirstName(firstName);
		pi.setLastName(lastName);
		if(Integer.valueOf(gender)==0){
			pi.setGender("");
			setGenderFlag(0);
		}
		else if(Integer.valueOf(gender)==1){
			pi.setGender("Male");
			setGenderFlag(1);
		}
		else{
			pi.setGender("Female");
			setGenderFlag(2);
		}
		
		pi.setMobileNumber(mobileNumber);
		int result = PersonalInformationModel.updateUserInformation(pi, userID);
		if(result!=0){
			actionMsg="Your changes have been saved successfully.";
			//addActionMessage("Your changes have been saved successfully.");
			return SUCCESS;
		}
		else{
			return ERROR;
		}
	}
	
}
