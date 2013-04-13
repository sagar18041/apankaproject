package com.flipkart.action.bank;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.bank.BankCustomer;
import com.flipkart.model.bank.Card;
import com.flipkart.model.bank.DebitCardModel;
import com.flipkart.util.MyUtilityFunctions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DebitCardAction extends ActionSupport {

	ArrayList<Card> recordList;
	private ArrayList<BankCustomer> searchList;
	private String accountNumber;
	private String cardNumber;
	private String cvv;
	private String expiryMonth;
	private String expiryYear;
	private String password;

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public String getExpiryMonth() {
		return expiryMonth;
	}

	public void setExpiryMonth(String expiryMonth) {
		this.expiryMonth = expiryMonth;
	}

	public String getExpiryYear() {
		return expiryYear;
	}

	public void setExpiryYear(String expiryYear) {
		this.expiryYear = expiryYear;
	}

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

	public ArrayList<Card> getRecordList() {
		return recordList;
	}

	public void setRecordList(ArrayList<Card> recordList) {
		this.recordList = recordList;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String initPopup() {
		Map session = ActionContext.getContext().getSession();
		session.put("accountSelected", 0);
		session.put("searchAction", "getNonDCCustomers");
		session.put("selectAction", "DCSelect");
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String getAllEntries() {
		Map session = ActionContext.getContext().getSession();
		session.put("accountSelected", 0);
		recordList = new ArrayList<Card>();
		DebitCardModel.getAllEntries(recordList);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String getNonDCCustomers() {
		Map session = ActionContext.getContext().getSession();
		ArrayList<BankCustomer> recordList = new ArrayList<BankCustomer>();
		searchList = new ArrayList<BankCustomer>();
		DebitCardModel.getNonDCCustomers(recordList);
		for (int i = 0; i < recordList.size(); i++) {
			if (recordList.get(i).getAccountNumber().contains(accountNumber))
				searchList.add(recordList.get(i));
		}
		session.put("accountSelected", 1);

		return SUCCESS;

	}

	public String accountSelected() {

		recordList = new ArrayList<Card>();
		DebitCardModel.getAllEntries(recordList);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String insertDCEntry() {
		Card DBCard = new Card();
		DBCard.setAccountNumber(accountNumber);
		DBCard.setCardNumber(cardNumber);
		DBCard.setCvv(cvv);
		DBCard.setPassword(MyUtilityFunctions.generateMD5(password));

		if (!DebitCardModel.isExisting(cardNumber)) {
			DebitCardModel.insertDCEntry(DBCard, expiryMonth, expiryYear);
			return SUCCESS;
		}

		else {
			addActionError("The card number already exists.");
			Map session = ActionContext.getContext().getSession();
			session.put("accountSelected", 0);
			recordList = new ArrayList<Card>();
			DebitCardModel.getAllEntries(recordList);
			return ERROR;
		}

	}

	public String deleteDCEntry() {
		DebitCardModel.deleteDCEntry(accountNumber);
		return SUCCESS;

	}

}
