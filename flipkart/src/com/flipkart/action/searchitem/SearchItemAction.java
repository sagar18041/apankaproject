package com.flipkart.action.searchitem;

import java.util.ArrayList;

import com.flipkart.model.searchitem.SearchCategory;
import com.flipkart.model.searchitem.SearchCategoryModel;
import com.opensymphony.xwork2.ActionSupport;

public class SearchItemAction extends ActionSupport{
	public String searchText;
	public String categorySel;
	ArrayList<SearchCategory> searchCatg = new ArrayList<SearchCategory>();
	
	
	public ArrayList<SearchCategory> getSearchCatg() {
		return searchCatg;
	}


	public void setSearchCatg(ArrayList<SearchCategory> searchCatg) {
		this.searchCatg = searchCatg;
	}


	public String getSearchText() {
		return searchText;
	}


	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}


	public String getCategorySel() {
		return categorySel;
	}


	public void setCategorySel(String categorySel) {
		this.categorySel = categorySel;
	}

/*
 * (non-Javadoc)
 * @see com.opensymphony.xwork2.ActionSupport#execute()
 * Get the list of all the items for the searchText and category
 */
	public String execute() {
		System.out.println("in search action.....");
		System.out.println("Category = " + getCategorySel());
		System.out.println("text = " + getSearchText());
		
		SearchCategoryModel scm = new SearchCategoryModel();
		searchCatg = scm.fetchForAllCat(getSearchText());
		
		System.out.println("Items List = " + searchCatg.size());
		return SUCCESS;
	}
}
