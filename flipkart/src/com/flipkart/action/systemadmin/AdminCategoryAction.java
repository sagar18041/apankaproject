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
	private String categoryName;

	public String fetchCategoryList(){

		categoryList=new ArrayList<AdminCategory>();
		categoryList=AdminCategoryModel.fetchCategoryList();
		return SUCCESS;
	}

	public String insertNewCategory(){

		if(getCategoryName()==null){
			addActionError("You must give a value for category name !");
		}
		else
		{
			AdminCategoryModel.insertNewCategory(getCategoryName());
		}
		return SUCCESS;
	}

	public String modifyCategory(){
		
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
}
