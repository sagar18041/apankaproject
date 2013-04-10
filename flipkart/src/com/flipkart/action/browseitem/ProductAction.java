/*
 * Action Class to handle product related operations
 * av
 */
package com.flipkart.action.browseitem;

import java.sql.SQLException;
import java.util.ArrayList;
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
import com.flipkart.model.browseitem.Rating;
import com.flipkart.model.browseitem.Review;
import com.flipkart.model.recommendation.RecentlyViewed;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport {

	//to get category list in menu and search autocomplete
	private ArrayList<String> categoryList = new ArrayList<String>();
	private ArrayList<Catalogue> catalogueList = new ArrayList<Catalogue>();
	private ArrayList<SearchList> sl = new ArrayList<SearchList>();
	String searchBy;
	String autoCompleteList;
	public String categorySel;
	//end to get category list in menu and search autocomplete
	
	// product display 
	private boolean rated = false;
	private boolean addedToWishList = false;
	public boolean isRated() {
		return rated;
	}

	public void setRated(boolean rated) {
		this.rated = rated;
	}

	public boolean isAddedToWishList() {
		return addedToWishList;
	}

	public void setAddedToWishList(boolean addedToWishList) {
		this.addedToWishList = addedToWishList;
	}


	private Integer itemID = null;
	private Product prod = new Product();
	private ArrayList<Attributes> attrib = new ArrayList<Attributes>();
	private ArrayList<Review> review = new ArrayList<Review>();
	private ArrayList<Rating> rating = new ArrayList<Rating>();
	private Integer finalRating = null;
	private Integer numberOfUserRated = 0;
	private Integer numberOfReviews = 0;
	//end product display
	
	// related to ratings and reviews
	private Integer ratingStar;
	private String reviewTitle;
	private String reviewText;
	//end related to ratings and reviews


	public Integer getRatingStar() {
		return ratingStar;
	}

	public void setRatingStar(Integer ratingStar) {
		this.ratingStar = ratingStar;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewText() {
		return reviewText;
	}

	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

	public Integer getNumberOfReviews() {
		return numberOfReviews;
	}

	public void setNumberOfReviews(Integer numberOfReviews) {
		this.numberOfReviews = numberOfReviews;
	}

	public Integer getNumberOfUserRated() {
		return numberOfUserRated;
	}

	public void setNumberOfUserRated(Integer numberOfUserRated) {
		this.numberOfUserRated = numberOfUserRated;
	}


	private ArrayList<RecentlyViewed> recentlyViewedItems = new ArrayList<RecentlyViewed>();
	private ArrayList<RecentlyViewed> browsingHistoryItems = new ArrayList<RecentlyViewed>();
	public String getSearchBy() {
		return searchBy;
	}

	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}

	public String getAutoCompleteList() {
		return autoCompleteList;
	}

	public void setAutoCompleteList(String autoCompleteList) {
		this.autoCompleteList = autoCompleteList;
	}

	public String getCategorySel() {
		return categorySel;
	}

	public void setCategorySel(String categorySel) {
		this.categorySel = categorySel;
	}

	public ArrayList<Catalogue> getCatalogueList() {
		return catalogueList;
	}

	public void setCatalogueList(ArrayList<Catalogue> catalogueList) {
		this.catalogueList = catalogueList;
	}

	public ArrayList<RecentlyViewed> getBrowsingHistoryItems() {
		return browsingHistoryItems;
	}

	public ArrayList<String> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(ArrayList<String> categoryList) {
		this.categoryList = categoryList;
	}

	public ArrayList<SearchList> getSl() {
		return sl;
	}

	public void setSl(ArrayList<SearchList> sl) {
		this.sl = sl;
	}

	public void setBrowsingHistoryItems(
			ArrayList<RecentlyViewed> browsingHistoryItems) {
		this.browsingHistoryItems = browsingHistoryItems;
	}

	public ArrayList<RecentlyViewed> getRecentlyViewedItems() {
		return recentlyViewedItems;
	}

	public void setRecentlyViewedItems(ArrayList<RecentlyViewed> recentlyViewedItems) {
		this.recentlyViewedItems = recentlyViewedItems;
	}

	public Integer getFinalRating() {
		return finalRating;
	}

	public void setFinalRating(Integer finalRating) {
		this.finalRating = finalRating;
	}

	public ArrayList<Rating> getRating() {
		return rating;
	}

	public void setRating(ArrayList<Rating> rating) {
		this.rating = rating;
	}


	public ArrayList<Review> getReview() {
		return review;
	}


	public void setReview(ArrayList<Review> review) {
		this.review = review;
	}

	/** 
	 * function to get called when a particular item is being clicked
	 * @return item details
	 * @throws SQLException
	 */
	public String displayItem() throws SQLException {

		//to get category list in menu and search autocomplete
		// get all categories from category table to populate the search box
		HomeModel hm = new HomeModel();
		categoryList = hm.getCategoryList();
		// get all catalogue details to populate menu list
		catalogueList = hm.getCatalogueList();
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
		//to get category list in menu and search autocomplete
		
		ProductModel pm = new ProductModel();

		//get product details
		prod = pm.getProductDetails(itemID);

		//get product attributes
		attrib = pm.getProductAttributes(itemID);

		//review are based on product not on variants so 
		//get productID from ItemID and pass it to get reviews.
		Integer productID = pm.getProductID(itemID);

		//get product review
		review = pm.getProductReview(productID);

		//
		numberOfReviews = review.size();
		
		//get product ratings 
		rating = pm.getProductRating(productID);

		//calculate final rating
		if (rating.size() > 0) {
			finalRating = 0;
		for (int i = 0; i < rating.size(); i++) {
			finalRating = finalRating + rating.get(i).getRatingStar();
		}
			finalRating = finalRating / rating.size();
			System.out.println(finalRating);
		}
		//number of user rated product
		numberOfUserRated = rating.size();

		//log user browsing history into DB for recommendations
		HttpServletRequest request = ServletActionContext.getRequest();
		//to get actual IP not proxy address
		String ipAddr = request.getHeader("X-FORWARDED-FOR");
		//System.out.println(ipAddr);
		//if we use localhost we will get null value so to avoid null convert it to ip
		if (ipAddr == null || ipAddr.equals("")) {
			ipAddr = "127.0.0.1";
		}
		//store into DB
		pm.putBrowingHistory(ipAddr, itemID);

		//get 5 recently viewed itemIDs
		ArrayList<Integer> itemIDsForRecentlyViewedItems = new ArrayList<Integer>();
		itemIDsForRecentlyViewedItems = pm.getRecentlyViewedItems(ipAddr);
		//System.out.println(itemIDsForRecentlyViewedItems.size());

		//get item details
		recentlyViewedItems = pm.getRecentlyViewedItems(itemIDsForRecentlyViewedItems);

//		for (int i=0; i<recentlyViewedItems.size();i++) {
//			System.out.println(recentlyViewedItems.get(i).getItemName());
//		}

		//System.out.println(recentlyViewedItems.size());
		//get 5 items based on browsing history
		ArrayList<Integer> itemIDsForBrowsingHistory = new ArrayList<Integer>();
		itemIDsForBrowsingHistory = pm.getbrowsedItems(ipAddr);

		//get item details
		browsingHistoryItems = pm.getRecentlyViewedItems(itemIDsForBrowsingHistory);

		//get stock details
		/*
		 * 
		 to be implemented later
		 pm.getProductImages(itemID) 
		 pm.getProductOffers(itemID) //special case to be implemented at the end
		 pm.getProductVariants(itemID) //
		 pm.getAds()
		 stock detail
		 *
		 */
		//check if user has already rated and review, give msg
				Map sess=ActionContext.getContext().getSession();
				if (sess.containsKey("login")) {
				if (pm.getUserRating(Integer.valueOf(sess.get("userID").toString()), productID) || 
						pm.getUserReview(Integer.valueOf(sess.get("userID").toString()), productID)) {
					rated = true;
				}
				}
				
		//check if user has already added the item to wishlist
				if (sess.containsKey("login")) {
					if (pm.getUserWishList(Integer.valueOf(sess.get("userID").toString()), itemID)) {
						addedToWishList = true;
					}
					}

		return SUCCESS;

	}
	
	//get page to rate and review product
	public String rateAndReview() {
		ProductModel pm = new ProductModel();
		//get product details
		if (itemID == null) {
			return "tohome";
		}
		prod = pm.getProductDetails(itemID);
		
		return SUCCESS;
	}
	
	//save user ratings and reviews
	public String saveRateAndReview() {
		ProductModel pm = new ProductModel();
		//check for input fileds
		if(ratingStar == null || reviewText == null || reviewTitle == null || ratingStar == -1 ||
				reviewTitle.equalsIgnoreCase("") || reviewText.equalsIgnoreCase("")) {
			addActionError("All fields are mandatory");
			return ERROR;
		}
		
		
		//insert rating 
		Map sess=ActionContext.getContext().getSession();
		Integer productID = pm.getProductID(itemID);
		pm.putUserRating(ratingStar, Integer.valueOf(sess.get("userID").toString()), productID);
		pm.putUserReview(reviewTitle, reviewText, productID,  
				Integer.valueOf(sess.get("userID").toString()));
		//insert review
		
		return SUCCESS;
	}

	public Integer getItemID() {
		return itemID;
	}


	public void setItemID(Integer itemID) {
		this.itemID = itemID;
	}


	public Product getProd() {
		return prod;
	}


	public void setProd(Product prod) {
		this.prod = prod;
	}


	public ArrayList<Attributes> getAttrib() {
		return attrib;
	}


	public void setAttrib(ArrayList<Attributes> attrib) {
		this.attrib = attrib;
	}
}
