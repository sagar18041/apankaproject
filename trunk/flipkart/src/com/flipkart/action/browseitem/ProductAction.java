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
import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport {

	private Integer itemID;
	private Product prod = new Product();
	private ArrayList<Attributes> attrib = new ArrayList<Attributes>();
	
	
	/** function to get called when a particular item is being clicked
	 * @return item details
	 * @throws SQLException
	 */
	public String displayItem() throws SQLException {
		
		
		ProductModel pm = new ProductModel();
		prod = pm.getProductDetails(itemID);
		attrib = pm.getProductAttributes(itemID);
		System.out.println(prod.getItemName());
		System.out.println(attrib.get(0).getValue());
		/*
		 to be implemented later
		 pm.getProductRating(itemID)
		 pm.getProductReview(itemID)
		 pm.getProductImages(itemID)
		 pm.getProductOffer(itemID)
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
