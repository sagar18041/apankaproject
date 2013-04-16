package com.flipkart.action.systemadmincategory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import com.flipkart.model.placeorder.Order;
import com.flipkart.model.placeorder.ShippingAddress;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.flipkart.model.systemadmincategory.*;
import com.flipkart.util.EmailManager;
import com.flipkart.util.RuntimeSettings;

public class AdminCategoryAction extends ActionSupport{

	private ArrayList<AdminCategory> categoryList;
	private ArrayList<AdminCategory> verificationcategoryList;
	private String categoryName="";
	String[] checkCategory;
	int check=0, checkVerification=0, checkParentCategory=0;
	int level=-1;
	String parentCategory;
	private int selectedCategoryID=-1;

	HashMap<Integer,String> parentCategories = new HashMap<Integer,String>();

	private ArrayList<Integer> levels = new ArrayList<Integer>();  

	public String fetchCategoryList(){

		if (categoryList == null)
			categoryList=new ArrayList<AdminCategory>();
		else
			categoryList.clear();

		categoryList=AdminCategoryModel.fetchCategoryList();
		return SUCCESS;
	}

	public String initAddCategory(){

		//fetch category levels from DB
		//levels=AdminCategoryModel.fetchLevels();
		levels.clear();
		levels.add(0);
		levels.add(1);
		levels.add(2);
		/*//fetch data to populate parentLists
		parentCategories=AdminCategoryModel.fetchParentCategories();*/

		if(checkParentCategory==0){
			setLevel(-1);
			setSelectedCategoryID(-1);
			setParentCategory("");
			setCategoryName("");
		}

		return SUCCESS;
	}

	public String parentCategoryInit(){

		checkParentCategory=0;
		parentCategories.clear();

		/*
		 * If categorylevel = 0, parentCategoryLevel= N.A.
		 * If categorylevel = 1, parentCategoryLevel= 0
		 * If categorylevel = 2, parentCategoryLevel= 1
		 */
		if(getLevel() != 0){
			int requiredParentLevel= getLevel() - 1;
			//fetch data to populate parentLists
			parentCategories=AdminCategoryModel.fetchParentCategories(requiredParentLevel);
			checkParentCategory=1;
		}
		else if(getLevel() == 0){
			checkParentCategory=0;
		}

		return SUCCESS;
	}

	public String insertNewCategory(){

		check=0;
		checkParentCategory=0;
		/*
		 * if level is 0, then the parentID for path table wud be the same as categoryID,
		 * it will be fetched after the insert is made.
		 * so right now givin a temporary value as -99 for parentID
		 */
		if(getLevel() == 0){
			setSelectedCategoryID(-99);
		}

		if (!getCategoryName().equals("") && !getCategoryName().equals(null) &&
				getSelectedCategoryID() != -1 && getLevel() != -1)
		{

			int ret;  
			ret= AdminCategoryModel.checkExistingCategory(getCategoryName());

			if(ret == 0)
			{
				ret= AdminCategoryModel.insertNewCategory(getCategoryName(),getLevel());

				/*
				 * if there was no error in insert, then send mail to Admin,
				 * else dont send mail.
				 */
				if(ret == -1){

					addActionError("Sorry some error occurred. The new category was not added.");
					check=0;
					checkParentCategory=0;
					initAddCategory();
					return ERROR;
				}
				else if (ret == 0){

					check=1;
					ret= AdminCategoryModel.insertNewCategoryPath(getSelectedCategoryID(), getLevel());

					if(ret == -1){

						/* in case you were not able to insert path, 
						 * remove category table entry too 
						 * */
						AdminCategoryModel.removeNewCategory(getCategoryName());

						addActionError("Sorry some error occurred. The new category was not added.");
						check=0;
						checkParentCategory=0;
						initAddCategory();
						return ERROR;
					}
					else{
						/* if the inserts were successful send the mail to admin*/
						sendMailCategoryAddition();
						initAddCategory();
					}
				}
			}
			else{
				addActionError("This category already exists. Please enter another category.");
				check=0;
				checkParentCategory=0;
				initAddCategory();
				return ERROR;
			}
		}
		else{
			addActionError("Please give a value for all the feilds !");
			check=0;
			checkParentCategory=0;
			initAddCategory();

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
			return SUCCESS;

		} else {
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

	public ArrayList<Integer> getLevels() {
		return levels;
	}

	public void setLevels(ArrayList<Integer> levels) {
		this.levels = levels;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(String parentCategory) {
		this.parentCategory = parentCategory;
	}

	public HashMap<Integer, String> getParentCategories() {
		return parentCategories;
	}

	public void setParentCategories(HashMap<Integer, String> parentCategories) {
		this.parentCategories = parentCategories;
	}

	public int getSelectedCategoryID() {
		return selectedCategoryID;
	}

	public void setSelectedCategoryID(int selectedCategoryID) {
		this.selectedCategoryID = selectedCategoryID;
	}

	public int getCheckParentCategory() {
		return checkParentCategory;
	}

	public void setCheckParentCategory(int checkParentCategory) {
		this.checkParentCategory = checkParentCategory;
	}

}
