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
	private ArrayList<Attributes> attribcompare = new ArrayList<Attributes>();
	private ArrayList<Product> prodcompare = new ArrayList<Product>();
	
	


	public ArrayList<Attributes> getAttribcompare() {
		return attribcompare;
	}

	public void setAttribcompare(ArrayList<Attributes> attribcompare) {
		this.attribcompare = attribcompare;
	}

	public ArrayList<Product> getProdcompare() {
		return prodcompare;
	}

	public void setProdcompare(ArrayList<Product> prodcompare) {
		this.prodcompare = prodcompare;
	}

	public ArrayList<Integer> getItemID() {
		return itemID;
	}

	public void setItemID(ArrayList<Integer> itemID) {
		this.itemID = itemID;
	}

	public String execute() {
//		for (int i=0;i<itemID.size();i++) {
//			System.out.println("id"  + itemID.get(i));
//		}		
		CompareModel compareProduct = new CompareModel();
		ProductModel productModel = new ProductModel();
		prodcompare = compareProduct.getProductDetails(itemID);
		//System.out.println(prod.size());
		for (int i = 0; i < itemID.size(); i++) {
			attribcompare.addAll(productModel.getProductAttributes(itemID.get(i)));
		}
		System.out.println(attribcompare.size());
		return SUCCESS;
	}
}
