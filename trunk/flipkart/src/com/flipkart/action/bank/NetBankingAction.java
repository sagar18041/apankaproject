package com.flipkart.action.bank;

import java.util.ArrayList;

import com.flipkart.model.bank.NetBanking;
import com.flipkart.model.bank.NetBankingModel;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class NetBankingAction extends ActionSupport {

	ArrayList<NetBanking> recordList;
	int accountNumber;

	public int getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(int accountNumber) {
		this.accountNumber = accountNumber;
	}

	public ArrayList<NetBanking> getRecordList() {
		return recordList;
	}

	public void setRecordList(ArrayList<NetBanking> recordList) {
		this.recordList = recordList;
	}

	public String viewEntries() {

		recordList = new ArrayList<NetBanking>();
		NetBankingModel.getAllEntries(recordList);
		return SUCCESS;

	}

}
