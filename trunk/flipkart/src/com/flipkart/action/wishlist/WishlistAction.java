package com.flipkart.action.wishlist;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Map;

import com.flipkart.model.wishlist.Wishlist;
import com.flipkart.model.wishlist.WishlistModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class WishlistAction extends ActionSupport{
	Integer itemID;
	Integer wishlistCount;
	Integer totalAmount;
	String content;
	Integer fromSelectFlag=0;
	ArrayList<Wishlist> wishlistItems=new ArrayList<Wishlist>();
	ArrayList<String> sortBy=new ArrayList<String>();
	Map session = ActionContext.getContext().getSession();
	public ArrayList<Wishlist> getWishlistItems() {
		return wishlistItems;
	}
	public void setWishlistItems(ArrayList<Wishlist> wishlistItems) {
		this.wishlistItems = wishlistItems;
	}
	public Integer getItemID() {
		return itemID;
	}
	public void setItemID(Integer itemID) {
		this.itemID = itemID;
	}

	public Integer getWishlistCount() {
		return wishlistCount;
	}
	public void setWishlistCount(Integer wishlistCount) {
		this.wishlistCount = wishlistCount;
	}
	public Integer getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Integer totalAmount) {
		this.totalAmount = totalAmount;
	}
	public ArrayList<String> getSortBy() {
		return sortBy;
	}
	public void setSortBy(ArrayList<String> sortBy) {
		this.sortBy = sortBy;
	}

	public Integer getFromSelectFlag() {
		return fromSelectFlag;
	}
	public void setFromSelectFlag(Integer fromSelectFlag) {
		this.fromSelectFlag = fromSelectFlag;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String viewWishlist(){
		if(session.get("login")!=null){
			setTotalAmount(0);
			sortBy=initializeSortBy();
			wishlistItems=WishlistModel.fetchItems();
			wishlistCount=wishlistItems.size();
			for(int i=0;i<wishlistItems.size();i++){
				setTotalAmount(getTotalAmount()+wishlistItems.get(i).getPrice());
			}
			if(content!=null && content.equalsIgnoreCase("price:low to high")){
				System.out.println("in low to high...");
				for(int i=0;i<wishlistItems.size();i++){
					System.out.println("before sorting:"+wishlistItems.get(i).getPrice());
				}
				Collections.sort(wishlistItems,new LowPriceComparator());
				for(int i=0;i<wishlistItems.size();i++){
					System.out.println("after sorting##"+wishlistItems.get(i).getPrice());
				}
			}
			if(content!=null && content.equalsIgnoreCase("price:high to low")){
				System.out.println("in low to high...");
				for(int i=0;i<wishlistItems.size();i++){
					System.out.println("before high sorting:"+wishlistItems.get(i).getPrice());
				}
				Collections.sort(wishlistItems,new LowPriceComparator());
				Collections.reverse(wishlistItems);
				for(int i=0;i<wishlistItems.size();i++){
					System.out.println("after high sorting##"+wishlistItems.get(i).getPrice());
				}
			}


			return SUCCESS;
		}
		else{
			System.out.println("in add cart return error !!!");
			return ERROR;
		}
	}
	public String removeFromWishlist(){
		//System.out.println("in remove from wishlist..  "+ itemID);
		WishlistModel.deletefromWishlist(itemID);
		return SUCCESS;
	}
	public String addToWishlist(){
		if(session.get("login")!=null){
			//System.out.println("in add to wishlist..  "+ itemID);
			//WishlistModel.deletefromWishlist(itemID);
			WishlistModel.addToWishlist(itemID);
			return SUCCESS;
		}
		else{
			System.out.println("in add cart return error !!!");
			return ERROR;
		}
	}
	public ArrayList<String> initializeSortBy(){
		sortBy.clear();
		sortBy.add("Price:Low to High");
		sortBy.add("Price:High to Low");
		return sortBy;
	}
	class LowPriceComparator implements Comparator<Wishlist>{
		public int compare(Wishlist w1, Wishlist w2){
			return new Integer(w1.getPrice().compareTo(new Integer(w2.getPrice())));
		}
	}
}
