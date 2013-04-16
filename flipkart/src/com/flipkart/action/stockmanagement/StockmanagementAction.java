package com.flipkart.action.stockmanagement;

import java.util.ArrayList;

import com.flipkart.model.stockmanagement.Stockmanagement;
import com.flipkart.model.stockmanagement.StockmanagementModel;
import com.opensymphony.xwork2.ActionSupport;

public class StockmanagementAction extends ActionSupport{

	private int itemID;
	private String itemNameUpdated;
	private int newQuantity;
	
	String[] checkItems;
	int checkedSeller;
	
	ArrayList<Stockmanagement> allItems=new ArrayList<Stockmanagement>();
	ArrayList<Stockmanagement> itemsBelowThreshold = new ArrayList<Stockmanagement>();
	ArrayList<Stockmanagement> sellers = new ArrayList<Stockmanagement>();

	public String initializeStockMgmtPage(){

		itemsBelowThreshold = StockmanagementModel.getItemsBelowThreshold();
		sellers = StockmanagementModel.getSellerInfo();
		
		return SUCCESS;
	}
	
	public String orderItemStock(){
		
		System.out.println("Seller:"+checkedSeller);
		System.out.println("checkItems.len"+checkItems.length);
		
		return SUCCESS;
	}

	public String viewItems(){

		allItems.clear();
		allItems=StockmanagementModel.fetchAllItems();
		System.out.println("size.."+allItems.size());

		for(int i=0;i<allItems.size();i++)
			System.out.println("price.."+allItems.get(i).getPrice());
		return SUCCESS;
	}

	public String updateQuantityInStock(){

		StockmanagementModel.updateQuantityInStock(itemID,newQuantity);
		StockmanagementModel.insertTransaction(itemID,StockmanagementModel.getItemPrice(itemID),newQuantity);
		return SUCCESS;
	}


	/*
	 * Getters and Setters
	 */
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

	public ArrayList<Stockmanagement> getItemsBelowThreshold() {
		return itemsBelowThreshold;
	}

	public void setItemsBelowThreshold(
			ArrayList<Stockmanagement> itemsBelowThreshold) {
		this.itemsBelowThreshold = itemsBelowThreshold;
	}

	public String[] getCheckItems() {
		return checkItems;
	}

	public void setCheckItems(String[] checkItems) {
		this.checkItems = checkItems;
	}

	public ArrayList<Stockmanagement> getSellers() {
		return sellers;
	}

	public void setSellers(ArrayList<Stockmanagement> sellers) {
		this.sellers = sellers;
	}

	public int getCheckedSeller() {
		return checkedSeller;
	}

	public void setCheckedSeller(int checkedSeller) {
		this.checkedSeller = checkedSeller;
	}

}
