package com.flipkart.action.bank;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.bank.BankCustomer;
import com.flipkart.model.bank.NetBankingModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class NetBankingAction extends ActionSupport {

	ArrayList<BankCustomer> recordList;
	ArrayList<BankCustomer> searchList;
	String accountNumber;
	String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ArrayList<BankCustomer> getSearchList() {
		return searchList;
	}

	public void setSearchList(ArrayList<BankCustomer> searchList) {
		this.searchList = searchList;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public ArrayList<BankCustomer> getRecordList() {
		return recordList;
	}

	public void setRecordList(ArrayList<BankCustomer> recordList) {
		this.recordList = recordList;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String viewEntries() {
		Map session = ActionContext.getContext().getSession();
		session.put("accountSelected", 0);
		recordList = new ArrayList<BankCustomer>();
		NetBankingModel.getAllEntries(recordList);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String initPopup() {
		Map session = ActionContext.getContext().getSession();
		session.put("accountSelected", 0);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String searchAccountNumber() {
		Map session = ActionContext.getContext().getSession();
		recordList = new ArrayList<BankCustomer>();
		searchList = new ArrayList<BankCustomer>();
		NetBankingModel.getNonNetBankingCustomers(recordList);
		for (int i = 0; i < recordList.size(); i++) {
			if (recordList.get(i).getAccountNumber().contains(accountNumber))
				searchList.add(recordList.get(i));
		}
		session.put("accountSelected", 1);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String insertEntry() {
		NetBankingModel.insertEntry(accountNumber, password);
		Map session = ActionContext.getContext().getSession();
		session.put("accountSelected", 0);
		return SUCCESS;

	}

	public String deleteEntry() {
		NetBankingModel.deleteEntry(accountNumber);
		return SUCCESS;

	}

	public String accountSelected() {

		recordList = new ArrayList<BankCustomer>();
		NetBankingModel.getAllEntries(recordList);
		return SUCCESS;

	}

}
