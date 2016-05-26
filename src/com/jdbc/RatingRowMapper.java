package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.RatingEntity;

public class RatingRowMapper implements RowMapper<RatingEntity> {

	public RatingEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		RatingExtractor ratingExtractor = new RatingExtractor();
		return ratingExtractor.extractData(rs);
	}
}
