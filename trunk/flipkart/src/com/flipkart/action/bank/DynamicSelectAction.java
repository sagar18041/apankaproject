package com.flipkart.action.bank;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class DynamicSelectAction {

	@SuppressWarnings("rawtypes")
	public String searchAction() {
		Map session = ActionContext.getContext().getSession();
		String searchAction = (String) session.get("searchAction");
		return searchAction;

	}
	
	@SuppressWarnings("rawtypes")
	public String selectAction() {
		Map session = ActionContext.getContext().getSession();
		String selectAction = (String) session.get("selectAction");
		return selectAction;

	}

}
