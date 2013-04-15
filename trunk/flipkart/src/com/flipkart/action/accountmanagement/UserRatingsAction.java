package com.flipkart.action.accountmanagement;

import java.util.ArrayList;
import java.util.Map;

import com.flipkart.model.accountmanagement.UserRating;
import com.flipkart.model.accountmanagement.UserRatingModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserRatingsAction extends ActionSupport{
	
	Map sess = ActionContext.getContext().getSession();
	private int userID;
	private ArrayList<UserRating> ratings;
	
	public int getUserID() {
		return userID;
	}
	
	public void setUserID(int userID) {
		this.userID = userID;
	}
	
	public ArrayList<UserRating> getRatings() {
		return ratings;
	}

	public void setRatings(ArrayList<UserRating> ratings) {
		this.ratings = ratings;
	}

	public String loadRatingsPage(){
		setUserID(Integer.valueOf(sess.get("userID").toString()));
		ratings=UserRatingModel.getUserRatings(userID);
		return SUCCESS;
		
	}

}
