package com.flipkart.action.stockmanagement;

import java.util.ArrayList;

import com.flipkart.model.stockmanagement.Stockmanagement;
import com.flipkart.model.stockmanagement.StockmanagementModel;
import com.opensymphony.xwork2.ActionSupport;

public class StockmanagementAction extends ActionSupport{
	ArrayList<Stockmanagement> allItems=new ArrayList<Stockmanagement>();
	private int itemID;
	private String itemNameUpdated;
	private int newQuantity;

	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}
	
	public int getNewQuantity() {
		return newQuantity;
	}
	public void setNewQuantity(int newQuantity) {
		this.newQuantity = newQuantity;
	}
	public ArrayList<Stockmanagement> getAllItems() {
		return allItems;
	}
	public void setAllItems(ArrayList<Stockmanagement> allItems) {
		this.allItems = allItems;
	}
	
	public String getItemNameUpdated() {
		return itemNameUpdated;
	}
	public void setItemNameUpdated(String itemNameUpdated) {
		this.itemNameUpdated = itemNameUpdated;
	}
	public String viewItems(){
		System.out.println("in stock mgmt action ");
		allItems.clear();
		allItems=StockmanagementModel.fetchAllItems();
		System.out.println("size.."+allItems.size());
		for(int i=0;i<allItems.size();i++)
			System.out.println("price.."+allItems.get(i).getPrice());
		return SUCCESS;
	}
	public String updateQuantityInStock(){
		System.out.println("in update qty"+itemID+"..."+newQuantity);
		StockmanagementModel.updateQuantityInStock(itemID,newQuantity);
		StockmanagementModel.insertTransaction(itemID,StockmanagementModel.getItemPrice(itemID),newQuantity);
		return SUCCESS;
	}
}
