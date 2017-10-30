package com.amc.service.domain;

public class WishList {

	int wishNo;
	User user;
	ScreenContent screenContent;
	String wishRegDate;
	
	public int getWishNo() {
		return wishNo;
	}
	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public ScreenContent getScreenContent() {
		return screenContent;
	}
	public void setScreenContent(ScreenContent screenContent) {
		this.screenContent = screenContent;
	}
	public String getWishRegDate() {
		return wishRegDate;
	}
	public void setWishRegDate(String wishRegDate) {
		this.wishRegDate = wishRegDate;
	}
	@Override
	public String toString() {
		return "WishList [wishNo=" + wishNo + ", user=" + user + ", screenContent=" + screenContent + ", wishRegDate="
				+ wishRegDate + "]";
	}
	
	
		
}
