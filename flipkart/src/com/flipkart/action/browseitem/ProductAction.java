/*
 * Action Class to handle product related operations
 * av
 */
package com.flipkart.action.browseitem;

import java.sql.SQLException;
import java.util.ArrayList;

import com.flipkart.model.browseitem.Attributes;
import com.flipkart.model.browseitem.Product;
import com.flipkart.model.browseitem.ProductModel;
import com.flipkart.model.browseitem.Review;
import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport {

	private Integer itemID;
	private Product prod = new Product();
	private ArrayList<Attributes> attrib = new ArrayList<Attributes>();
	private ArrayList<Review> review = new ArrayList<Review>();
	
	
	public ArrayList<Review> getReview() {
		return review;
	}


	public void setReview(ArrayList<Review> review) {
		this.review = review;
	}


	/** function to get called when a particular item is being clicked
	 * @return item details
	 * @throws SQLException
	 */
	public String displayItem() throws SQLException {
		
		ProductModel pm = new ProductModel();
		
		//get product
		prod = pm.getProductDetails(itemID);
		//get product attributes
		attrib = pm.getProductAttributes(itemID);
		
		//review are based on product not on variants so 
		//get productID from ItemID and pass it to get reviews.
		Integer ProductID = pm.getProductID(itemID);
		
		//get product review
		review = pm.getProductReview(ProductID);
		
		for (int i=0; i<review.size();i++ ) {
			System.out.println(review.get(i).getReviewTitle());
			System.out.println(review.get(i).getReviewText());
		}
		
		/*
		 to be implemented later
		 pm.getProductRating(itemID)
		 pm.getProductImages(itemID)
		 pm.getProductOffers(itemID)
		 pm.getProductVariants(itemID)
		 
		 */
		
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
