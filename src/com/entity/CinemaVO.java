package com.entity;

public class CinemaVO {
	private String cinemaname;
	private String brand;
	private String loc;
	
	public CinemaVO() {
		super();
	}
	public CinemaVO(String cinemaname, String brand, String loc) {
		super();
		this.cinemaname = cinemaname;
		this.brand = brand;
		this.loc = loc;
	}
	public String getCinemaname() {
		return cinemaname;
	}
	public void setCinemaname(String cinemaname) {
		this.cinemaname = cinemaname;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
}
