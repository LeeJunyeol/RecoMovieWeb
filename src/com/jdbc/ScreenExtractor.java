package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.ScreenEntity;

public class ScreenExtractor implements ResultSetExtractor<ScreenEntity>{
	
	public ScreenEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		ScreenEntity screen = new ScreenEntity(rs.getString("CINEMAID"), rs.getString("SCREENID"));
		return screen;
	}
}
