package com.flipkart.action.bank;

import java.util.ArrayList;

import com.flipkart.model.bank.TransactionModel;
import com.flipkart.model.bank.Transactions;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class TransactionAction extends ActionSupport {

	ArrayList<Transactions> transactionList;

	public ArrayList<Transactions> getTransactionList() {
		return transactionList;
	}

	public void setTransactionList(ArrayList<Transactions> transactionList) {
		this.transactionList = transactionList;
	}

	public String getAllTransactions() {
		
		transactionList = new ArrayList<Transactions>();
		TransactionModel.getAllTransactions(transactionList);
		return SUCCESS;

	}

}
