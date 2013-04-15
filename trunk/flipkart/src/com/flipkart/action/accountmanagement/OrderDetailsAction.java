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
	private String errorMsg;
	private String actionMsg;
	
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
	
	
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getActionMsg() {
		return actionMsg;
	}

	public void setActionMsg(String actionMsg) {
		this.actionMsg = actionMsg;
	}

	public String loadPage(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		order=OrderDetailsModel.getOrderSummary(userID, orderNo);
		products=OrderDetailsModel.getProductDetails(userID, orderNo);
		
		if(order.getTotalItems()==0){
			errorMsg="Please enter proper Order Number";
			//addActionError("");
			return ERROR;
		}
		else{
			return SUCCESS;
		}
		
	}

}
