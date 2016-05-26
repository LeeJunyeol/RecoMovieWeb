package com.biz;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BookingDao;
import com.entity.BookingEntity;
import com.entity.BookingVO;

@Service("bookingBiz")
public class BookingDB {
	BookingDao bookingDao;
	
	@Autowired
	public BookingDB(BookingDao bookingDao){
		super();
		this.bookingDao = bookingDao;
	}

	public List<BookingEntity> getBookingSelectAll() {
		List<BookingEntity> bookinglist = bookingDao.getBookingSelectAll();
		return bookinglist;
	}

	public boolean deleteBooking(String[] booking) {
		return bookingDao.deleteBooking(booking);		
	}

	public boolean insertBooking(BookingEntity booking) {
		return bookingDao.insertBooking(booking);		
	}

	public List<BookingEntity> findBooking(List<Integer> ch) {
		return bookingDao.findBooking(ch);
	}

	public boolean updateBooking(BookingEntity boooking) {
		return bookingDao.updateBooking(boooking);
	}

	public boolean inputBookingInfo(BookingVO bookingVO) {
		return bookingDao.inputBookingInfo(bookingVO);
	}
	
	public List<BookingEntity> getBooking(BookingVO bookingVO){
		return bookingDao.getBooking(bookingVO);
	}
	
	public BookingEntity getBooking(int bookingno){
		return bookingDao.getBooking(bookingno);
	}

	public List<BookingEntity> getBookingByNo(int myNo) {
		return bookingDao.getBookingByNo(myNo);
	}

	public List<BookingEntity> getBooking(Date date, int timeno, String cinemaID, String screenID) {
		return bookingDao.getBooking(date, timeno, cinemaID, screenID);
	}
	
	public int getResDelete(int resno) {
		int n = bookingDao.getResDelete(resno);
		int m = bookingDao.getResDelete2(resno);
		return m;
	}

}
