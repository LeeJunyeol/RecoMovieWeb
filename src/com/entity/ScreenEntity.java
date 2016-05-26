package com.entity;

public class ScreenEntity {
	private String cinemaID;
	private String screenID;
	
	public ScreenEntity(){
		super();
	}
	
	public ScreenEntity(String cinemaID, String screenID) {
		super();
		this.cinemaID = cinemaID;
		this.screenID = screenID;
	}

	public String getCinemaID() {
		return cinemaID;
	}

	public void setCinemaID(String cinemaID) {
		this.cinemaID = cinemaID;
	}

	public String getScreenID() {
		return screenID;
	}

	public void setScreenID(String screenID) {
		this.screenID = screenID;
	}
}
