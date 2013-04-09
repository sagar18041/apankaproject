package com.flipkart.action.cartmanagement;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.cartmanagement.Cart;
import com.flipkart.model.wishlist.WishlistModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CartAction extends ActionSupport {

	private String fromCart;
	private String deliveryCharge;
	private float amountPayable = 0;
	private int cartCount = 0;
	private String itemName;
	private Integer price;
	private Integer itemID;
	private int newQuantity;
	private static int firstItem = 0;
	public static int divId1 = 100;
	public static int divId2 = 200;
	private String itemMovedToWishlist;
	private String itemAddedToCart;
	private String itemDeletedFromCart;
	Cart c;
	ArrayList<Cart> cartItems = new ArrayList<Cart>();
	Map cartSession = ActionContext.getContext().getSession();
	Map moveToWishlistCheck = ActionContext.getContext().getSession();
	Map session = ActionContext.getContext().getSession();

	public String getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(String deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public int getCartCount() {
		return cartCount;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
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

	public Integer getItemID() {
		return itemID;
	}

	public void setItemID(Integer itemID) {
		this.itemID = itemID;
	}

	public String getItemMovedToWishlist() {
		return itemMovedToWishlist;
	}

	public void setItemMovedToWishlist(String itemMovedToWishlist) {
		this.itemMovedToWishlist = itemMovedToWishlist;
	}

	public String getItemAddedToCart() {
		return itemAddedToCart;
	}

	public void setItemAddedToCart(String itemAddedToCart) {
		this.itemAddedToCart = itemAddedToCart;
	}

	public String getItemDeletedFromCart() {
		return itemDeletedFromCart;
	}

	public void setItemDeletedFromCart(String itemDeletedFromCart) {
		this.itemDeletedFromCart = itemDeletedFromCart;
	}

	public int getNewQuantity() {
		return newQuantity;
	}

	public void setNewQuantity(int newQuantity) {
		this.newQuantity = newQuantity;
	}

	public Cart getC() {
		return c;
	}

	public void setC(Cart c) {
		this.c = c;
	}

	public Cart makeObject() {
		c = new Cart();
		c.setItemDescription(itemName);
		c.setDeliveryTime("Delivered in 2-3 business days. ");
		c.setPrice(price);
		c.setItemID(itemID);
		c.setQuantity(1);
		c.setThumbnail("nokia.jpg");
		c.setSubTotal(price * c.getQuantity());
		c.setStatus2(divId1 + 1);
		c.setStatusQuantity(divId2 + 1);
		divId1++;
		divId2++;
		return c;
	}

	@SuppressWarnings("unchecked")
	public String addToCart() {
		cartCount = 0;
		setItemAddedToCart(itemName);
		if (session.get("login") != null) {
			moveToWishlistCheck.put("checkAddDisplay", "true");
			setItemAddedToCart(itemName);
			System.out.println("item name in add cart modified..."
					+ getItemAddedToCart());
			// System.out.println("wishlist to cart..."
			// +itemName+"   "+price+"   "+itemID);
			if (firstItem == 0) {
				System.out.println("in if...");
				cartItems.add(makeObject());
				cartSession.put("cartItems", cartItems);
				System.out.println("size of arraylist in add..."
						+ cartItems.size());
				firstItem = 1;
			} else {
				cartItems = (ArrayList<Cart>) cartSession.get("cartItems");
				for (int i = 0; i < cartItems.size(); i++) {
					if (cartItems.get(i).getItemID() == itemID) {
						return SUCCESS;
					}
				}
				cartItems.add(makeObject());
				cartSession.put("cartItems", cartItems);
				// System.out.println("size of arraylist in add..."+cartItems.size());
			}

			return SUCCESS;
		} else {
			System.out.println("in add cart return error !!!");
			return ERROR;
		}
	}

	public String addToCartFromWishlist() {
		cartCount = 0;
		setItemAddedToCart(itemName);
		moveToWishlistCheck.put("checkAddDisplay", "true");
		// System.out.println("in add to cart from wishlist"
		// +itemName+"   "+price+"   "+itemID);
		if (firstItem == 0) {
			System.out.println("in if...");
			cartItems.add(makeObject());
			cartSession.put("cartItems", cartItems);
			System.out
			.println("size of arraylist in add..." + cartItems.size());
			firstItem = 1;
		} else {
			cartItems = (ArrayList<Cart>) cartSession.get("cartItems");
			for (int i = 0; i < cartItems.size(); i++) {
				if (cartItems.get(i).getItemID() == itemID) {
					return SUCCESS;
				}
			}
			cartItems.add(makeObject());
			cartSession.put("cartItems", cartItems);
			System.out
			.println("size of arraylist in add..." + cartItems.size());
		}

		for (int i = 0; i < cartItems.size(); i++)
			System.out.println("values in add.."
					+ cartItems.get(i).getStatus2());
		WishlistModel.deletefromWishlist(itemID);
		return SUCCESS;
	}

	public String displayCart() {
		if (session.get("login") != null) {
			cartCount = 0;
			if(cartSession.get("cartItems") != null) {
				cartItems = (ArrayList<Cart>) cartSession.get("cartItems");
			}

			// System.out.println("cart size in display..."+cartItems.size());
			for (int i = 0; i < cartItems.size(); i++) {
				amountPayable += cartItems.get(i).getSubTotal();
				cartCount++;
			}
			cartSession.put("cartCount", cartCount);
			if (amountPayable > 300) {
				setDeliveryCharge("Free");
			} else {
				setDeliveryCharge("50");
			}
			/*
			 * System.out.println("item name in display after add..."+
			 * getItemAddedToCart());
			 * System.out.println("item name in display after delete..."
			 * +getItemDeletedFromCart());
			 * System.out.println("item name in display after move to wishlist..."
			 * +getItemMovedToWishlist());
			 */
			return SUCCESS;
		} else {
			System.out.println("in add cart return error !!!");
			return ERROR;
		}

	}

	public String updateCart() {
		cartCount = 0;

		System.out
		.println("in update cart..." + itemID + "....." + newQuantity);

		cartItems = (ArrayList<Cart>) cartSession.get("cartItems");
		for (int i = 0; i < cartItems.size(); i++) {
			/*
			 * System.out.println("status.."+Cart.status2);
			 * System.out.println("status.."+Cart.statusQuantity);
			 */
			if (cartItems.get(i).getItemID() == itemID) {
				cartItems.get(i).setSubTotal(
						cartItems.get(i).getPrice() * newQuantity);
				cartItems.get(i).setQuantity(newQuantity);
			}
		}

		return SUCCESS;
	}

	public String deleteCart() {
		cartCount = 0;
		moveToWishlistCheck.put("checkDeleteDisplay", "true");
		int index = 0;
		cartItems = (ArrayList<Cart>) cartSession.get("cartItems");
		for (int i = 0; i < cartItems.size(); i++) {
			if (cartItems.get(i).getItemID() == itemID) {
				setItemDeletedFromCart(cartItems.get(i).getItemDescription());
				index = i;
				break;
			}
		}
		System.out.println("item name in delete cart modified..."
				+ getItemDeletedFromCart());
		cartItems.remove(index);

		return SUCCESS;
	}

	public String moveWishlist() {
		cartCount = 0;
		int index = 0;
		moveToWishlistCheck.put("checkDisplay", "true");
		cartItems = (ArrayList<Cart>) cartSession.get("cartItems");

		for (int i = 0; i < cartItems.size(); i++) {
			if (cartItems.get(i).getItemID() == itemID) {
				setItemMovedToWishlist(cartItems.get(i).getItemDescription());
				index = i;
				break;
			}
		}
		System.out.println("item name in move to wishlist cart modified..."
				+ getItemMovedToWishlist());
		cartItems.remove(index);

		WishlistModel.addToWishlist(itemID);
		return SUCCESS;
	}

}
