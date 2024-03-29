package com.flipkart.action.payment;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import javax.mail.MessagingException;

import com.flipkart.action.authentication.HomeAction;
import com.flipkart.action.cartmanagement.CartAction;
import com.flipkart.model.authentication.SignUpModel;
import com.flipkart.model.cartmanagement.Cart;
import com.flipkart.model.payment.CartForEmail;
import com.flipkart.model.payment.MakePaymentModel;
import com.flipkart.model.placeorder.OrderModel;
import com.flipkart.util.EmailManager;
import com.flipkart.util.RuntimeSettings;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class MakePaymentAction extends ActionSupport{
	public String addressid;
	public String cardNo;
	public String cardName;
	public String month;
	public String year;
	public String cvv;
	public String customerid;
	public String password;
	
	/* used for right-side order-summary display */
	private int noOfItems = 0;
	private double subTotal = 0.0;
	private double grandTotal = 0.0;
	
	ArrayList<CartForEmail> cartEmail = new ArrayList<CartForEmail>();
	ArrayList<Cart> cartList = new ArrayList<Cart>();
	Map sess = ActionContext.getContext().getSession();
	
	
	public String getCustomerid() {
		return customerid;
	}

	public void setCustomerid(String customerid) {
		this.customerid = customerid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ArrayList<CartForEmail> getCartEmail() {
		return cartEmail;
	}

	public void setCartEmail(ArrayList<CartForEmail> cartEmail) {
		this.cartEmail = cartEmail;
	}

	public int getNoOfItems() {
		return noOfItems;
	}

	public void setNoOfItems(int noOfItems) {
		this.noOfItems = noOfItems;
	}

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}

	public ArrayList<Cart> getCartList() {
		return cartList;
	}

	public void setCartList(ArrayList<Cart> cartList) {
		this.cartList = cartList;
	}

	public String getAddressid() {
		return addressid;
	}

	public void setAddressid(String addressid) {
		this.addressid = addressid;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardName() {
		return cardName;
	}

	public void setCardName(String cardName) {
		this.cardName = cardName;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public String execute(){
		return SUCCESS;
	}
	
	/**
	 * This method is to make the payment using credit card
	 * 1. Check if none of the fields are empty and cvv card number should be 3 number digit
	 * 2. Check if the card number is valid
	 * 3. Check if amount is less than available amount and credit card limit
	 * 4. if all successful then make an entry in bank transaction and update order table
	 * 5. Update bank table and deduct the amount from totalamount and reduce the quantity
	 * @return
	 * @throws MessagingException 
	 */
	public String creditPayment() throws MessagingException{
		
		/*
		 * Task 1 -> Check if fields are not null
		 */
		if(cardName==null || cardNo==null || cvv==null || month==null || year==null){
			addActionMessage("All fields are required");
			return ERROR;
		}
		
		/*
		 * Show data in order Div
		 */
		cartList.clear();
		cartList = (ArrayList<Cart>) sess.get("cartItems");
		for (int i = 0; i < cartList.size(); i++) {
			noOfItems += cartList.get(i).getQuantity();
		}
		subTotal = OrderModel.calculateSubTotal(cartList);
		grandTotal = subTotal;
		if (subTotal < 500) {
			grandTotal += 50;
		}
		
		
		if(getCardName().equals("")){
			addActionMessage("Please enter name on the card");
			return ERROR;
		}
		if(getCardNo().equals("")){
			addActionMessage("Please enter card number");
			return ERROR;
		}
		if(getCvv().equals("") || getCvv().length() != 3){
			addActionMessage("Please enter cvv");
			return ERROR;
		}
		Calendar cal = Calendar.getInstance();
	    
	    
	    System.out.println(month+" "+year);
	    int m = cal.get(Calendar.MONTH) + 1;
	    int y = cal.get(Calendar.YEAR);
	    
	    int enteredMonth=Integer.parseInt(month);
	    int enteredYear=Integer.parseInt(year);
	    System.out.println("Month " + enteredMonth + "Year " + enteredYear);
	    if(enteredYear <= y){
	    	if(enteredMonth<m){
	    		addActionMessage("Please enter correct date");
	    		return ERROR;
	    	}
	    }
	    
	   int year = Integer.parseInt(getYear()) + 2012;
	   String mon = getMonth();
	   if(enteredMonth < 10){
		   mon = "0" + mon;
	   }
	    /*
	     * Task 2 and 3 - > Validate card and amount
	     */
	    String orderNum = "";
	    orderNum =  sess.get("OrderNum").toString();
	    Boolean cardFlag = true;
	    MakePaymentModel mpm = new MakePaymentModel();
	    cardFlag = mpm.validateCard(getCardNo(), getCardName(), Integer.parseInt(getCvv()), mon, year , orderNum , "cc" , (int)grandTotal);
		System.out.println("Card Validation = " + cardFlag);
	    
		if(!cardFlag){
			addActionMessage("Please check the details again.");
			return ERROR;
		}
		/*
		 * Task 4 -> Make entry in bank Transaction and update order Table
		 */
		Boolean checkFlag = true;
		checkFlag = mpm.insertUpdateRecords(orderNum, getCardNo() , "creditCard");
		
		
		

		/*
		 * Task 5 -> update bank table and deduct the amount
		 */
		if(checkFlag)
			checkFlag = mpm.updateBankAmount(getCardNo() , (int)grandTotal , "cc");
		
		if(checkFlag)
		{
			for (int i = 0; i < cartList.size(); i++) {
			 checkFlag = mpm.updateAvailableQuantity(cartList.get(i).getQuantity() , cartList.get(i).getItemID());
			}
		}
		
		if(checkFlag)
			{
			sendEmail(orderNum); // send email
			sess.remove("cartItems"); //remove from session
			CartAction.firstItem=0;
			HomeAction.loadFirstTime = 1;
				return SUCCESS;
			}
		else
			{
				addActionMessage("There is some error , Please try again.");
				return ERROR;
			}
	}
	
	/**
	 * This method is to make the payment using debit card
	 * 1. Check if none of the fields are empty and cvv card number should be 3 number digit
	 * 2. Check if the card number is valid
	 * 3. Check if amount is less than available amount and credit card limit
	 * 4. if all successful then make an entry in bank transaction and update order table
	 * @return
	 * @throws MessagingException 
	 */
	public String debitPayment() throws MessagingException{
		if(cardName==null || cardNo==null || cvv==null || month==null || year==null){
			addActionMessage("All fields are required");
			return ERROR;
		}
		
		/*
		 * Show data in order Div
		 */
		cartList.clear();
		cartList = (ArrayList<Cart>) sess.get("cartItems");
		for (int i = 0; i < cartList.size(); i++) {
			noOfItems += cartList.get(i).getQuantity();
		}
		subTotal = OrderModel.calculateSubTotal(cartList);
		grandTotal = subTotal;
		if (subTotal < 500) {
			grandTotal += 50;
		}
		
		/*
		 * Task 1 -> Check if fields are not null
		 */
		if(getCardName().equals("")){
			addActionMessage("Please enter name on the card");
			return ERROR;
		}
		if(getCardNo().equals("")){
			addActionMessage("Please enter card number");
			return ERROR;
		}
		if(getCvv().equals("") || getCvv().length() != 3){
			addActionMessage("Please enter cvv number");
			return ERROR;
		}
		Calendar cal = Calendar.getInstance();
	    
	    
	    System.out.println(month+" "+year);
	    int m = cal.get(Calendar.MONTH) + 1;
	    int y = cal.get(Calendar.YEAR);
	    
	    int enteredMonth=Integer.parseInt(month);
	    int enteredYear=Integer.parseInt(year);
	    
	    if(enteredYear <= y){
	    	if(enteredMonth<m){
	    		addActionMessage("Please enter correct expiry date");
	    		return ERROR;
	    	}
	    }
	    
	    int year = Integer.parseInt(getYear()) + 2012;
		   String mon = getMonth();
		   if(enteredMonth < 10){
			   mon = "0" + mon;
		   }
		   
	    /*
	     * Task 2 and 3 - > Validate card and amount
	     */
	    String orderNum = "";
	    orderNum =  sess.get("OrderNum").toString();
	    Boolean cardFlag = true;
	    MakePaymentModel mpm = new MakePaymentModel();
	    cardFlag = mpm.validateCard(getCardNo(), getCardName(), Integer.parseInt(getCvv()), mon, year , orderNum , "db" , (int)grandTotal);
		System.out.println("Card Validation = " + cardFlag);
	    
		if(!cardFlag){
			addActionMessage("Please check the details again.");
			return ERROR;
		}
		/*
		 * Task 4 -> Make entry in bank Transaction and update order Table
		 */
		Boolean checkFlag = true;
		checkFlag = mpm.insertUpdateRecords(orderNum, getCardNo() , "debitCard");
		

		/*
		 * Task 5 -> update bank table and deduct the amount
		 */
		if(checkFlag)
			checkFlag = mpm.updateBankAmount(getCardNo() , (int)grandTotal , "db");
		
		if(checkFlag)
		{
			for (int i = 0; i < cartList.size(); i++) {
			 checkFlag = mpm.updateAvailableQuantity(cartList.get(i).getQuantity() , cartList.get(i).getItemID());
			}
		}
		
		
		if(checkFlag)
			{
			sendEmail(orderNum); // send email
			sess.remove("cartItems"); //remove from session
			HomeAction.loadFirstTime = 1;
			CartAction.firstItem=0;
				return SUCCESS;
			}
		else
			{
				addActionMessage("There is some error , please try again.");
				return ERROR;
			}
	}
	
	/**
	 * This method is to make the payment using bank payment
	 * 1. Check if none of the fields are empty and cvv card number should be 3 number digit
	 * 2. Check if the card number is valid
	 * 3. Check if amount is less than available amount and credit card limit
	 * 4. if all successful then make an entry in bank transaction and update order table
	 * @return
	 * @throws MessagingException 
	 */
	public String bankPayment() throws MessagingException{
		/*
		 * Show data in order Div
		 */
		cartList.clear();
		cartList = (ArrayList<Cart>) sess.get("cartItems");
		for (int i = 0; i < cartList.size(); i++) {
			noOfItems += cartList.get(i).getQuantity();
		}
		subTotal = OrderModel.calculateSubTotal(cartList);
		grandTotal = subTotal;
		if (subTotal < 500) {
			grandTotal += 50;
		}
		/*
		 * Task 1 -> Check if fields are not null
		 */
		if(getCustomerid().equals("") || (!getCustomerid().matches("[0-9]*")))
		{
			addActionMessage("Please enter correct customer id");
			return ERROR;
		}
	    if(getPassword().equals("")){
	    	addActionMessage("Please enter password");
	    	return ERROR;
	    }
	    /*
	     * Task 2 and 3 - > Validate card and amount
	     */
	    String orderNum = "";
	    orderNum =  sess.get("OrderNum").toString();
	    Boolean cardFlag = true;
	    MakePaymentModel mpm = new MakePaymentModel();
	    cardFlag = mpm.validateBank(Integer.parseInt(getCustomerid()), getPassword() , (int)grandTotal);
		System.out.println("Bank Validation = " + cardFlag);
	    
		if(!cardFlag){
			addActionMessage("Please check the details again");
			return ERROR;
		}
		/*
		 * Task 4 -> Make entry in bank Transaction and update order Table
		 */
		Boolean checkFlag = true;
		checkFlag = mpm.insertAndUpdateForNetBanking(orderNum, Integer.parseInt(getCustomerid()));
		

		/*
		 * Task 5 -> update bank table and deduct the amount
		 */
		if(checkFlag)
			checkFlag = mpm.updateBankAmountForNetBanking(Integer.parseInt(getCustomerid()), (int)grandTotal);
		
		if(checkFlag)
		{
			for (int i = 0; i < cartList.size(); i++) {
			 checkFlag = mpm.updateAvailableQuantity(cartList.get(i).getQuantity() , cartList.get(i).getItemID());
			}
		}
		
		
		if(checkFlag)
			{
			sendEmail(orderNum); // send email
			sess.remove("cartItems"); //remove from session
			CartAction.firstItem=0;
			HomeAction.loadFirstTime = 1;
				return SUCCESS;
			}
		else
		{
			addActionMessage("There is some error please try again");
			return ERROR;
		}
			
		
		
	}
	/**
	 * Sends email on successful payment
	 * @param orderNum
	 * @throws MessagingException 
	 */
	public void sendEmail(String orderNum) throws MessagingException{
		MakePaymentModel mpm = new MakePaymentModel();
		
		String emailAdd = sess.get("emailAddress").toString();	
		if (SignUpModel.checkUser(emailAdd)) {
			
			 
			String messageSubject = "Flipkart: Order Confirmed";
			String messageBody = "Dear Customer," 
					+ "<br/><br/>Greetings from Flipkart!"
					+ "<br/><br/>We thank you for your order. This email contains your order summary."
					+ "<br/><br/>Please find below the summary of your order" + orderNum + "at Flipkart.com:"
					+ "<br/><br/><html><table border='1'><tr><td>Product Details</td><td>Shipping Address</td><td>Ordered Quantity</td><td>Price(Unit Rs.)</td><td>Sub Total(Unit Rs.)</td></tr>";
					
			cartEmail = mpm.cartDetails(orderNum);
			for(int i = 0 ; i < cartEmail.size() ; i++){
				messageBody = messageBody +
						"<tr>" +
						"<td>" + cartEmail.get(i).getItemDetails() + "</td>" +
						"<td>" + cartEmail.get(i).getShippingAddress() + "</td>" +
						"<td>" + cartEmail.get(i).getQuantity() + "</td>" +
						"<td>" + cartEmail.get(i).getPrice() + "</td>" +
						"<td>" + cartEmail.get(i).getSubTotal() + "</td>" +
						"</tr>";
			}
			messageBody = messageBody	+ "</table></html>";
			messageBody = messageBody	+ "<br/><br/>Please contact us should you have any questions or need further assistance."
					+ "<br/><br/><br/>Thank you for shopping with us!"
					+ "<br/><br/>..............................................................................................................."
					+ "<br/><br/>Flipkart.com... The Online Megastore!";

			if (EmailManager.sendHTMLEmail(emailAdd, messageSubject,
					messageBody, RuntimeSettings.smtpFrom,
					RuntimeSettings.smtpPassword)) {
				
			} else {
				System.out.println("returning error 1");
				
			}
		}
	}
}
