package com.flipkart.action.systemadminproduct;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import java.io.File;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadBase.FileSizeLimitExceededException;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.flipkart.util.MyUtilityFunctions;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import com.flipkart.model.systemadminproduct.*;

@SuppressWarnings("serial")
public class AdminProductAction extends ActionSupport implements ServletRequestAware{

	private int productID=-1, itemID=-1, categoryID=-1;
	private String productName="";
	private String itemName="",selectedItemName="";
	private int selectedCategoryID=-1;
	private int selectedProductID=-1;
	private int selectedItemID=-1;

	private String attribute, value;
	private int priorityLevel=-1;

	HashMap<Integer,String> categoryList = new HashMap<Integer,String>();
	HashMap<Integer,String> productList = new HashMap<Integer,String>();
	HashMap<Integer,String> itemList = new HashMap<Integer,String>();

	ArrayList<AdminProduct> existingAttributeList = new ArrayList<AdminProduct>();
	ArrayList<AdminProduct> existingProductList = new ArrayList<AdminProduct>();
	ArrayList<AdminProduct> existingItemList = new ArrayList<AdminProduct>();

	private File thumbnail, productImage;
	private String thumbnailContentType;
	private String thumbnailFileName;
	String filePath;
	private String photoURL;
	private HttpServletRequest servletRequest;

	Map adminSession = ActionContext.getContext().getSession();

	int check=0;

	/*
	 * the method called when Product page is loaded for first time
	 */
	public String initializeProductPage(){

		/*
		 * already existing products
		 */
		existingProductList=AdminProductModel.fetchExistingProducts();

		/*
		 * initialize categoryList hash map to display in drop down list
		 */
		categoryList.clear();
		categoryList=AdminProductModel.fetchCategoryList();

		setProductName("");
		setSelectedCategoryID(-1);
		setProductID(-1);

		return SUCCESS;
	}

	/*
	 * To insert Product
	 */
	public String insertProductDetails(){

		try{
			/* validating if values were selected*/
			if ( getSelectedCategoryID() != -1 && !getProductName().equals("") && !getProductName().equals(null) )
			{
				//putting selected categoryID in session
				adminSession.put("categoryID",getSelectedCategoryID());

				int ret;  
				ret= AdminProductModel.checkExistingProduct(getProductName());

				if(ret == 0)
				{
					ret= AdminProductModel.insertNewProduct(getProductName(), getSelectedCategoryID());

					if(ret == -1){
						addActionError("Sorry some error occurred. The new product was not added. Please try again.");

						//to re-initialize the category DDL 
						initializeProductPage();
						return ERROR;
					}
				}
				else{
					addActionError("This product already exists. Please enter another product name.");

					//to re-initialize the page
					initializeProductPage();

					return ERROR;
				}
			}
			else{

				addActionError("Please select values for all  feilds !");
				//to re-initialize 
				initializeProductPage();
				return ERROR;
			}

		}catch(Exception e){
			addActionError("Sorry some error occurred. The new product was not added. Please try again.");
			//to re-initialize
			initializeProductPage();
			return ERROR;
		}

		return SUCCESS;
	}

	/*
	 * to delete product
	 */
	public String deleteProduct(){

		if(getProductID() != -1){

			int ret;

			ret=AdminProductModel.deleteProduct(getProductID());

			if(ret==-1){
				addActionError("Sorry some error occurred. The product was not deleted. Please try again.");
				initializeProductPage();
				return ERROR;
			}
			else{
				initializeProductPage();
			}
		}
		else{
			addActionError("Sorry some error occurred. The product was not deleted. Please try again.");
			initializeProductPage();
			return ERROR;
		}

		return SUCCESS;
	}

	/*
	 * To initialize item page
	 */

	public String initializeItemPage(){

		/*
		 * already existing products
		 */
		existingItemList=AdminProductModel.fetchExistingItems();

		/*
		 * initialize productList hash map to display in drop down list
		 */
		productList.clear();
		productList=AdminProductModel.fetchProductList();

		setItemName("");
		setItemID(-1);
		setSelectedProductID(-1);
		setThumbnail(null);
		setThumbnailFileName(null);
		setThumbnailContentType(null);
		return SUCCESS;

	}

