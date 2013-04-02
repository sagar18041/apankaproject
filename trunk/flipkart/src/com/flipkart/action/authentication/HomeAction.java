/**
 * 
 */
package com.flipkart.action.authentication;

import com.flipkart.model.authentication.Catalogue;
import com.flipkart.model.authentication.HomeModel;
import com.flipkart.model.authentication.SearchList;
import com.flipkart.model.authentication.SearchListModel;
import com.flipkart.util.MyLog;
import com.opensymphony.xwork2.ActionSupport;

import java.sql.SQLException;
import java.util.*;

/**
 * @author Team404
 *
 */
public class HomeAction extends ActionSupport {
	private ArrayList<String> categoryList  = new ArrayList<String>();
	private ArrayList<SearchList> sl = new ArrayList<SearchList>();
	private ArrayList<Catalogue> catalogueList = new ArrayList<Catalogue>();
	
	String searchBy;
	String autoCompleteList;
	public String categorySel;
	
	

	public String getCategorySel() {
		return categorySel;
	}

	public void setCategorySel(String categorySel) {
		this.categorySel = categorySel;
	}

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

	public String execute() throws SQLException {
		
		MyLog.log("Inside HomeAction execute function");
		//get all categories from category table to populate the search box
		
		System.out.println("Category is " + getCategorySel());
		HomeModel hm = new HomeModel();
		categoryList = hm.getCategoryList();
		
		//get all catalogue details to populate menu list
		catalogueList = hm.getCatalogueList();
		
		/*
		 * For searchList
		 */
		sl = SearchListModel.fetchList(getCategorySel());
		System.out.println("SearchList size " + sl.size());
		autoCompleteList = "[\"";
		for(int i = 0 ; i < sl.size() ; i++){
			autoCompleteList = autoCompleteList + sl.get(i).fieldValue + "\",\"";
		}
		autoCompleteList = autoCompleteList + "\"]";
	
		return SUCCESS;
	}

	public ArrayList<Catalogue> getCatalogueList() {
		return catalogueList;
	}

	public void setCatalogueList(ArrayList<Catalogue> catalogueList) {
		this.catalogueList = catalogueList;
	}
}
