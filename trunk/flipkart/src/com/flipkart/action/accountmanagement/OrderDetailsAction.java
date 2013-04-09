package com.flipkart.action.accountmanagement;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.accountmanagement.OrderDetails;
import com.flipkart.model.accountmanagement.OrderDetailsModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderDetailsAction extends ActionSupport{
	
	Map sess = ActionContext.getContext().getSession();
	private int userID;
	private OrderDetails order;
	private String orderNo;
	private ArrayList<OrderDetails> products;
	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public OrderDetails getOrder() {
		return order;
	}

	public void setOrder(OrderDetails order) {
		this.order = order;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	
	public ArrayList<OrderDetails> getProducts() {
		return products;
	}

	public void setProducts(ArrayList<OrderDetails> products) {
		this.products = products;
	}

	public String loadStatusPage(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		return SUCCESS;
	}
	
	public String loadPage(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		order=OrderDetailsModel.getOrderSummary(userID, orderNo);
		products=OrderDetailsModel.getProductDetails(userID, orderNo);
		
		if(order.getTotalItems()==0){
			addActionError("Please enter proper Order Number");
			return ERROR;
		}
		else{
			return SUCCESS;
		}
		
	}

}
