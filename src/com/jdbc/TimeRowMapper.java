package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.TimeEntity;

public class TimeRowMapper implements RowMapper<TimeEntity> {

	public TimeEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		TimeExtractor timeExtractor = new TimeExtractor();
		return timeExtractor.extractData(rs);
	}
}
