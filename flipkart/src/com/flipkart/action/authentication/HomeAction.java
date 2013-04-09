/**
 * 
 */
package com.flipkart.action.authentication;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.authentication.Catalogue;
import com.flipkart.model.authentication.HomeModel;
import com.flipkart.model.authentication.SearchList;
import com.flipkart.model.authentication.SearchListModel;
import com.flipkart.model.cartmanagement.Cart;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Team404
 *
 */
public class HomeAction extends ActionSupport {
	
	private ArrayList<String> categoryList  = new ArrayList<String>();
	private ArrayList<SearchList> sl = new ArrayList<SearchList>();
	private ArrayList<Catalogue> catalogueList = new ArrayList<Catalogue>();
	ArrayList<Cart>cartItems=new ArrayList<Cart>();
	Map cartSession=ActionContext.getContext().getSession();
	
	String searchBy;
	String autoCompleteList;
	public String categorySel;
	public static int loadFirstTime = 0;
	int initialCartCount = 0;

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

	public ArrayList<Cart> getCartItems() {
		return cartItems;
	}

	public void setCartItems(ArrayList<Cart> cartItems) {
		this.cartItems = cartItems;
	}

	public static int getLoadFirstTime() {
		return loadFirstTime;
	}

	public static void setLoadFirstTime(int loadFirstTime) {
		HomeAction.loadFirstTime = loadFirstTime;
	}

	public int getInitialCartCount() {
		return initialCartCount;
	}

	public void setInitialCartCount(int initialCartCount) {
		this.initialCartCount = initialCartCount;
	}
	public Map getCartSession() {
		return cartSession;
	}

	public void setCartSession(Map cartSession) {
		this.cartSession = cartSession;
	}

	public String execute() throws SQLException {

		//get all categories from category table to populate the search box
		System.out.println("Category is " + getCategorySel());
		HomeModel hm = new HomeModel();
		categoryList = hm.getCategoryList();

		if(loadFirstTime==0){
			cartSession.put("cartItems",cartItems);
			cartSession.put("cartCount", initialCartCount);
			loadFirstTime=1;
			
			System.out.println("********"+cartSession.get("cartCount"));
		}

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
