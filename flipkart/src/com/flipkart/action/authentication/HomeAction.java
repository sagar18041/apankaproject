/**
 * 
 */
package com.flipkart.action.authentication;

import com.flipkart.model.authentication.HomeModel;
import com.flipkart.util.MyLog;
import com.opensymphony.xwork2.ActionSupport;

import java.util.*;

/**
 * @author Team404
 *
 */
public class HomeAction extends ActionSupport {
	private ArrayList<String> categoryList  = new ArrayList<String>();
	String searchBy;
	
	public String getSearchBy() {
		return searchBy;
	}

	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}

	public ArrayList<String> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(ArrayList<String> categoryList) {
		this.categoryList = categoryList;
	}

	public String execute() {
		MyLog.log("Inside HomeAction execute function");
		
		//get all categories from category table to populate the search box
		HomeModel hm = new HomeModel();
		categoryList = hm.getCategoryList();
		//System.out.println(searchBy);
		return SUCCESS;
	}
}
