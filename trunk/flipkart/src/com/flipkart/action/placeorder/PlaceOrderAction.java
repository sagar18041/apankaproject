package com.flipkart.action.placeorder;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.placeorder.Order;
import com.flipkart.model.placeorder.ShippingAddress;
import com.flipkart.model.placeorder.ShippingAddressModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PlaceOrderAction extends ActionSupport {

	Map sess=ActionContext.getContext().getSession();
	private String emailID;
	private ArrayList<ShippingAddress> addressList;
	private ArrayList<String> existingAddrList;
	private ArrayList<String> stateList;
	private String addressid="0";
	private int check = 0;
	private String errorMsg = "";
	
	
	/* used to save newly entered shipping address */
	private String shippingName;
	private String shippingAddr;
	private String shippingLm;
	private String shippingCity;
	private String shippingState;
	private String shippingCode;
	private String shippingPhone;
	
	
	
	/*****************later to be removed*************************/
	private ArrayList<String> productList;

	public ArrayList<String> getProductList() {
		return productList;
	}

	public void setProductList(ArrayList<String> productList) {
		this.productList = productList;
	}
	/***************************************************************/

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public ArrayList<ShippingAddress> getAddressList() {
		return addressList;
	}

	public void setAddressList(ArrayList<ShippingAddress> addressList) {
		this.addressList = addressList;
	}

	public ArrayList<String> getExistingAddrList() {
		return existingAddrList;
	}

	public void setExistingAddrList(ArrayList<String> existingAddrList) {
		this.existingAddrList = existingAddrList;
	}

	public ArrayList<String> getStateList() {
		return stateList;
	}

	public void setStateList(ArrayList<String> stateList) {
		this.stateList = stateList;
	}

	public String getAddressid() {
		return addressid;
	}

	public void setAddressid(String addressid) {
		this.addressid = addressid;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getShippingName() {
		return shippingName;
	}

	public void setShippingName(String shippingName) {
		this.shippingName = shippingName;
	}

	public String getShippingAddr() {
		return shippingAddr;
	}

	public void setShippingAddr(String shippingAddr) {
		this.shippingAddr = shippingAddr;
	}

	public String getShippingLm() {
		return shippingLm;
	}

	public void setShippingLm(String shippingLm) {
		this.shippingLm = shippingLm;
	}

	public String getShippingCity() {
		return shippingCity;
	}

	public void setShippingCity(String shippingCity) {
		this.shippingCity = shippingCity;
	}

	public String getShippingState() {
		return shippingState;
	}

	public void setShippingState(String shippingState) {
		this.shippingState = shippingState;
	}

	public String getShippingCode() {
		return shippingCode;
	}

	public void setShippingCode(String shippingCode) {
		this.shippingCode = shippingCode;
	}

	public String getShippingPhone() {
		return shippingPhone;
	}

	public void setShippingPhone(String shippingPhone) {
		this.shippingPhone = shippingPhone;
	}

	/**********************************************************
	 * This method is used to fetch email address of the
	 * registered user and display the email login tab of
	 * Place Order module.
	 **********************************************************/
	public String fetchEmailID() {
		
		sess.put("emailID", "avipsa.nayak@gmail.com");
		sess.put("userID", "1");
		ArrayList<Integer> itemID = new ArrayList<Integer>();
		
		itemID.add(3);
		sess.put("itemID", itemID);

		emailID = sess.get("emailID").toString();

		return SUCCESS;
	}

	/**********************************************************
	 * This method is used to fetch the list of all shipping
	 * addresses of the registered user and display the shipping
	 * address tab of the Place Order module.
	 **********************************************************/
	public String fetchShippingAddr() {
		int uid = Integer.parseInt(sess.get("userID").toString());
		
		addressList = new ArrayList<ShippingAddress>();
		stateList = new ArrayList<String>();
		existingAddrList = new ArrayList<String>();
		
		productList = new ArrayList<String>();

		addressList = ShippingAddressModel.fetchAddrList(uid);
		stateList = ShippingAddressModel.fetchStateList();

		/*
		 * merging the entire shipping details of the user to
		 * show as a single string in MOS
		 */
		for(int i=0; i<addressList.size(); i++) {
			existingAddrList.add(addressList.get(i).getName()+", "+addressList.get(i).getStreetAddress()+
					", "+addressList.get(i).getCity()+", "+
					addressList.get(i).getStateName()+", India, "+addressList.get(i).getPincode()+", "+addressList.get(i).getPhoneNumber());
		}
		
		productList.add("Product1");
		productList.add("Product2");
		productList.add("Product3");

		if(!errorMsg.equals(""))
			addActionError(errorMsg);
		
		return SUCCESS;
	}

	/**************************************************************
	 * This method is used save a newly entered address(if any),
	 * save the items against their shipping addresses and redirect
	 * to order review page.
	 **************************************************************/
	public String goToPayment() {
		
		/*
		 * check if no existing shipping addresses have been selected,
		 * ie, a new shipping address has been entered
		 */
		if(addressid.equals("0")) {
			if(!shippingName.equals("") && !shippingAddr.equals("") && !shippingCity.equals("") 
					&& !shippingPhone.equals("") && !shippingCode.equals("") && !shippingState.equals("-1")) {
				
				ShippingAddress newAddr = new ShippingAddress();
				newAddr.setName(shippingName);
				newAddr.setStreetAddress(shippingAddr);
				newAddr.setLandmark(shippingLm);
				newAddr.setCity(shippingCity);
				newAddr.setStateName(shippingState);
				newAddr.setPincode(shippingCode);
				newAddr.setPhoneNumber(shippingPhone);
				
				/*
				 * insert the newly entered address in the database
				 */
				addressid = ShippingAddressModel.insertShippingAddress(newAddr)+"";
				
			}
			else {
				
				
				errorMsg = "Please provide all details";
				
				return ERROR;
			}
		}
		
		int rand = 1000000 + (int)(Math.random() * ((100000000 - 1000000) + 1));
		String orderNum = "OD"+rand;
		
		System.out.println("****order number****"+orderNum);
		ArrayList<Integer> itemIDs = (ArrayList<Integer>)sess.get("itemID");
		
		Order newOrder = new Order();
		newOrder.setOrderNumber(orderNum);
		newOrder.setItemID(itemIDs.get(0));
		newOrder.setEmailAddress(sess.get("emailID").toString());
		newOrder.setAddressID(Integer.parseInt(addressid));
		newOrder.setStatus("Payment not received");
		
		ShippingAddressModel.insertOrder(newOrder);
		
		return SUCCESS;
	}
}
