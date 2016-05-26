package com.entity;

import java.sql.Date;

public class TimeVO {
	Date s_date;
	Date e_date;
	String startTime;
	int count;
	String cinemaID;
	String screenID;
	String movieCd;
	
	public TimeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TimeVO(Date s_date, Date e_date, String startTime, int count, String cinemaID, String screenID, String movieCd) {
		super();
		this.s_date = s_date;
		this.e_date = e_date;
		this.startTime = startTime;
		this.count = count;
		this.cinemaID = cinemaID;
		this.screenID = screenID;
		this.movieCd = movieCd;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public Date getE_date() {
		return e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}

	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}

	public void setScreenID(String screenID) {
		this.screenID = screenID;
	}

	@Override
	public String toString() {
		return "TimeVO [s_date=" + s_date + ", startTime=" + startTime + ", count=" + count
				+ ", cinemaID=" + cinemaID + ", screenID=" + screenID + ", movieCd=" + movieCd + "]";
	}
	
	
}
