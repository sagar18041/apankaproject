package com.flipkart.action.accountmanagement;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.flipkart.model.accountmanagement.OrderHistory;
import com.flipkart.model.accountmanagement.OrderHistoryModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderHistoryAction extends ActionSupport {

	private int userID;
	private ArrayList<String> orderNumbers = new ArrayList<String>();
	private ArrayList<OrderHistory> orderTooltipDetails = new ArrayList<OrderHistory>();
	Map sess = ActionContext.getContext().getSession();
	private HashMap<String, ArrayList<OrderHistory>> orderHistory = new HashMap<String, ArrayList<OrderHistory>>();

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public ArrayList<String> getOrderNumbers() {
		return orderNumbers;
	}

	public void setOrderNumbers(ArrayList<String> orderNumbers) {
		this.orderNumbers = orderNumbers;
	}

	public HashMap<String, ArrayList<OrderHistory>> getOrderHistory() {
		return orderHistory;
	}

	public void setOrderHistory(
			HashMap<String, ArrayList<OrderHistory>> orderHistory) {
		this.orderHistory = orderHistory;
	}

	public ArrayList<OrderHistory> getOrderTooltipDetails() {
		return orderTooltipDetails;
	}

	public void setOrderTooltipDetails(ArrayList<OrderHistory> orderTooltipDetails) {
		this.orderTooltipDetails = orderTooltipDetails;
	}

	
	public String loadPage() {
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		orderNumbers = OrderHistoryModel.getOrderNumberList(userID);
		orderTooltipDetails = OrderHistoryModel.getOrderListTooltipContent(userID, orderNumbers);
		
		for (int i = 0; i < orderNumbers.size(); i++) {
			orderHistory.put(
					orderNumbers.get(i),
					OrderHistoryModel.getOrderDetails(userID,
							orderNumbers.get(i)));
		}

		return SUCCESS;
	}

}