	/*
	 * To insert Item
	 */
	public String insertItemDetails(){

		try {
			//getting the thumbnail
			if(thumbnailFileName != null){
				//get the path where photos will get uploaded
				filePath = servletRequest.getSession().getServletContext().getRealPath("/uploads/itemthumbnails");

				//Create photo name from random generator
				String photoName = MyUtilityFunctions.createVerificationUrl() + "-" + thumbnailFileName;			

				//create photoURL
				photoURL = "uploads/itemthumbnails/" + photoName;

				//create new file with new path and name
				File fileToCreate = new File(filePath, photoName);

				//copy file to given location
				FileUtils.copyFile(this.thumbnail, fileToCreate);
			}
			else{
				addActionError("Please select an image for Item-thumbnail.");
				initializeItemPage();
				return ERROR;
			}

		} 
		catch (Exception e) {
			initializeItemPage();
			addActionError(e.getMessage());
			return ERROR;
		}

		try{

			// validating if values were selected
			if (!getItemName().equals("") && !getItemName().equals(null) && getSelectedProductID() != -1)
			{

				System.out.println("item name:"+getItemName());
				System.out.println("prodID"+getSelectedProductID());
				System.out.println("filname:"+getThumbnailFileName());

				int ret;  
				ret= AdminProductModel.checkExistingItem(getItemName());

				if(ret == 0)
				{
					//inserting the new item
					ret= AdminProductModel.insertNewItem(getItemName(), getSelectedProductID(), photoURL);

					if(ret == -1){
						addActionError("Sorry some error occurred. The new item was not added. Please try again.");
						initializeItemPage();
						return ERROR;
					}
				}
				else{
					addActionError("This item already exists. Please enter another item name.");
					initializeItemPage();
					return ERROR;
				}
			}
			else{
				addActionError("Please select values for all feilds !");
				initializeItemPage();
				return ERROR;
			}
		}catch(Exception e){
			addActionError("Sorry some error occurred. The new item was not added. Please try again.");
			initializeItemPage();
			return ERROR;
		}
		return SUCCESS;
	}

	/*
	 * to delete item
	 */
	public String deleteItem(){

		if(getItemID() != -1){

			int ret;

			System.out.println("Item ID for deletion:"+getItemID());
			ret=AdminProductModel.deleteItem(getItemID());

			if(ret==-1){
				addActionError("Sorry some error occurred. The item was not deleted. Please try again.");
				initializeItemPage();
				return ERROR;
			}
			else{
				initializeItemPage();
			}
		}
		else{
			addActionError("Sorry some error occurred. The item was not deleted. Please try again.");
			initializeItemPage();
			return ERROR;
		}

		return SUCCESS;
	}


	public String initializeSelectItemPage(){

		/*initialize itemList hash map to display in drop down list*/

		itemList.clear();
		itemList=AdminProductModel.fetchItemList();

		setSelectedItemID(-1);

		return SUCCESS;
	}

	public String storeItemforAttribute(){

		System.out.println("getSelectedItemID()= "+getSelectedItemID());

		adminSession.put("itemID", getSelectedItemID());

		return SUCCESS;
	}

	/*
	 * to initialize itemAttribute page
	 */
	public String initializeItemAttributePage(){

		existingAttributeList.clear();

		int tempItemID = Integer.parseInt(adminSession.get("itemID").toString());
		System.out.println("tempItemID="+tempItemID);

		setSelectedItemName(AdminProductModel.fetchItemName(tempItemID));

		existingAttributeList=AdminProductModel.fetchItemAttributesList(tempItemID);

		setAttribute("");
		setValue("");
		setPriorityLevel(-1);

		return SUCCESS;

	}

	/*
	 * To insert item attribute details
	 */
	public String insertAttributeDetails(){

		int itemIDtemp=Integer.parseInt(adminSession.get("itemID").toString());
		System.out.println("itemIDtemp="+itemIDtemp);
		try{
			// validating if text boxes are empty
			if ( !getAttribute().equals("") && !getAttribute().equals(null) && !getValue().equals("") && 
					!getValue().equals(null) && getPriorityLevel() != -1)
			{
				int ret;  
				ret= AdminProductModel.checkExistingAttributeForItem(getAttribute(), itemIDtemp);

				if(ret == 0)
				{

					ret= AdminProductModel.insertNewItemAttribute(itemIDtemp, getAttribute(), getValue(), getPriorityLevel());

					if(ret == -1){

						addActionError("Sorry some error occurred. The new item attribute was not added. Please try again.");
						initializeItemAttributePage();
						return ERROR;
					}
					else{
						initializeItemAttributePage();
					}
				}
				else{
					addActionError("This attribute already exists for this item. Please enter another attribute name.");
					initializeItemAttributePage();
					return ERROR;
				}
			}
			else{

				addActionError("Please give a value for all the feilds !");
				initializeItemAttributePage();
				return ERROR;
			}

		}catch(Exception e){

			addActionError("Sorry some error occurred. The new attribute was not added. Please try again.");
			initializeItemAttributePage();
			return ERROR;
		}
		return SUCCESS;
	}

