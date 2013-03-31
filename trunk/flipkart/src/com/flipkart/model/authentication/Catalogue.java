package com.flipkart.model.authentication;

/**
 * @author bril
 * POJO for building category and subcategory path
 */
public class Catalogue {

	private String catalogueName;	//category/subcategory name
	private Integer catalogueID;	//category/subcategory ID
	private Integer catalogueParentID;	// category/subcategory parent ID
	private Integer catalogueLevel;		//category/subcategory level
	public String getCatalogueName() {
		return catalogueName;
	}
	public void setCatalogueName(String catalogueName) {
		this.catalogueName = catalogueName;
	}
	public Integer getCatalogueID() {
		return catalogueID;
	}
	public void setCatalogueID(Integer catalogueID) {
		this.catalogueID = catalogueID;
	}
	public Integer getCatalogueParentID() {
		return catalogueParentID;
	}
	public void setCatalogueParentID(Integer catalogueParentID) {
		this.catalogueParentID = catalogueParentID;
	}
	public Integer getCatalogueLevel() {
		return catalogueLevel;
	}
	public void setCatalogueLevel(Integer catalogueLevel) {
		this.catalogueLevel = catalogueLevel;
	}

	
}