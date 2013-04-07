package com.flipkart.action.accountmanagement;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.accountmanagement.UserAddress;
import com.flipkart.model.accountmanagement.UserAddressModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AddressManagementAction extends ActionSupport{
	
	private ArrayList<UserAddress> addressList;
	private ArrayList<String> stateList;
	
	private int userID;
	private int addressID;
	private String shippingName;
	private String shippingAddr;
	private String shippingLm;
	private String shippingCity;
	private String shippingState;
	private String shippingCode;
	private String shippingPhone;
	Map sess=ActionContext.getContext().getSession();
	
	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public ArrayList<UserAddress> getAddressList() {
		return addressList;
	}

	public void setAddressList(ArrayList<UserAddress> addressList) {
		this.addressList = addressList;
	}

	public ArrayList<String> getStateList() {
		return stateList;
	}

	public void setStateList(ArrayList<String> stateList) {
		this.stateList = stateList;
	}

	public int getAddressId() {
		return addressID;
	}

	public void setAddressID(int addressID) {
		this.addressID = addressID;
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

	public void loadDetails(){
		stateList = new ArrayList<String>();
		addressList = new ArrayList<UserAddress>();
		shippingName=UserAddressModel.getUserName(userID);
		stateList=UserAddressModel.fetchStateList();
		addressList=UserAddressModel.fetchAddrList(userID);
	}
	
	
	public String loadPage(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		loadDetails();		
		return SUCCESS;
	}

	public String addAddress(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		if(!shippingName.equals("") && !shippingAddr.equals("") && !shippingCity.equals("") 
				&& !shippingPhone.equals("") && !shippingCode.equals("") && !shippingState.equals("-1")) {
			UserAddress ua = new UserAddress();
			ua.setName(shippingName);
			ua.setStreetAddress(shippingAddr);
			ua.setLandmark(shippingLm);
			ua.setCity(shippingCity);
			ua.setStateName(shippingState);
			ua.setPincode(shippingCode);
			ua.setPhoneNumber(shippingPhone);
			
			int result = 0;
			result = UserAddressModel.insertShippingAddress(ua, userID);
			if(result!=0){
				addActionMessage("Your changes have been successfully saved.");
				loadDetails();
				return SUCCESS;
			}
			else{
				addActionError("Oops! Some error occured, please try again.");
				loadDetails();
				return ERROR;
			}
		}
		else{
			addActionError("Please provide all the details.");
			loadDetails();
			return ERROR;
		}
	}
	
	public String deleteAddress(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		int result = 0;
		result = UserAddressModel.deleteShippingAddress(addressID, userID);
		if(result!=0){
			loadDetails();
			return SUCCESS;
		}
		else{
			loadDetails();
			addActionError("Sorry the address selected by you currently has an order for which payment has not been received.");
			return ERROR;
		}
	}
}
