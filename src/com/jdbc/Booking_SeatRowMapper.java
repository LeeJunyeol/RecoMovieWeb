package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.Booking_SeatEntity;

public class Booking_SeatRowMapper implements RowMapper<Booking_SeatEntity> {

	public Booking_SeatEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		Booking_SeatExtractor booking_seatExtractor = new Booking_SeatExtractor();
		return booking_seatExtractor.extractData(rs);
	}
}
