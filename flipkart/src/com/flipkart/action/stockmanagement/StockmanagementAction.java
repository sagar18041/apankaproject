package com.flipkart.action.stockmanagement;

import java.util.ArrayList;

import javax.mail.MessagingException;

import com.flipkart.model.authentication.SignUpModel;
import com.flipkart.model.payment.MakePaymentModel;
import com.flipkart.model.stockmanagement.Stockmanagement;
import com.flipkart.model.stockmanagement.StockmanagementModel;
import com.flipkart.util.EmailManager;
import com.flipkart.util.RuntimeSettings;
import com.opensymphony.xwork2.ActionSupport;

public class StockmanagementAction extends ActionSupport{

	private int itemID;
	private String itemNameUpdated;
	private int newQuantity;

	String[] checkItems;
	int checkedSeller;
	int sellerIDFromMail=-1;

	ArrayList<Stockmanagement> allItems=new ArrayList<Stockmanagement>();
	ArrayList<Stockmanagement> itemsBelowThreshold = new ArrayList<Stockmanagement>();
	ArrayList<Stockmanagement> sellers = new ArrayList<Stockmanagement>();

	public String initializeStockMgmtPage(){

		itemsBelowThreshold = StockmanagementModel.getItemsBelowThreshold();
		sellers = StockmanagementModel.getSellerInfo();

		return SUCCESS;
	}

	public String orderItemStock(){

		System.out.println("Seller:"+checkedSeller);
		System.out.println("checkItems.len"+checkItems.length);

		ArrayList<Stockmanagement> allCheckedItems = new ArrayList<Stockmanagement>(); 

		for(int i=0; i<checkItems.length; i++ ){

			//get the selected itemID and then get its itemDetails
			int tempItemID = Integer.parseInt(checkItems[i].toString());

			/*
			 * ThresholdFlag = 0 means NO REORDER REQUESTED
			 * ThresholdFlag = 1 means REORDER REQUESTED
			 */
			StockmanagementModel.SetThresholdFlag1(tempItemID);
			
			//get the item object
			Stockmanagement tempObj = StockmanagementModel.getItemInfo(tempItemID);

			//add the new object to arraylist
			allCheckedItems.add(tempObj);

		}

		try{
			//send arraylist and sellerInfo to mail
			sendReorderEmail(checkedSeller, allCheckedItems);
			
		} catch(MessagingException e){
			
		}
		
		return SUCCESS;
	}


	public void sendReorderEmail(int sellerID, ArrayList<Stockmanagement> itemList) throws MessagingException{
		MakePaymentModel mpm = new MakePaymentModel();

		String link = "http://localhost:8080/flipkart/updatequantity?sellerIDFromMail="+sellerID;
		String emailAdd= "flipkart.team403.seller@gmail.com";

		System.out.println("Link is: "+ link);

		String messageSubject = "Stock Re-order Request";
		String messageBody = "Dear Seller," 
				+ "<br/><br/>Greetings from Flipkart!"
				+ "<br/><br/>This is is to place a restocking order for few items at Flipkart.com."
				+ "<br/><br/>Please find below the summary of the order:"
				+ "<br/><br/><html><table border='1'><tr><td>ItemName</td><td>Price(Unit Rs.)</td></tr>";

		
		for(int i = 0 ; i < itemList.size() ; i++){
			messageBody = messageBody +
					"<tr>" +
					"<td>" + itemList.get(i).getItemName() + "</td>" +
					"<td>" + itemList.get(i).getPrice() + "</td>" +
					"</tr>";
		}
		messageBody = messageBody	+ "</table></html>";
		messageBody = messageBody + "<br/><br/>Click on the following link to refurnish the stock:<br/><br/>" 
								  + link + "<br/><br/>...............................................................................................................";
		messageBody = messageBody	+ "<br/><br/>Please contact us should you have any questions or queries regarding the order."
				+ "<br/><br/><br/>Thank you for your continuous partnership and support !"
				+ "<br/><br/>..............................................................................................................."
				+ "<br/><br/>Flipkart.com... The Online Megastore!";

		if (EmailManager.sendHTMLEmail(emailAdd, messageSubject,
				messageBody, RuntimeSettings.smtpFrom,
				RuntimeSettings.smtpPassword)) {

		} else {
			System.out.println("returning error 1");

		}

	}

	public String viewItems(){

		allItems.clear();
		allItems=StockmanagementModel.fetchAllItems();
		System.out.println("size.."+allItems.size());

		for(int i=0;i<allItems.size();i++)
			System.out.println("price.."+allItems.get(i).getPrice());
		return SUCCESS;
	}

	public String updateQuantityInStock(){

		System.out.println(" ");
		StockmanagementModel.updateQuantityInStock(itemID,newQuantity);
		StockmanagementModel.insertTransaction(itemID,StockmanagementModel.getItemPrice(itemID),getNewQuantity());
		return SUCCESS;
	}

	/*
	 * Getters and Setters
	 */
	public int getItemID() {
		return itemID;
	}
	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public int getNewQuantity() {
		return newQuantity;
	}
	public void setNewQuantity(int newQuantity) {
		this.newQuantity = newQuantity;
	}
	public ArrayList<Stockmanagement> getAllItems() {
		return allItems;
	}
	public void setAllItems(ArrayList<Stockmanagement> allItems) {
		this.allItems = allItems;
	}

	public String getItemNameUpdated() {
		return itemNameUpdated;
	}
	public void setItemNameUpdated(String itemNameUpdated) {
		this.itemNameUpdated = itemNameUpdated;
	}

	public ArrayList<Stockmanagement> getItemsBelowThreshold() {
		return itemsBelowThreshold;
	}

	public void setItemsBelowThreshold(
			ArrayList<Stockmanagement> itemsBelowThreshold) {
		this.itemsBelowThreshold = itemsBelowThreshold;
	}

	public String[] getCheckItems() {
		return checkItems;
	}

	public void setCheckItems(String[] checkItems) {
		this.checkItems = checkItems;
	}

	public ArrayList<Stockmanagement> getSellers() {
		return sellers;
	}

	public void setSellers(ArrayList<Stockmanagement> sellers) {
		this.sellers = sellers;
	}

	public int getCheckedSeller() {
		return checkedSeller;
	}

	public void setCheckedSeller(int checkedSeller) {
		this.checkedSeller = checkedSeller;
	}

	public int getSellerIDFromMail() {
		return sellerIDFromMail;
	}

	public void setSellerIDFromMail(int sellerIDFromMail) {
		this.sellerIDFromMail = sellerIDFromMail;
	}

}
