package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.ScreenEntity;

public class ScreenRowMapper implements RowMapper<ScreenEntity> {

	public ScreenEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		ScreenExtractor screenExtractor = new ScreenExtractor();
		return screenExtractor.extractData(rs);
	}
}
