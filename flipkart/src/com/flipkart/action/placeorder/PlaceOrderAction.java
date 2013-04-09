package com.flipkart.action.placeorder;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.cartmanagement.Cart;
import com.flipkart.model.placeorder.Order;
import com.flipkart.model.placeorder.OrderModel;
import com.flipkart.model.placeorder.ShippingAddress;
import com.flipkart.model.placeorder.ShippingAddressModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PlaceOrderAction extends ActionSupport {

	Map sess = ActionContext.getContext().getSession();

	/* used for email tab */
	ArrayList<Cart> cartList = new ArrayList<Cart>();
	private String emailID;

	/* used for right-side order-summary display */
	private int noOfItems = 0;
	private double subTotal = 0.0;
	private double grandTotal = 0.0;

	/* used for shipping-address tab */
	private ArrayList<ShippingAddress> addressList;
	private ArrayList<String> existingAddrList;
	private ArrayList<String> stateList;
	private String addressid = "0";
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

	/* used for MOS */
	private String mapping;

	/* used for order summary tab */
	private String deliveryCharge;
	private float amountPayable = 0;
	private int itemID;
	private String itemDeleted = "";

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

	public int getNoOfItems() {
		return noOfItems;
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

	public void setNoOfItems(int noOfItems) {
		this.noOfItems = noOfItems;
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

	public String getMapping() {
		return mapping;
	}

	public void setMapping(String mapping) {
		this.mapping = mapping;
	}

	public String getDeliveryCharge() {
		return deliveryCharge;
	}

	public void setDeliveryCharge(String deliveryCharge) {
		this.deliveryCharge = deliveryCharge;
	}

	public float getAmountPayable() {
		return amountPayable;
	}

	public void setAmountPayable(float amountPayable) {
		this.amountPayable = amountPayable;
	}

	public int getItemID() {
		return itemID;
	}

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public String getItemDeleted() {
		return itemDeleted;
	}

	public void setItemDeleted(String itemDeleted) {
		this.itemDeleted = itemDeleted;
	}

	/************************************************************************
	 * This method is used to fetch email address of the registered user and
	 * display the email login tab of Place Order module.
	 ************************************************************************/
	public String fetchEmailID() {

		emailID = sess.get("emailAddress").toString();

		// to display the right-side order summary on each tab
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

		return SUCCESS;
	}

	/**************************************************************************
	 * This method is used to fetch the list of all shipping addresses of the
	 * registered user and display the shipping address tab of the Place Order
	 * module.
	 **************************************************************************/
	public String fetchShippingAddr() {
		int uid = Integer.parseInt(sess.get("userID").toString());

		// to display the right-side order summary on each tab
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

		addressList = new ArrayList<ShippingAddress>();
		stateList = new ArrayList<String>();

		addressList = ShippingAddressModel.fetchAddrList(uid);
		stateList = ShippingAddressModel.fetchStateList();

		/*
		 * merging the entire shipping details of the user to show as a single
		 * string in MOS
		 */
		existingAddrList = new ArrayList<String>();
		for (int i = 0; i < addressList.size(); i++) {
			existingAddrList.add(addressList.get(i).getName() + ", "
					+ addressList.get(i).getStreetAddress() + ", "
					+ addressList.get(i).getCity() + ", "
					+ addressList.get(i).getStateName() + ", India, "
					+ addressList.get(i).getPincode() + ", "
					+ addressList.get(i).getPhoneNumber());
		}

		if (!errorMsg.equals(""))
			addActionError(errorMsg);

		return SUCCESS;
	}

	/****************************************************************************
	 * This method is used to save a newly entered address(if any), and redirect
	 * to order summary page.
	 ****************************************************************************/
	public String fetchOrderSummary() {

		// to display the right-side order summary on each tab
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

		if(mapping == null){
			/*
			 * check if no existing shipping addresses have been selected, ie, a new
			 * shipping address has been entered
			 */
			if (addressid.equals("0")) {
				if (!shippingName.equals("") && !shippingAddr.equals("")
						&& !shippingCity.equals("") && !shippingPhone.equals("")
						&& !shippingCode.equals("") && !shippingState.equals("-1")) {

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
					addressid = ShippingAddressModel.insertShippingAddress(newAddr)
							+ "";
				} else {
					errorMsg = "Please provide all details";

					return ERROR;
				}
			}
		}

		boolean flag = false;

		if(sess.get("OrderNum") != null)
			flag = deleteItemFromDB(sess.get("emailAddress").toString());

		createOrder(flag);

		for (int i = 0; i < cartList.size(); i++) {
			cartList.get(i).setSubCategory(
					OrderModel.fetchSubCategory(cartList.get(i).getItemID()));
		}

		for (int i = 0; i < cartList.size(); i++) {
			amountPayable += cartList.get(i).getSubTotal();
		}
		if (amountPayable >= 500) {
			setDeliveryCharge("Free");
		} else {
			setDeliveryCharge("50");
		}

		emailID = sess.get("emailAddress").toString();

		return SUCCESS;
	}

	/**************************************************************
	 * This method is used to save the items against their shipping addresses
	 * and create a new order thereby.
	 **************************************************************/
	public void createOrder(boolean flag) {

		/*
		 * insert the order in the database if selected for the first time, or
		 * update it's entry with the new shipping address if already existing
		 */
		String orderNum = "";
		if (!flag) {
			int rand = 1000000 + (int) (Math.random() * ((100000000 - 1000000) + 1));
			orderNum = "OD" + rand;

			if (sess.get("OrderNum") == null) {
				sess.put("OrderNum", orderNum);
			}
		} else {
			orderNum = sess.get("OrderNum").toString();
		}

		int addr[] = new int[cartList.size()];
		if(mapping != null) {
			for(int i = 0; i < cartList.size(); i++) {
				addr[i] = Integer.parseInt(mapping.charAt(i*4+2)+"");
				System.out.println("**index**"+addr[i]);
			}
			
			addressList = ShippingAddressModel.fetchAddrList(Integer.parseInt(sess.get("userID").toString()));
			
			for(int i = 0; i < cartList.size(); i++) {
				addr[i] = addressList.get(addr[i]-1).getAddressID();
			}
		}

		for (int i = 0; i < cartList.size(); i++) {
			Order newOrder = new Order();
			newOrder.setOrderNumber(orderNum);
			newOrder.setItemID(cartList.get(i).getItemID());
			newOrder.setQuantity(cartList.get(i).getQuantity());
			newOrder.setTotalPrice(cartList.get(i).getQuantity()
					* cartList.get(i).getPrice());
			newOrder.setEmailAddress(sess.get("emailAddress").toString());
			if(mapping != null) {
				newOrder.setAddressID(addr[i]);
			} else {
				newOrder.setAddressID(Integer.parseInt(addressid));
			}
			newOrder.setStatus("Processing");
			newOrder.setShippingCharge(grandTotal-subTotal);

			ShippingAddressModel.insertOrder(newOrder);
		}
	}

	/***************************************************************************
	 * This method is used to delete those item entries from the Order table
	 * which has been deleted from the cart/checkout.
	 * 
	 * @param emailID
	 * @return true if any such entry is present
	 ***************************************************************************/
	public boolean deleteItemFromDB(String emailID) {
		ArrayList<Integer> items = ShippingAddressModel.findAllOrders(emailID);

		// find those items which are not there in cart anymore
		for (int i = 0; i < items.size(); i++) {
			boolean found = false;
			for (int j = 0; j < cartList.size(); j++) {
				if (items.get(i) == cartList.get(j).getItemID()) {
					found = true;
				}
			}

			if (!found) {
				ShippingAddressModel.deleteItemOrder(items.get(i), emailID);
			}
		}

		/*
		 * return true, if any item entry exists in Order table for the
		 * currently logged-in user
		 */
		if (items.size() > 0) {
			return true;
		} else {
			return false;
		}

	}

	/*************************************************************
	 * This method is used to delete an item selected by the user from the
	 * cart(session) and reload the order-summary page.
	 *************************************************************/
	public String deleteItemFromCart() {

		cartList.clear();
		cartList = (ArrayList<Cart>) sess.get("cartItems");
		emailID = sess.get("emailAddress").toString();

		/*
		 * deleting the item selected from cart(session)
		 */
		for (int i = 0; i < cartList.size(); i++) {
			if (cartList.get(i).getItemID() == itemID) {
				setItemDeleted(cartList.get(i).getItemDescription());
				cartList.remove(i);
				break;
			}
		}

		// delete the above deleted item entries from Order table
		deleteItemFromDB(emailID);

		// to display the right-side order summary on each tab
		for (int i = 0; i < cartList.size(); i++) {
			noOfItems += cartList.get(i).getQuantity();
		}
		subTotal = OrderModel.calculateSubTotal(cartList);
		grandTotal = subTotal;
		if (subTotal < 500 && subTotal != 0) {
			grandTotal += 50;
			setAmountPayable(getAmountPayable() + 50);
		}

		// to update cart count on the cart icon in header
		sess.remove("cartCount");
		sess.put("cartCount", cartList.size());

		for (int i = 0; i < cartList.size(); i++) {
			cartList.get(i).setSubCategory(
					OrderModel.fetchSubCategory(cartList.get(i).getItemID()));
		}

		for (int i = 0; i < cartList.size(); i++) {
			amountPayable += cartList.get(i).getSubTotal();
		}
		if (amountPayable >= 500) {
			setDeliveryCharge("Free");
		} else if (amountPayable != 0) {
			setDeliveryCharge("50");
		}

		return SUCCESS;
	}

	/**********************************************************
	 * This method is used to go to payment tab
	 **********************************************************/
	public String goToPayment() {
		// to display the right-side order summary on each tab
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

		return SUCCESS;
	}
}
