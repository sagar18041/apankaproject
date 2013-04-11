package com.flipkart.action.bank;

import java.util.ArrayList;

import com.flipkart.model.bank.BankCustomer;
import com.flipkart.model.bank.BankCustomersModel;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class BankCustomersAction extends ActionSupport {

	private ArrayList<BankCustomer> customerList;
	private String customerName;
	private String accountNumber;

	/*
	 * Taken 'balance' as 'String' because float was getting displayed as power
	 * of 10
	 */

	private String balance;

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getBalance() {
		return balance;
	}

	public void setBalance(String balance) {
		this.balance = balance;
	}

	public ArrayList<BankCustomer> getCustomerList() {
		return customerList;
	}

	public void setCustomerList(ArrayList<BankCustomer> customerList) {
		this.customerList = customerList;
	}

	public String getAllCustomers() {

		customerList = new ArrayList<BankCustomer>();
		BankCustomersModel.getAllCustomers(customerList);
		return SUCCESS;

	}

	public String insertCustomer() {
		BankCustomer customer = new BankCustomer();
		customer.setAccountNumber(accountNumber);
		customer.setBalance(balance);
		customer.setCustomerName(customerName);
		if (!(BankCustomersModel.isExisting(accountNumber))) {
			BankCustomersModel.insertCustomer(customer);
			return SUCCESS;
		} else {
			customerList = new ArrayList<BankCustomer>();
			BankCustomersModel.getAllCustomers(customerList);
			addActionError("The given account number already exists.");
			return ERROR;
		}

	}

}
