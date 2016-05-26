package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.MovieEntity;

public class MovieRowMapper implements RowMapper<MovieEntity> {
	//영화 객체 맵핑
	public MovieEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		MovieExtractor movieExtractor = new MovieExtractor();
		return movieExtractor.extractData(rs);
	}
}
