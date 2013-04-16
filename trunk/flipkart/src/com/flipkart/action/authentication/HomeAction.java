/**
 * 
 */
package com.flipkart.action.authentication;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.flipkart.model.authentication.Catalogue;
import com.flipkart.model.authentication.HomeModel;
import com.flipkart.model.authentication.SearchList;
import com.flipkart.model.authentication.SearchListModel;
import com.flipkart.model.browseitem.Attributes;
import com.flipkart.model.browseitem.Product;
import com.flipkart.model.browseitem.ProductModel;
import com.flipkart.model.cartmanagement.Cart;
import com.flipkart.model.compareproduct.CompareModel;
import com.flipkart.model.recommendation.RecentlyViewed;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

/**
 * @author Team404
 * 
 */
@SuppressWarnings("serial")
public class HomeAction extends ActionSupport {
	private String errorMsg;
	private String actionMsg;

	
	//top selling
	HashMap<Integer, ArrayList<Attributes>> topsellingitm = new HashMap<Integer, ArrayList<Attributes>>();
	public HashMap<Integer, ArrayList<Attributes>> getTopsellingitm() {
		return topsellingitm;
	}



	public void setTopsellingitm(
			HashMap<Integer, ArrayList<Attributes>> topsellingitm) {
		this.topsellingitm = topsellingitm;
	}



	private ArrayList<Attributes> attribtopselling = new ArrayList<Attributes>();
	private ArrayList<Product> prodtopselling = new ArrayList<Product>();
	
	public ArrayList<Attributes> getAttribtopselling() {
		return attribtopselling;
	}



	public void setAttribtopselling(ArrayList<Attributes> attribtopselling) {
		this.attribtopselling = attribtopselling;
	}



	public ArrayList<Product> getProdtopselling() {
		return prodtopselling;
	}



	public void setProdtopselling(ArrayList<Product> prodtopselling) {
		this.prodtopselling = prodtopselling;
	}



	HashMap<Integer, ArrayList<Attributes>> trendingitm = new HashMap<Integer, ArrayList<Attributes>>();
	public HashMap<Integer, ArrayList<Attributes>> getTrendingitm() {
		return trendingitm;
	}



	public void setTrendingitm(HashMap<Integer, ArrayList<Attributes>> trendingitm) {
		this.trendingitm = trendingitm;
	}
	private ArrayList<Attributes> attrib = new ArrayList<Attributes>();
	private ArrayList<Product> prod = new ArrayList<Product>();
	public ArrayList<Attributes> getAttrib() {
		return attrib;
	}

	

	public void setAttrib(ArrayList<Attributes> attrib) {
		this.attrib = attrib;
	}

	public ArrayList<Product> getProd() {
		return prod;
	}

	public void setProd(ArrayList<Product> prod) {
		this.prod = prod;
	}
	private ArrayList<String> categoryList = new ArrayList<String>();
	private ArrayList<SearchList> sl = new ArrayList<SearchList>();
	private ArrayList<Catalogue> catalogueList = new ArrayList<Catalogue>();
	private ArrayList<Catalogue> parentCatalogueList = new ArrayList<Catalogue>();
	public ArrayList<Catalogue> getParentCatalogueList() {
		return parentCatalogueList;
	}

	public void setParentCatalogueList(ArrayList<Catalogue> parentCatalogueList) {
		this.parentCatalogueList = parentCatalogueList;
	}

	ArrayList<Cart> cartItems = new ArrayList<Cart>();
	@SuppressWarnings("rawtypes")
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

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getActionMsg() {
		return actionMsg;
	}

	public void setActionMsg(String actionMsg) {
		this.actionMsg = actionMsg;
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

	@SuppressWarnings("rawtypes")
	public Map getCartSession() {
		return cartSession;
	}

	@SuppressWarnings("rawtypes")
	public void setCartSession(Map cartSession) {
		this.cartSession = cartSession;
	}

	@SuppressWarnings("unchecked")
	public String execute() throws SQLException {
		// get all categories from category table to populate the search box
		// System.out.println("Category is " + getCategorySel());
		HomeModel hm = new HomeModel();
		categoryList = hm.getCategoryList();
		parentCatalogueList = hm.getParentCatalogueList();

		// get all catalogue details to populate menu list
		catalogueList = hm.getCatalogueList();

		if (loadFirstTime == 0) {
			cartSession.put("cartItems", cartItems);
			cartSession.put("cartCount", initialCartCount);
			loadFirstTime = 1;

			// System.out.println("********" + cartSession.get("cartCount"));
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
		// System.out.println(itemIDsForRecentlyViewedItems.size());

		// get item details
		recentlyViewedItems = pm
				.getRecentlyViewedItems(itemIDsForRecentlyViewedItems);

		// for (int i=0; i<recentlyViewedItems.size();i++) {
		// System.out.println(recentlyViewedItems.get(i).getItemName()); }
		//

		// System.out.println(recentlyViewedItems.size());
		// get 5 items based on browsing history
		ArrayList<Integer> itemIDsForBrowsingHistory = new ArrayList<Integer>();
		itemIDsForBrowsingHistory = pm.getbrowsedItems(ipAddr);

		// get item details
		browsingHistoryItems = pm
				.getRecentlyViewedItems(itemIDsForBrowsingHistory);
		// for (int i=0; i<browsingHistoryItems.size();i++) {
		// System.out.println(browsingHistoryItems.get(i).getItemName()); }
		//
		
		// get top 5 trending items
		ProductModel productModel = new ProductModel();
		CompareModel compareProduct = new CompareModel();
		ArrayList<Integer> itmid = new ArrayList<Integer>();
		itmid = pm.getTrendingItemIDs(2);
		
		prod = compareProduct.getProductDetails(itmid);
		
		
		for (int i = 0; i < itmid.size(); i++) {
			//System.out.println(itmid.get(i));
			attrib.addAll(productModel.getVerySpecificProductAttributes(itmid.get(i)));
			//System.out.println(attrib.get(i).getAttribute());
			trendingitm.put(itmid.get(i), attrib);
		}
		
		
		//get top selling items
		ArrayList<Integer> itmidtopselling = new ArrayList<Integer>();
		itmidtopselling = pm.getTrendingItemIDs(10);
		
		 prodtopselling = compareProduct.getProductDetails(itmidtopselling);
		
		
		for (int i = 0; i < itmidtopselling.size(); i++) {
			
			attribtopselling.addAll(productModel.getVerySpecificProductAttributes(itmidtopselling.get(i)));
	
			topsellingitm.put(itmidtopselling.get(i), attribtopselling);
		}
		
		if (errorMsg != null && !errorMsg.equals("")) {
			addActionError(errorMsg);
		}
		if (actionMsg != null && !actionMsg.equals("")) {
			addActionMessage(actionMsg);
		}

		return SUCCESS;
	}

	public ArrayList<Catalogue> getCatalogueList() {
		return catalogueList;
	}

	public void setCatalogueList(ArrayList<Catalogue> catalogueList) {
		this.catalogueList = catalogueList;
	}
}
