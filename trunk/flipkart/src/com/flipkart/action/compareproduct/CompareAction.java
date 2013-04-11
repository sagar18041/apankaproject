package com.flipkart.action.compareproduct;

import java.util.ArrayList;

import com.flipkart.model.browseitem.Attributes;
import com.flipkart.model.browseitem.Product;
import com.flipkart.model.browseitem.ProductModel;
import com.flipkart.model.compareproduct.CompareModel;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CompareAction extends ActionSupport{
	
	private ArrayList<Integer> itemID = new ArrayList<Integer>();
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


	public ArrayList<Integer> getItemID() {
		return itemID;
	}

	public void setItemID(ArrayList<Integer> itemID) {
		this.itemID = itemID;
	}

	public String execute() {
//		for (int i=0;i<itemID.size();i++) {
//			System.out.println(itemID.get(i));
//		}
		CompareModel compareProduct = new CompareModel();
		ProductModel productModel = new ProductModel();
		prod = compareProduct.getProductDetails(itemID);
		//System.out.println(prod.size());
		for (int i = 0; i < itemID.size(); i++) {
			attrib.addAll(productModel.getProductAttributes(itemID.get(i)));
		}
		System.out.println(attrib.size());
		return SUCCESS;
	}
}
