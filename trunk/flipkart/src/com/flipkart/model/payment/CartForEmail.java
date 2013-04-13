package com.flipkart.model.payment;

public class CartForEmail {
		private String orderNum;
		private int orderID;
		private String shippingAddress;
		private int quantity;
		private int price;
		private int subTotal;
		private String status;
		private String itemDetails;
		
		public String getOrderNum() {
			return orderNum;
		}
		public void setOrderNum(String orderNum) {
			this.orderNum = orderNum;
		}
		public int getOrderID() {
			return orderID;
		}
		public void setOrderID(int orderID) {
			this.orderID = orderID;
		}
		public String getShippingAddress() {
			return shippingAddress;
		}
		public void setShippingAddress(String shippingAddress) {
			this.shippingAddress = shippingAddress;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getSubTotal() {
			return subTotal;
		}
		public void setSubTotal(int subTotal) {
			this.subTotal = subTotal;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getItemDetails() {
			return itemDetails;
		}
		public void setItemDetails(String itemDetails) {
			this.itemDetails = itemDetails;
		}
		
}
