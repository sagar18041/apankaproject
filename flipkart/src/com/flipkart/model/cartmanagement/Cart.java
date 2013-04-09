package com.flipkart.model.cartmanagement;

public class Cart {
        private String itemDescription;
        private String deliveryTime;
        private String subCategory;
        private int itemID;
        private float price;
        private int quantity;
        private float subTotal;
        private String thumbnail;
        private int status2;
        private int statusQuantity;
        
		public String getSubCategory() {
			return subCategory;
		}
		public void setSubCategory(String subCategory) {
			this.subCategory = subCategory;
		}
        public String getThumbnail() {
			return thumbnail;
		}
		public void setThumbnail(String thumbnail) {
			this.thumbnail = thumbnail;
		}
		public int getItemID() {
                return itemID;
        }
        public void setItemID(int itemID) {
                this.itemID = itemID;
        }
        public String getItemDescription() {
                return itemDescription;
        }
        public void setItemDescription(String itemDescription) {
                this.itemDescription = itemDescription;
        }
        public String getDeliveryTime() {
                return deliveryTime;
        }
        public void setDeliveryTime(String deliveryTime) {
                this.deliveryTime = deliveryTime;
        }
        public float getPrice() {
                return price;
        }
        public void setPrice(float price) {
                this.price = price;
        }
        public int getQuantity() {
                return quantity;
        }
        public void setQuantity(int quantity) {
                this.quantity = quantity;
        }
        public float getSubTotal() {
                return subTotal;
        }
        public void setSubTotal(float subTotal) {
                this.subTotal = subTotal;
        }
        public int getStatus2() {
                return status2;
        }
        public void setStatus2(int status2) {
                this.status2 = status2;
        }
        public int getStatusQuantity() {
                return statusQuantity;
        }
        public void setStatusQuantity(int statusQuantity) {
                this.statusQuantity = statusQuantity;
        }
        
        
}