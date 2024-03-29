package com.flipkart.action.browseitem;

import java.util.ArrayList;

import com.flipkart.model.browseitem.BrowseItemsModel;
import com.flipkart.model.searchitem.SearchAttribute;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author neha
 *
 */
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
		
		/**
		 * It searched for category only
		 * @return
		 */
		public String browseOnCategory(){
			System.out.println("Category is  " + getCategoryID());
			BrowseItemsModel bim = new BrowseItemsModel();
			searchAttr = bim.fetchAttribute(getCategoryID());
			
			System.out.println(" Browse ArryaList size " + searchAttr.size());
			return SUCCESS;
		}
		
		/**
		 * It searches for subCategory
		 * @return
		 */
		public String browseOnSubCategory(){
			System.out.println("Sub Category is  " + getCategoryID());
			BrowseItemsModel bim = new BrowseItemsModel();
			searchAttr = bim.fetchAttributeForSubCat(getCategoryID());
			
			System.out.println(" Browse ArryaList size " + searchAttr.size());
			return SUCCESS;
		}
		
		
		/**
		 * It searches for subsubcategory
		 * @return
		 */
		public String browseOnSubSubCategory(){
			System.out.println("Sub Sub Category is  " + getCategoryID());
			BrowseItemsModel bim = new BrowseItemsModel();
			searchAttr = bim.fetchAttributeForSubSubCat(getCategoryID());
			
			System.out.println(" Browse ArryaList size " + searchAttr.size());
			return SUCCESS;
		}
		
		/**
		 * It searches for subsubsubcategory
		 * @return
		 */
		public String browseOnSubSubSubCategory(){
			System.out.println("Sub Sub Sub Category is  " + getCategoryID());
			BrowseItemsModel bim = new BrowseItemsModel();
			searchAttr = bim.fetchAttributeForSubSubSubCat(getCategoryID());
			
			System.out.println(" Browse ArryaList size " + searchAttr.size());
			return SUCCESS;
		}
}
