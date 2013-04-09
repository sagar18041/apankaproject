package com.flipkart.model.searchitem;
import java.util.ArrayList;

import com.flipkart.model.browseitem.Attributes;

public class SearchAttribute {
	private String itemName;
	private int itemID;
	private String Category;
	private String itemImg;
	private int price;
	private ArrayList<Attributes> attr;
	
	
	public ArrayList<Attributes> getAttr() {
		return attr;
	}
	public void setAttr(ArrayList<Attributes> attr) {
		this.attr = attr;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public String getItemImg() {
		return itemImg;
	}
	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
