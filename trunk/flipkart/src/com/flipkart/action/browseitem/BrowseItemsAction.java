package com.flipkart.action.browseitem;

import java.util.ArrayList;

import com.flipkart.model.browseitem.BrowseItemsModel;
import com.flipkart.model.searchitem.SearchAttribute;
import com.opensymphony.xwork2.ActionSupport;

public class BrowseItemsAction extends ActionSupport {
		public int categoryID;
		ArrayList<SearchAttribute> searchAttr = new ArrayList<SearchAttribute>();
		
		public int getCategoryID() {
			return categoryID;
		}
		public void setCategoryID(int categoryID) {
			this.categoryID = categoryID;
		}
		
		public ArrayList<SearchAttribute> getSearchAttr() {
			return searchAttr;
		}
		public void setSearchAttr(ArrayList<SearchAttribute> searchAttr) {
			this.searchAttr = searchAttr;
		}
		
		public String execute(){
			return SUCCESS;
			
		}
		
		public String browseOnCategory(){
			System.out.println("Category is  " + getCategoryID());
			BrowseItemsModel bim = new BrowseItemsModel();
			searchAttr = bim.fetchAttribute(getCategoryID());
			
			System.out.println(" Browse ArryaList size " + searchAttr.size());
			return SUCCESS;
		}
		
		public String browseOnSubCategory(){
			System.out.println("Category is  " + getCategoryID());
			BrowseItemsModel bim = new BrowseItemsModel();
			searchAttr = bim.fetchAttributeForSubCat(getCategoryID());
			
			System.out.println(" Browse ArryaList size " + searchAttr.size());
			return SUCCESS;
		}
}