	public String deleteAttribute(){

		if(!(getAttribute() == null) && !(getAttribute()=="")){

			int ret;
			int itemIDtemp=Integer.parseInt(adminSession.get("itemID").toString());

			ret=AdminProductModel.deleteAttribute(itemIDtemp, getAttribute());

			if(ret==-1){
				addActionError("Sorry some error occurred. The attribute was not deleted. Please try again.");
				initializeItemAttributePage();
				return ERROR;
			}
			else{
				initializeItemAttributePage();
			}
		}
		else{
			addActionError("Sorry some error occurred. The attribute was not deleted. Please try again.");
			initializeItemAttributePage();
			return ERROR;
		}

		return SUCCESS;
	}

	//GETTERS & SETTERS

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public HashMap<Integer, String> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(HashMap<Integer, String> categoryList) {
		this.categoryList = categoryList;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public int getPriorityLevel() {
		return priorityLevel;
	}

	public void setPriorityLevel(int priorityLevel) {
		this.priorityLevel = priorityLevel;
	}

	public File getThumbnail() {
		return thumbnail;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public void setThumbnail(File thumbnail) {
		this.thumbnail = thumbnail;
	}

	public File getProductImage() {
		return productImage;
	}

	public void setProductImage(File productImage) {
		this.productImage = productImage;
	}

	public String getThumbnailContentType() {
		return thumbnailContentType;
	}

	public void setThumbnailContentType(String thumbnailContentType) {
		this.thumbnailContentType = thumbnailContentType;
	}

	public String getThumbnailFileName() {
		return thumbnailFileName;
	}

	public void setThumbnailFileName(String thumbnailFileName) {
		this.thumbnailFileName = thumbnailFileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getPhotoURL() {
		return photoURL;
	}

	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	public ArrayList<AdminProduct> getAttributesList() {
		return existingAttributeList;
	}

	public void setAttributesList(ArrayList<AdminProduct> attributesList) {
		this.existingAttributeList = attributesList;
	}


	public int getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}

	public int getSelectedCategoryID() {
		return selectedCategoryID;
	}

	public void setSelectedCategoryID(int selectedCategoryID) {
		this.selectedCategoryID = selectedCategoryID;
	}

	public ArrayList<AdminProduct> getExistingProductList() {
		return existingProductList;
	}

	public void setExistingProductList(ArrayList<AdminProduct> existingProductList) {
		this.existingProductList = existingProductList;
	}

	public ArrayList<AdminProduct> getExistingItemList() {
		return existingItemList;
	}

	public void setExistingItemList(ArrayList<AdminProduct> existingItemList) {
		this.existingItemList = existingItemList;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public ArrayList<AdminProduct> getExistingAttributeList() {
		return existingAttributeList;
	}

	public void setExistingAttributeList(
			ArrayList<AdminProduct> existingAttributeList) {
		this.existingAttributeList = existingAttributeList;
	}

	public int getItemID() {
		return itemID;
	}

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public HashMap<Integer, String> getProductList() {
		return productList;
	}

	public void setProductList(HashMap<Integer, String> productList) {
		this.productList = productList;
	}

	public HashMap<Integer, String> getItemList() {
		return itemList;
	}

	public void setItemList(HashMap<Integer, String> itemList) {
		this.itemList = itemList;
	}

	public int getSelectedProductID() {
		return selectedProductID;
	}

	public void setSelectedProductID(int selectedProductID) {
		this.selectedProductID = selectedProductID;
	}

	public int getSelectedItemID() {
		return selectedItemID;
	}

	public void setSelectedItemID(int selectedItemID) {
		this.selectedItemID = selectedItemID;
	}

	public String getSelectedItemName() {
		return selectedItemName;
	}

	public void setSelectedItemName(String selectedItemName) {
		this.selectedItemName = selectedItemName;
	}

}
