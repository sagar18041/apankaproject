/**
 * 
 */
package com.flipkart.action.authentication;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.flipkart.model.authentication.Catalogue;
import com.flipkart.model.authentication.HomeModel;
import com.flipkart.model.authentication.SearchList;
import com.flipkart.model.authentication.SearchListModel;
import com.flipkart.model.browseitem.ProductModel;
import com.flipkart.model.cartmanagement.Cart;
import com.flipkart.model.recommendation.RecentlyViewed;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author Team404
 * 
 */
public class HomeAction extends ActionSupport {

	private ArrayList<String> categoryList = new ArrayList<String>();
	private ArrayList<SearchList> sl = new ArrayList<SearchList>();
	private ArrayList<Catalogue> catalogueList = new ArrayList<Catalogue>();
	ArrayList<Cart> cartItems = new ArrayList<Cart>();
	Map cartSession = ActionContext.getContext().getSession();
	private ArrayList<RecentlyViewed> recentlyViewedItems = new ArrayList<RecentlyViewed>();
	private ArrayList<RecentlyViewed> browsingHistoryItems = new ArrayList<RecentlyViewed>();

	public ArrayList<RecentlyViewed> getRecentlyViewedItems() {
		return recentlyViewedItems;
	}

	public void setRecentlyViewedItems(
			ArrayList<RecentlyViewed> recentlyViewedItems) {
		this.recentlyViewedItems = recentlyViewedItems;
	}

	public ArrayList<RecentlyViewed> getBrowsingHistoryItems() {
		return browsingHistoryItems;
	}

	public void setBrowsingHistoryItems(
			ArrayList<RecentlyViewed> browsingHistoryItems) {
		this.browsingHistoryItems = browsingHistoryItems;
	}

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

		// get all categories from category table to populate the search box
		//System.out.println("Category is " + getCategorySel());
		HomeModel hm = new HomeModel();
		categoryList = hm.getCategoryList();

		// get all catalogue details to populate menu list
		catalogueList = hm.getCatalogueList();
				
		if (loadFirstTime == 0) {
			cartSession.put("cartItems", cartItems);
			cartSession.put("cartCount", initialCartCount);
			loadFirstTime = 1;

			//System.out.println("********" + cartSession.get("cartCount"));
		}

		

		/*
		 * For searchList
		 */
		sl = SearchListModel.fetchList(getCategorySel());
		System.out.println("SearchList size " + sl.size());
		autoCompleteList = "[\"";
		for (int i = 0; i < sl.size(); i++) {
			autoCompleteList = autoCompleteList + sl.get(i).fieldValue
					+ "\",\"";
		}
		autoCompleteList = autoCompleteList + "\"]";

		// log user browsing history into DB for recommendations
		HttpServletRequest request = ServletActionContext.getRequest();
		// to get actual IP not proxy address
		String ipAddr = request.getHeader("X-FORWARDED-FOR");
		// System.out.println(ipAddr);
		// if we use localhost we will get null value so to avoid null convert
		// it to ip
		if (ipAddr == null || ipAddr.equals("")) {
			ipAddr = "127.0.0.1";
		}
		// for recommendation
		ProductModel pm = new ProductModel();
		// get 5 recently viewed itemIDs
		ArrayList<Integer> itemIDsForRecentlyViewedItems = new ArrayList<Integer>();
		itemIDsForRecentlyViewedItems = pm.getRecentlyViewedItems(ipAddr);
		 //System.out.println(itemIDsForRecentlyViewedItems.size());

		// get item details
		recentlyViewedItems = pm
				.getRecentlyViewedItems(itemIDsForRecentlyViewedItems);

		
//		  for (int i=0; i<recentlyViewedItems.size();i++) {
//		  System.out.println(recentlyViewedItems.get(i).getItemName()); }
//		 

		// System.out.println(recentlyViewedItems.size());
		// get 5 items based on browsing history
		ArrayList<Integer> itemIDsForBrowsingHistory = new ArrayList<Integer>();
		itemIDsForBrowsingHistory = pm.getbrowsedItems(ipAddr);

		// get item details
		browsingHistoryItems = pm
				.getRecentlyViewedItems(itemIDsForBrowsingHistory);
//		for (int i=0; i<browsingHistoryItems.size();i++) {
//			  System.out.println(browsingHistoryItems.get(i).getItemName()); }
//		
		return SUCCESS;
	}

	public ArrayList<Catalogue> getCatalogueList() {
		return catalogueList;
	}

	public void setCatalogueList(ArrayList<Catalogue> catalogueList) {
		this.catalogueList = catalogueList;
	}
}
