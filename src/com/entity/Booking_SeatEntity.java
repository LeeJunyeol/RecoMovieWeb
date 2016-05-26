package com.entity;

public class Booking_SeatEntity {
	private int bookingno;
	private int seatno;
	private String cinemaID;
	private String screenID;
	
	public Booking_SeatEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Booking_SeatEntity(int bookingno, int seatno, String cinemaID, String screenID) {
		super();
		this.bookingno = bookingno;
		this.seatno = seatno;
		this.cinemaID = cinemaID;
		this.screenID = screenID;
	}

	public int getBookingno() {
		return bookingno;
	}

	public void setBookingno(int bookingno) {
		this.bookingno = bookingno;
	}

	public int getSeatno() {
		return seatno;
	}

	public void setSeatno(int seatno) {
		this.seatno = seatno;
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
