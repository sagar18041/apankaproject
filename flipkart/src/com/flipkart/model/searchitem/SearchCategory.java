package com.flipkart.model.searchitem;

/**
 * @author neha
 * POJO for category list and count of items in the category
 */
public class SearchCategory {
	public String categoryName;
	public int noOfItems;
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getNoOfItems() {
		return noOfItems;
	}
	public void setNoOfItems(int noOfItems) {
		this.noOfItems = noOfItems;
	}
	
	
}
