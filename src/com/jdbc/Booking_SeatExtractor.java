package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.Booking_SeatEntity;

public class Booking_SeatExtractor implements ResultSetExtractor<Booking_SeatEntity>{
	
	public Booking_SeatEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		Booking_SeatEntity booking_seat = new Booking_SeatEntity(rs.getInt("BOOKINGNO"), rs.getInt("SEATNO"),
				rs.getString("CINEMAID"), rs.getString("SCREENID"));
		return booking_seat;
	}
}
