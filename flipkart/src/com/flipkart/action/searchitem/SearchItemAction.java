package com.flipkart.action.searchitem;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.flipkart.model.searchitem.SearchAttribute;
import com.flipkart.model.searchitem.SearchCategory;
import com.flipkart.model.searchitem.SearchCategoryModel;
import com.opensymphony.xwork2.ActionSupport;

public class SearchItemAction extends ActionSupport{
	public String searchText;
	public String categorySel;
	ArrayList<SearchCategory> searchCatg = new ArrayList<SearchCategory>();
	ArrayList<SearchAttribute> searchAttr = new ArrayList<SearchAttribute>();
	Map<String , ArrayList<SearchAttribute>> catItems;
	
	
	public ArrayList<SearchAttribute> getSearchAttr() {
		return searchAttr;
	}


	public void setSearchAttr(ArrayList<SearchAttribute> searchAttr) {
		this.searchAttr = searchAttr;
	}


	public Map<String, ArrayList<SearchAttribute>> getCatItems() {
		return catItems;
	}


	public void setCatItems(Map<String, ArrayList<SearchAttribute>> catItems) {
		this.catItems = catItems;
	}


	public ArrayList<SearchCategory> getSearchCatg() {
		return searchCatg;
	}


	public void setSearchCatg(ArrayList<SearchCategory> searchCatg) {
		this.searchCatg = searchCatg;
	}


	public String getSearchText() {
		return searchText;
	}


	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}


	public String getCategorySel() {
		return categorySel;
	}


	public void setCategorySel(String categorySel) {
		this.categorySel = categorySel;
	}

/*
 * (non-Javadoc)
 * @see com.opensymphony.xwork2.ActionSupport#execute()
 * Get the list of all the items for the searchText and category
 */
	public String execute() {
		System.out.println("in search action.....");
		System.out.println("Category = " + getCategorySel());
		System.out.println("text = " + getSearchText());
		
		/*
		 * If nothing is entered in the search text then go to same page
		 */
		if(getSearchText().equals(null) || getSearchText().equals(""))
		{
			return ERROR;
		}
		
		SearchCategoryModel scm = new SearchCategoryModel();
		
		if(getCategorySel().equals("All Category"))
		{
			searchCatg = scm.fetchForAllCat(getSearchText());
		}
		else
		{
			searchCatg = scm.fetchForCat(getSearchText() , getCategorySel());
		}
		
		
		System.out.println("Items List = " + searchCatg.size());
		//No Record found page
		if((searchCatg.size() == 0)){
			return ERROR;
		}
		//***************************
		/*
		 * Using hash map to display the data on the page
		 * For each CAtegory arraylist of attibute 
		 */
		String catgName; 
		catItems = new HashMap<String , ArrayList<SearchAttribute>>();
		
		
		for(int i = 0 ; i < searchCatg.size() ; i++)
		{
			catgName = searchCatg.get(i).categoryName;
			System.out.println("CAtegory Name is " + catgName);
			searchAttr = scm.fetchAttribute(catgName, searchText);
			System.out.println("ArryaList has been got " + searchAttr.size());
			
			catItems.put(catgName, searchAttr);
			System.out.println("Put in hashmap");
		}
		
		System.out.println("hash map size " + catItems.size());
		return SUCCESS;
	}
}
