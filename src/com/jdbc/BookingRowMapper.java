package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.BookingEntity;

public class BookingRowMapper implements RowMapper<BookingEntity> {

	public BookingEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		BookingExtractor bookingExtractor = new BookingExtractor();
		return bookingExtractor.extractData(rs);
	}
}
