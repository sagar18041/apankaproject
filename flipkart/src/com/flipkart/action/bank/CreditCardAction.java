package com.flipkart.action.bank;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.bank.BankCustomer;
import com.flipkart.model.bank.Card;
import com.flipkart.model.bank.CreditCardModel;
import com.flipkart.model.bank.DebitCardModel;
import com.flipkart.util.MyUtilityFunctions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class CreditCardAction extends ActionSupport {

	ArrayList<Card> recordList;
	private ArrayList<BankCustomer> searchList;
	private String accountNumber;
	private String cardNumber;
	private String cvv;
	private String expiryMonth;
	private String expiryYear;
	private String password;
	private String creditLimit;

	public String getCreditLimit() {
		return creditLimit;
	}

	public void setCreditLimit(String creditLimit) {
		this.creditLimit = creditLimit;
	}

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
		session.put("searchAction", "getNonCCCustomers");
		session.put("selectAction", "CCSelect");
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String getAllEntries() {
		Map session = ActionContext.getContext().getSession();
		session.put("accountSelected", 0);
		recordList = new ArrayList<Card>();
		CreditCardModel.getAllEntries(recordList);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String getNonCCCustomers() {
		Map session = ActionContext.getContext().getSession();
		ArrayList<BankCustomer> recordList = new ArrayList<BankCustomer>();
		searchList = new ArrayList<BankCustomer>();
		CreditCardModel.getNonCCCustomers(recordList);
		for (int i = 0; i < recordList.size(); i++) {
			if (recordList.get(i).getAccountNumber().contains(accountNumber))
				searchList.add(recordList.get(i));
		}
		session.put("accountSelected", 1);

		return SUCCESS;

	}

	public String accountSelected() {

		recordList = new ArrayList<Card>();
		CreditCardModel.getAllEntries(recordList);
		return SUCCESS;

	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public String insertCCEntry() {
		Card CCard = new Card();
		CCard.setAccountNumber(accountNumber);
		CCard.setCardNumber(cardNumber);
		CCard.setCvv(cvv);
		CCard.setPassword(MyUtilityFunctions.generateMD5(password));
		CCard.setCreditLimit(creditLimit);

		if (!CreditCardModel.isExisting(cardNumber)) {
			CreditCardModel.insertCCEntry(CCard, expiryMonth, expiryYear);
			return SUCCESS;
		}

		else {
			addActionError("The card number already exists.");
			Map session = ActionContext.getContext().getSession();
			session.put("accountSelected", 0);
			recordList = new ArrayList<Card>();
			CreditCardModel.getAllEntries(recordList);
			return ERROR;
		}

	}

	public String deleteCCEntry() {
		CreditCardModel.deleteCCEntry(accountNumber);
		return SUCCESS;

	}

}
