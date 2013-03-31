package com.flipkart.action.systemadmin;

import java.util.ArrayList;
import java.util.Map;
import com.flipkart.model.placeorder.Order;
import com.flipkart.model.placeorder.ShippingAddress;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.flipkart.model.systemadmin.*;

public class AdminCategoryAction extends ActionSupport{

	private ArrayList<AdminCategory> categoryList;
	private ArrayList<AdminCategory> verificationcategoryList;
	private String categoryName="";
	String[] checkCategory;
	
	public String fetchCategoryList(){

		categoryList=new ArrayList<AdminCategory>();
		categoryList=AdminCategoryModel.fetchCategoryList();
		return SUCCESS;
	}

	public String insertNewCategory(){
		
		if ( !getCategoryName().equals("") && !getCategoryName().equals(null))
		{
			AdminCategoryModel.insertNewCategory(getCategoryName());
			setCategoryName("");
		}
		else{
			addActionError("Please give a value for category name !");
			return ERROR;
		}
		return SUCCESS;
	}

	public String fetchVerificationCategory(){
		
		verificationcategoryList=new ArrayList<AdminCategory>();
		verificationcategoryList=AdminCategoryModel.fetchVerificationCategory();
		
		return SUCCESS;
	}
	
	public String changeStatusCategory(){
	
		/*
		 * For all the selected categories, changing the 
		 * status one by one (if any selection was made)
		 */
		System.out.println("HERE: changeStatusCategory");
		
		if(checkCategory != null){
			System.out.println("HERE: changeStatusCategory IF");
			for(int i=0;i<checkCategory.length;i++){
				try{
					AdminCategoryModel.changeStatusCategory(Integer.parseInt(checkCategory[i]));
				}
				catch(Exception e){
					addActionError("Some error occurred during enrollment. Please try again.");
					return ERROR;
				}
			}
		}
		/*if no selections were made and ACTIVATE was clicked*/
		else{
			System.out.println("HERE: changeStatusCategory ELSE");
			addActionError("You must select a category for activating! ");
			return ERROR;
		}
		
		return SUCCESS;
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
}
