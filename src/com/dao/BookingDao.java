package com.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.BookingEntity;
import com.entity.BookingVO;
import com.jdbc.BookingRowMapper;

@Repository("bookingDao")
public class BookingDao {
	DataSource dataSource;
	
	@Autowired
	public BookingDao(DataSource dataSource){
		super();
		this.dataSource = dataSource;
	}
	
	/* Edited By YooNa */
	public BookingEntity getBooking(int bookingno){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from booking where bookingno=?";
		BookingEntity bookinfo = new BookingEntity();
		try{
			return bookinfo = jdbcTemplate.queryForObject(sql, new BookingRowMapper(), new Object[]{bookingno});
		}catch(EmptyResultDataAccessException e){
			return null;
		}
	}
	
	public List<BookingEntity> getBookingSelectAll() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<BookingEntity> list = new ArrayList<BookingEntity>();
		String sql = "select * from booking";
		list = jdbcTemplate.query(sql, new BookingRowMapper());
		return list;
	}

	public boolean deleteBooking(String[] bo) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "delete from booking where bookingno=?";
		int n = 0;
		
		for (String str : bo){
			n = jdbcTemplate.update(sql, new Object[]{str});
		}
		return (n >0) ? true:false;
	}

	public boolean insertBooking(BookingEntity booking) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "insert into booking(bookingno, memberno, phonenumber, timeno, moviecd, cinemaid, screenid) values(?,?,?,?,?,?,?)";
		int rows = jdbcTemplate.update(sql, 
				new Object[]{booking.getBookingno(), booking.getBvo().getMemberno(), booking.getBvo().getPhonenumber(),
						booking.getBvo().getTimeno(), booking.getBvo().getMovieCd(), booking.getBvo().getCinemaID(),
						booking.getBvo().getScreenID(), booking.getBvo().getBookingdate()});
		return rows >0 ? true : false;
	}

	public List<BookingEntity> findBooking(List<Integer> bo) {
		BookingEntity res = new BookingEntity();
		List<BookingEntity> arr_booking = new ArrayList<BookingEntity>();
		for(Integer num : bo){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		arr_booking.add(res);
		}
		return null;
	}

	public boolean updateBooking(BookingEntity booking) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "update booking set memberno=?, phonenumber=?, timeno=?, moviecd=?, cinemaid=?, screenid=?, bookingdate=? where bookingno=?";
		int rows = jdbcTemplate.update(sql, 
				new Object[]{booking.getBvo().getMemberno(), booking.getBvo().getPhonenumber(),
						booking.getBvo().getTimeno(), booking.getBvo().getMovieCd(), booking.getBvo().getCinemaID(),
						booking.getBvo().getScreenID(), booking.getBookingno()});
		
		return rows > 0 ? true : false;
	}
	/* End */

	public boolean inputBookingInfo(BookingVO bookingVO) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "insert into booking(bookingno, memberno, timeno, moviecd, cinemaid, screenid, bookingdate) values(bookingno_seq.nextval,?,?,?,?,?,?)";
		int rows = jdbcTemplate.update(sql, 
				new Object[]{bookingVO.getMemberno(), bookingVO.getTimeno(), bookingVO.getMovieCd(), 
						bookingVO.getCinemaID(), bookingVO.getScreenID(), bookingVO.getBookingdate()});
		return rows >0 ? true : false;
	}

	public List<BookingEntity> getBooking(BookingVO bookingVO) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from booking where memberno=? and cinemaid=? and screenid=? and timeno=? and moviecd=?";
		return jdbcTemplate.query(sql, new BookingRowMapper(), new Object[]{bookingVO.getMemberno(),
				bookingVO.getCinemaID(), bookingVO.getScreenID(), bookingVO.getTimeno(), bookingVO.getMovieCd()});
	}

	public List<BookingEntity> getBookingByNo(int myNo){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from booking where memberno=?";
		try{
			return jdbcTemplate.query(sql, new BookingRowMapper(), new Object[]{myNo});
		}catch(EmptyResultDataAccessException e){
			return null;
		}
	}
	
	public List<BookingEntity> getBooking(Date date, int timeno, String cinemaID, String screenID) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from booking where bookingdate=? and timeno=? and cinemaID=? and screenID=?";
		return jdbcTemplate.query(sql, new BookingRowMapper(), new Object[]{date, timeno, cinemaID, screenID});
	}
	
	public int getResDelete(int resno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "delete from booking_seat where bookingno=?";
		int n = jdbcTemplate.update(sql, new Object[]{resno});
		return n;
	}
	
	public int getResDelete2(int resno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "delete from booking where bookingno=?";
		int n = jdbcTemplate.update(sql, new Object[]{resno});
		return n;
	}

}
