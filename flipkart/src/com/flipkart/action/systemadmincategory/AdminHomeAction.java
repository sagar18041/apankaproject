package com.flipkart.action.systemadmincategory;

import java.util.ArrayList;
import java.util.Map;
import com.flipkart.model.placeorder.Order;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminHomeAction extends ActionSupport{

	public String execute(){
		
		//defining session for Admin System administration
		@SuppressWarnings("rawtypes")
		Map adminSession = ActionContext.getContext().getSession();
		
		return SUCCESS;
	}
}
