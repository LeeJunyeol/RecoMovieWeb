package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.BookingEntity;
import com.entity.BookingVO;

public class BookingExtractor implements ResultSetExtractor<BookingEntity>{
	
	public BookingEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		BookingVO bookingVO = new BookingVO(rs.getInt("MEMBERNO"),rs.getString("PHONENUMBER"),rs.getInt("TIMENO"),
				rs.getString("MOVIECD"), rs.getString("CINEMAID"), rs.getString("SCREENID"), rs.getDate("BOOKINGDATE"));
		BookingEntity booking = new BookingEntity(rs.getInt("BOOKINGNO"), bookingVO);
		return booking;
	}
}
