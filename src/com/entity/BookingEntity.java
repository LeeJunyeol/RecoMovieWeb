package com.entity;

import java.util.List;

public class BookingEntity {
	private int bookingno;
	private BookingVO bvo;
	private List<BookingEntity> bookingList;
	
	public BookingEntity() {
		super();
	}

	public BookingEntity(int bookingno, BookingVO bvo) {
		super();
		this.bookingno = bookingno;
		this.bvo = bvo;
	}

	public int getBookingno() {
		return bookingno;
	}

	public void setBookingno(int bookingno) {
		this.bookingno = bookingno;
	}

	public BookingVO getBvo() {
		return bvo;
	}

	public void setBvo(BookingVO bvo) {
		this.bvo = bvo;
	}

	public List<BookingEntity> getBookingList() {
		return bookingList;
	}
	
	public void setBookingList(List<BookingEntity> bookingList){
		this.bookingList = bookingList;
	}
}
