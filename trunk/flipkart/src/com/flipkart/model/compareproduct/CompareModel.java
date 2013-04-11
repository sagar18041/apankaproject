package com.flipkart.model.compareproduct;

import java.util.ArrayList;

import com.flipkart.model.browseitem.Attributes;
import com.flipkart.model.browseitem.Product;
import com.flipkart.model.browseitem.ProductModel;

public class CompareModel {

	public ArrayList<Product> getProductDetails(ArrayList<Integer> itemID) {
		ArrayList<Product> prod = new ArrayList<Product>();
		ProductModel pm = new ProductModel();
		for (int i=0; i<itemID.size();i++) {
			Product product = new Product();
			product = pm.getProductDetails(itemID.get(i));
			prod.add(product);
		}
		
		return prod;
	}

}
