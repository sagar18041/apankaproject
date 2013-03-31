package com.flipkart.action.cartmanagement;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.cartmanagement.Cart;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.corba.se.impl.ior.NewObjectKeyTemplateBase;

public class CartAction extends ActionSupport{
	private String fromCart;
	private String deliveryCharge;
	private float amountPayable=0;
	private int cartCount=0;
	private int itemID;
	private int newQuantity;
	String movedToWishlistName;

	ArrayList<Cart>cartItems=new ArrayList<Cart>();
	Map cartSession=ActionContext.getContext().getSession();
	Map moveToWishlistCheck=ActionContext.getContext().getSession();
	Cart dummyObject1=new Cart();
	Cart dummyObject2=new Cart();

	public String getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(String deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public int getCartCount() {
		return cartCount;
	}

	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}

	public float getAmountPayable() {
		return amountPayable;
	}

	public void setAmountPayable(float amountPayable) {
		this.amountPayable = amountPayable;
	}

	public ArrayList<Cart> getCartItems() {
		return cartItems;
	}

	public void setCartItems(ArrayList<Cart> cartItems) {
		this.cartItems = cartItems;
	}

	public String getFromCart() {
		return fromCart;
	}

	public void setFromCart(String fromCart) {
		this.fromCart = fromCart;
	}

	public int getItemID() {
		return itemID;
	}

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public String getMovedToWishlistName() {
		return movedToWishlistName;
	}

	public void setMovedToWishlistName(String movedToWishlistName) {
		this.movedToWishlistName = movedToWishlistName;
	}

	public int getNewQuantity() {
		return newQuantity;
	}

	public void setNewQuantity(int newQuantity) {
		this.newQuantity = newQuantity;
	}

	public String displayCart(){
		System.out.println("in cart action..."+fromCart);
		dummyObject1.setItemDescription("Lotus Herbals Natural Kajal 4g (black)");
		dummyObject1.setDeliveryTime("Delivered in 3-5 business days. ");
		dummyObject1.setItemID(100);
		dummyObject1.setPrice(125);
		dummyObject1.setQuantity(2);
		dummyObject1.setImgURL("kajal.jpg");
		dummyObject1.setSubTotal(dummyObject1.getPrice()*dummyObject1.getQuantity());
		dummyObject1.setStatus2(2001);
		dummyObject1.setStatusQuantity(3001);

		dummyObject2.setItemDescription("Nokia Lumia 620 (White) ");
		dummyObject2.setDeliveryTime("Delivered in 2-3 business days. ");
		dummyObject2.setPrice(14999);
		dummyObject2.setItemID(101);
		dummyObject2.setQuantity(3);
		dummyObject2.setImgURL("nokia.jpg");
		dummyObject2.setSubTotal(dummyObject2.getPrice()*dummyObject2.getQuantity());
		dummyObject2.setStatus2(2002);
		dummyObject1.setStatusQuantity(3002);

		cartItems.add(dummyObject1);
		cartItems.add(dummyObject2);
		//moveToWishlistCheck.put("checkDisplay",false);
		cartSession.put("cartItems",cartItems);
		cartItems=(ArrayList<Cart>) cartSession.get("cartItems");

		for(int i=0;i<cartItems.size();i++){
			amountPayable+=cartItems.get(i).getSubTotal();
			cartCount++;
		}
		if(amountPayable>300){
			setDeliveryCharge("Free");
		}
		else{
			setDeliveryCharge("50");
		}
		return SUCCESS;
	}

	public String updateCart(){
		System.out.println("in update cart..."+itemID+"....."+newQuantity);

		cartItems=(ArrayList<Cart>) cartSession.get("cartItems");
		for(int i=0;i<cartItems.size();i++){
			if(cartItems.get(i).getItemID()==itemID){
				cartItems.get(i).setSubTotal(cartItems.get(i).getPrice()*newQuantity);
				cartItems.get(i).setQuantity(newQuantity);
			}
		}
		for(int i=0;i<cartItems.size();i++){
			amountPayable+=cartItems.get(i).getSubTotal();
			cartCount++;
		}
		if(amountPayable>300){
			setDeliveryCharge("Free");
		}
		else{
			setDeliveryCharge("50");
		}
		return SUCCESS;
	}

	public String deleteCart(){
		moveToWishlistCheck.put("checkDeleteDisplay","true");
		System.out.println("in delete cart..."+moveToWishlistCheck.get("checkDisplay"));;
		int index=0;
		cartItems=(ArrayList<Cart>) cartSession.get("cartItems");
		for(int i=0;i<cartItems.size();i++){
			if(cartItems.get(i).getItemID()==itemID){
				movedToWishlistName=cartItems.get(i).getItemDescription();
				index=i;
				break;
			}
		}
		cartItems.remove(index);
		for(int i=0;i<cartItems.size();i++){
			amountPayable+=cartItems.get(i).getSubTotal();
			cartCount++;
		}
		if(amountPayable>300){
			setDeliveryCharge("Free");
		}
		else{
			setDeliveryCharge("50");
		}
		return SUCCESS;
	}
	public String moveWishlist(){
		int index=0;

		System.out.println("in move to wishlist before..."+itemID);
		moveToWishlistCheck.put("checkDisplay","true");

		System.out.println("in move to wishlist..."+moveToWishlistCheck.get("checkDisplay"));
		cartItems=(ArrayList<Cart>) cartSession.get("cartItems");

		for(int i=0;i<cartItems.size();i++){
			if(cartItems.get(i).getItemID()==itemID){
				movedToWishlistName=cartItems.get(i).getItemDescription();
				index=i;
				break;
			}
		}
		cartItems.remove(index);
		/*
		 * 
		 * insert item into wishlist table
		 * 
		 */
		for(int i=0;i<cartItems.size();i++){
			amountPayable+=cartItems.get(i).getSubTotal();
			cartCount++;
		}
		if(amountPayable>300){
			setDeliveryCharge("Free");
		}
		else{
			setDeliveryCharge("50");
		}
		return SUCCESS;
	}
}
