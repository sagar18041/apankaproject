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

	private String productName;
	private String itemName;
	private String categoryID;
	private int selectedCategoryID=-1;

	HashMap<Integer,String> categoryList = new HashMap<Integer,String>();

	ArrayList<AdminProduct> attributesList = new ArrayList<AdminProduct>();

	private String attribute, value;
	private int priorityLevel=-1;

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
		 * initialize categoryList hash map to display in drop down list
		 */
		categoryList.clear();
		categoryList=AdminProductModel.fetchCategoryList();
		setProductName("");
		
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
						addActionError("Sorry some error occurred. The new product was not added. Please try again.");
						check=0;
						//to re-initialize the category DDL 
						initializeProductPage();
						return ERROR;
					}
					else if (ret == 0){

						/*fetch the productID of the newly inserted product*/
						int newProductId=AdminProductModel.fetchNewProductID(Integer.parseInt(adminSession.get("categoryID").toString()));

						if(newProductId == -1){
							check=0;
							addActionError("Sorry some error occurred. The new product was not added. Please try again.");
							//to re-initialize the category DDL 
							initializeProductPage();
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

					//to re-initialize the category DDL 
					initializeProductPage();
					check=0;
					return ERROR;
				}
			}
			else{
				check=0;
				addActionError("Please select values for Product name and Category !");
				//to re-initialize the category DDL 
				initializeProductPage();
				return ERROR;
			}

		}catch(Exception e){
			addActionError("Sorry some error occurred. The new product was not added. Please try again.");
			//to re-initialize the category DDL 
			initializeProductPage();
			return ERROR;
		}

		return SUCCESS;
	}

	/*
	 * To initialize item page
	 */

	public String initializeItemPage(){

		setItemName("");
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
				initializeItemPage();
				addActionError("Please select an image for Item-thumbnail.");
				initializeItemPage();
				return ERROR;
			}
				
		} 
		catch (Exception e) {
			e.printStackTrace();
			initializeItemPage();
			addActionError(e.getMessage());
			return ERROR;
		}

		
		try{
		
			// validating if values were selected
			if ( !getItemName().equals("") && !getItemName().equals(null) )
			{
				int ret;  
				ret= AdminProductModel.checkExistingItem(getItemName());
				
				if(ret == 0)
				{
					//fetching productID from Step1 via session
				
					int prodId= Integer.parseInt(adminSession.get("productID").toString());
				
					ret= AdminProductModel.insertNewItem(getItemName(), prodId, photoURL);
					
					if(ret == -1){
						
						addActionError("Sorry some error occurred. The new item was not added. Please try again.");
						initializeItemPage();
						check=0;
						return ERROR;
					}
					else if (ret == 0){
						
						//fetch the itemID of the newly inserted product
						int newItemId=AdminProductModel.fetchNewItemID(prodId);

						if(newItemId == -1){
							check=0;
							initializeItemPage();
							addActionError("Sorry some error occurred. The new item was not added. Please try again.");
						}
						else{
							check=1;	
							//putting new ItemID in session
							adminSession.put("itemID",newItemId);
						}
					}
				}
				else{
					addActionError("This item already exists. Please enter another item name.");
					initializeItemPage();
					check=0;
					return ERROR;
				}
			}
			else{
				check=0;
				addActionError("Please give a value for Item Name !");
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
	 * to initialize itemAttribute page
	 */
	public String initializeItemAttributePage(){

		attributesList.clear();
		//getting the newly created ItemID
		int itemIDtemp=Integer.parseInt(adminSession.get("itemID").toString());
		
		attributesList=AdminProductModel.fetchItemAttributesList(itemIDtemp);
		
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
						System.out.println("prob here");
						addActionError("Sorry some error occurred. The new item attribute was not added. Please try again.");
						initializeItemAttributePage();
						
						return ERROR;
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
	
	public String editAttribute(){
		
		System.out.println("attr:"+getAttribute());
		System.out.println("new value:"+getAttribute());
		System.out.println("new attr:"+getAttribute());
		
		/*
		if(!getAttribute().equals(null) && !getAttribute().equals("") &&
				!getValue().equals(null) && !getValue().equals("") &&
				getPriorityLevel()!=-1){
			
			int ret;
			int itemIDtemp=Integer.parseInt(adminSession.get("itemID").toString());
			
			ret=AdminProductModel.editAttribute(itemIDtemp, getAttribute(), getValue(), getPriorityLevel());
			
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
			addActionError("Sorry some error occurred. Please try again.");
			initializeItemAttributePage();
			return ERROR;
		}
		*/
		return SUCCESS;
	}
	
	public String successProduct(){
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
