package com.flipkart.action.placeorder;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.placeorder.ShippingAddress;
import com.flipkart.model.placeorder.ShippingAddressModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PlaceOrderAction extends ActionSupport {

	private String emailID;
	private ArrayList<ShippingAddress> addressList;
	private ArrayList<String> existingAddrList;
	private ArrayList<String> stateList;

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


	/**********************************************************
	 * This method is used to fetch email address of the
	 * registered user and display the email login tab of
	 * Place Order module.
	 **********************************************************/
	public String fetchEmailID() {
		Map sess=ActionContext.getContext().getSession();
		sess.put("emailID", "avipsa.nayak@gmail.com");

		emailID = sess.get("emailID").toString();

		return SUCCESS;
	}

	/**********************************************************
	 * This method is used to fetch the list of all shipping
	 * addresses of the registered user and display the shipping
	 * address tab of the Place Order module.
	 **********************************************************/
	public String fetchShippingAddr() {
		int uid = 1;
		addressList = new ArrayList<ShippingAddress>();
		stateList = new ArrayList<String>();
		existingAddrList = new ArrayList<String>();

		addressList = ShippingAddressModel.fetchAddrList(uid);
		stateList = ShippingAddressModel.fetchStateList();

		for(int i=0; i<addressList.size(); i++) {
			existingAddrList.add(addressList.get(i).getName()+", "+addressList.get(i).getStreetAddress()+
					", "+addressList.get(i).getCity()+", "+
					addressList.get(i).getStateName()+", India, "+addressList.get(i).getPincode()+", "+addressList.get(i).getPhoneNumber());
		}

		return SUCCESS;
	}

	public String goToPayment() {

		return SUCCESS;
	}
}
