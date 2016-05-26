package com.entity;

import java.sql.Date;

public class BookingVO {
	int memberno;
	String phonenumber;
	int timeno;
	String movieCd;
	String cinemaID;
	String screenID;
	Date bookingdate;
	
	public BookingVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BookingVO(int memberno, String phonenumber, int timeno, String movieCd, String cinemaID, String screenID,
			Date bookingdate) {
		super();
		this.memberno = memberno;
		this.phonenumber = phonenumber;
		this.timeno = timeno;
		this.movieCd = movieCd;
		this.cinemaID = cinemaID;
		this.screenID = screenID;
		this.bookingdate = bookingdate;
	}

	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getPhonenumber() {
		return phonenumber;
	}
	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}
	public int getTimeno() {
		return timeno;
	}
	public void setTimeno(int timeno) {
		this.timeno = timeno;
	}
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
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

	public Date getBookingdate() {
		return bookingdate;
	}

	public void setBookingdate(Date bookingdate) {
		this.bookingdate = bookingdate;
	}
	
	
}
