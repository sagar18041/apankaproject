package com.flipkart.action.searchitem;

import com.opensymphony.xwork2.ActionSupport;

public class SearchItemAction extends ActionSupport{
	public String searchText;
	public String categorySel;
	
	
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
		
		return SUCCESS;
	}
}
