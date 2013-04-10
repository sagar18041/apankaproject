package com.flipkart.action.bank;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.bank.Bank;
import com.flipkart.model.bank.NetBankingModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class NetBankingAction extends ActionSupport {

	ArrayList<Bank> recordList;
	ArrayList<Bank> searchList;
	String accountNumber;
	String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ArrayList<Bank> getSearchList() {
		return searchList;
	}

	public void setSearchList(ArrayList<Bank> searchList) {
		this.searchList = searchList;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public ArrayList<Bank> getRecordList() {
		return recordList;
	}

	public void setRecordList(ArrayList<Bank> recordList) {
		this.recordList = recordList;
	}

	public String viewEntries() {
		System.out.println(accountNumber);
		recordList = new ArrayList<Bank>();
		NetBankingModel.getAllEntries(recordList);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String initPopup() {
		Map session = ActionContext.getContext().getSession();
		session.put("searchValue", 0);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String searchAccountNumber() {
		Map session = ActionContext.getContext().getSession();
		recordList = new ArrayList<Bank>();
		searchList = new ArrayList<Bank>();
		NetBankingModel.getNonNetBankingCustomers(recordList);
		for (int i = 0; i < recordList.size(); i++) {
			if (recordList.get(i).getAccountNumber().contains(accountNumber))
				searchList.add(recordList.get(i));
		}
		session.put("searchValue", 1);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String insertEntry() {
		NetBankingModel.insertEntry(accountNumber, password);
		Map session = ActionContext.getContext().getSession();
		session.put("searchValue", 0);
		return SUCCESS;

	}

	public String deleteEntry() {
		NetBankingModel.deleteEntry(accountNumber);
		return SUCCESS;

	}

}
