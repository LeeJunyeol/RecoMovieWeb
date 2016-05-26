package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.CinemaEntity;

public class CinemaRowMapper implements RowMapper<CinemaEntity> {

	public CinemaEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		CinemaExtractor cinemaExtractor = new CinemaExtractor();
		return cinemaExtractor.extractData(rs);
	}
}
