package com.flipkart.action.bank;

import java.util.ArrayList;

import com.flipkart.model.bank.Bank;
import com.flipkart.model.bank.BankCustomersModel;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BankCustomersAction extends ActionSupport {

	ArrayList<Bank> customerList;

	public ArrayList<Bank> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(ArrayList<Bank> customerList) {
		this.customerList = customerList;
	}

	public String getAllCustomers() {

		customerList = new ArrayList<Bank>();
		BankCustomersModel.getAllCustomers(customerList);
		return SUCCESS;

	}

}
