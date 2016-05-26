package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.SeatEntity;

public class SeatRowMapper implements RowMapper<SeatEntity> {

	public SeatEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		SeatExtractor seatExtractor = new SeatExtractor();
		return seatExtractor.extractData(rs);
	}
}
