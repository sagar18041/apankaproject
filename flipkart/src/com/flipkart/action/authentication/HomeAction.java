/**
 * 
 */
package com.flipkart.action.authentication;

import com.flipkart.model.authentication.HomeModel;
import com.flipkart.model.authentication.SearchList;
import com.flipkart.model.authentication.SearchListModel;
import com.flipkart.util.MyLog;
import com.opensymphony.xwork2.ActionSupport;

import java.util.*;

/**
 * @author Team404
 *
 */
public class HomeAction extends ActionSupport {
	private ArrayList<String> categoryList  = new ArrayList<String>();
	ArrayList<SearchList> sl = new ArrayList<SearchList>();
	String searchBy;
	String autoCompleteList;
	
	
	

	public String getAutoCompleteList() {
		return autoCompleteList;
	}

	public void setAutoCompleteList(String autoCompleteList) {
		this.autoCompleteList = autoCompleteList;
	}

	public ArrayList<SearchList> getSl() {
		return sl;
	}

	public void setSl(ArrayList<SearchList> sl) {
		this.sl = sl;
	}

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
		
		/*
		 * For searchList
		 */
		sl = SearchListModel.fetchList();
		System.out.println("SearchList size " + sl.size());
		autoCompleteList = "[\"";
		for(int i = 0 ; i < sl.size() ; i++){
			autoCompleteList = autoCompleteList + sl.get(i).fieldValue + "\",\"";
		}
		autoCompleteList = autoCompleteList + "\"]";
	//	autoCompleteList = new String[sl.size()];
		//autoCompleteList =sl.toArray();
		//System.out.println("Debug array = " + autoCompleteList.length);
		
		//System.out.println(searchBy);
		return SUCCESS;
	}
}
