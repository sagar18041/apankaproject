package com.flipkart.action.systemadmin;

import java.util.ArrayList;
import java.util.Map;
import com.flipkart.model.placeorder.Order;
import com.flipkart.model.placeorder.ShippingAddress;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.flipkart.model.systemadmin.*;
import com.flipkart.util.EmailManager;
import com.flipkart.util.MyLog;
import com.flipkart.util.RuntimeSettings;

public class AdminCategoryAction extends ActionSupport{

	private ArrayList<AdminCategory> categoryList;
	private ArrayList<AdminCategory> verificationcategoryList;
	private String categoryName="";
	String[] checkCategory;
	int check=0, checkVerification=0;

	public String fetchCategoryList(){

		if (categoryList == null)
			categoryList=new ArrayList<AdminCategory>();
		else
			categoryList.clear();

		categoryList=AdminCategoryModel.fetchCategoryList();
		return SUCCESS;
	}

	public String insertNewCategory(){

		check=0;

		if ( !getCategoryName().equals("") && !getCategoryName().equals(null))
		{

			int ret;  
			ret= AdminCategoryModel.checkExistingCategory(getCategoryName());

			if(ret == 0)
			{
				ret= AdminCategoryModel.insertNewCategory(getCategoryName());
				setCategoryName("");

				/*
				 * if there was no error in insert, then send mail to Admin,
				 * else dont send mail.
				 */
				if(ret == -1){
					addActionError("Sorry some error occurred. The new category was not added.");
					check=0;
					return ERROR;
				}
				else if (ret == 0){
					check=1;
					ret= AdminCategoryModel.insertNewCategoryPath(getCategoryName());
					
					if(ret == -1){
						/* in case you were not able to insert path, 
						 * remove category table entry too 
						 * */
						AdminCategoryModel.removeNewCategory(getCategoryName());
						
						addActionError("Sorry some error occurred. The new category was not added.");
						check=0;
						return ERROR;
					}
					else{
						/* if the inserts were successful send the mail to admin*/
						sendMailCategoryAddition();
					}
				}

			}
			else{
				addActionError("This category already exists. Please enter another category.");
				check=0;
				return ERROR;
			}
		}
		else{
			check=0;
			addActionError("Please give a value for category name !");
			return ERROR;
		}
		return SUCCESS;
	}

	public String fetchVerificationCategory(){

		if(verificationcategoryList == null)
			verificationcategoryList=new ArrayList<AdminCategory>();
		else
			verificationcategoryList.clear();

		verificationcategoryList=AdminCategoryModel.fetchVerificationCategory();

		return SUCCESS;
	}

	public String changeStatusCategory(){

		/*
		 * For all the selected categories, changing the 
		 * status one by one (if any selection was made)
		 */
		checkVerification=0;

		if(checkCategory != null){
			for(int i=0;i<checkCategory.length;i++){
				try{
					AdminCategoryModel.changeStatusCategory(Integer.parseInt(checkCategory[i]));
					//reset the values to be shown
					fetchVerificationCategory();
				}
				catch(Exception e){
					checkVerification=0;
					addActionError("Some error occurred during enrollment. Please try again.");
					return ERROR;
				}
			}
			checkVerification=1;
		}
		/*if no selections were made and ACTIVATE was clicked*/
		else{
			addActionError("You must select a category for activating! ");
			//reset the values to be shown
			fetchVerificationCategory();
			checkVerification=0;
			return ERROR;
		}

		return SUCCESS;
	}

	/**
	 * This sends an email to Admin notifying about new category addition
	 * @return category list
	 */
	public static String sendMailCategoryAddition() {

		String link = "http://localhost:8080/flipkart/adminverifycategory";
		String emailAddress= "flipkart.team403.iiitb.2013@gmail.com";

		String messageSubject = "Flipkart Admin: New Category Notification.";
		String messageBody = "Dear Admin,"
				+ "\n\nGreetings from Flipkart!"
				+ "\n\nThis is to bring to your notice that a new product category has been added to the Flipkart database."
				+ "\n\nClick on the following link to resolve the pending verifications.:\n\n"
				+ link
				+ "\n\nPlease take the necessary action."
				+ "\n\n..............................................................................................................."
				+ "\n\nFlipkart.com... The Online Megastore!";

		if (EmailManager.sendMail(emailAddress, messageSubject,
				messageBody, RuntimeSettings.smtpFrom,
				RuntimeSettings.smtpPassword)) {
			MyLog.log("Category Addition notification email Sent.");
			return SUCCESS;

		} else {
			MyLog.log("Error in sending Category Addition notification email.");
			return ERROR;
		}
	}	

	public ArrayList<AdminCategory> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(ArrayList<AdminCategory> categoryList) {
		this.categoryList = categoryList;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public ArrayList<AdminCategory> getVerificationcategoryList() {
		return verificationcategoryList;
	}

	public void setVerificationcategoryList(
			ArrayList<AdminCategory> verificationcategoryList) {
		this.verificationcategoryList = verificationcategoryList;
	}

	public String[] getCheckCategory() {
		return checkCategory;
	}

	public void setCheckCategory(String[] checkCategory) {
		this.checkCategory = checkCategory;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public int getCheckVerification() {
		return checkVerification;
	}

	public void setCheckVerification(int checkVerification) {
		this.checkVerification = checkVerification;
	}
}
