package com.flipkart.action.systemadminproduct;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.flipkart.model.systemadmincategory.AdminCategoryModel;
import com.flipkart.model.systemadminproduct.*;
import java.io.File;

@SuppressWarnings("serial")
public class AdminProductAction extends ActionSupport {

	private String productName;
	private String itemName;
	private String categoryID;
	private int selectedCategoryID;

	HashMap<Integer,String> categoryList = new HashMap<Integer,String>();

	ArrayList<AdminProduct> attributesList = new ArrayList<AdminProduct>();

	private String attribute, value;
	private int priorityLevel;

	private File thumbnail, productImage;
	private String fileUploadContentType;
	private String fileUploadFileName;

	Map adminSession = ActionContext.getContext().getSession();

	int check=0;

	/*
	 * the method called when Product page is loaded for first time
	 */
	public String initializeProductPage(){

		/*
		 * initialize categoryList hash map to display in drop down list
		 */
		categoryList.clear();
		categoryList=AdminProductModel.fetchCategoryList();

		return SUCCESS;
	}

	/*
	 * To insert Product
	 */
	public String insertProductDetails(){

		check=0;

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
						addActionError("Sorry some error occurred. The new product was not added.");
						check=0;
						return ERROR;
					}
					else if (ret == 0){
	
						/*fetch the productID of the newly inserted product*/
						int newProductId=AdminProductModel.fetchNewProductID(Integer.parseInt(adminSession.get("categoryID").toString()));
					
						if(newProductId == -1){
							check=0;
							addActionError("Sorry some error occurred. The new product was not added.");
						}
						else{
							check=1;	
							//putting new ProductID in session
							adminSession.put("productID",newProductId);
						}
					}
				}
				else{
					addActionError("This product already exists. Please enter another product name.");
					check=0;
					return ERROR;
				}
			}
			else{
				check=0;
				addActionError("Please select values for Product name and Category !");
				return ERROR;
			}
		
		}catch(Exception e){
			addActionError("Sorry some error occurred. The new product was not added.");
			return ERROR;
		}

		return SUCCESS;
	}

	/*
	 * To insert item
	 */

	public String initializeItemPage(){

		return SUCCESS;

	}


	/*
	 * To insert item attribute details
	 */
	public String insertAttributeDetails(){

		return SUCCESS;
	}


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

	public String getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	public String getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}


	public ArrayList<AdminProduct> getAttributesList() {
		return attributesList;
	}

	public void setAttributesList(ArrayList<AdminProduct> attributesList) {
		this.attributesList = attributesList;
	}


	public String getCategoryID() {
		return categoryID;
	}

	public void setCategoryID(String categoryID) {
		this.categoryID = categoryID;
	}

	public int getSelectedCategoryID() {
		return selectedCategoryID;
	}

	public void setSelectedCategoryID(int selectedCategoryID) {
		this.selectedCategoryID = selectedCategoryID;
	}

}
