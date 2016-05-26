package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.Movie_CinemaEntity;

public class Movie_CinemaRowMapper implements RowMapper<Movie_CinemaEntity> {

	public Movie_CinemaEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		Movie_CinemaExtractor movie_cinemaExtractor = new Movie_CinemaExtractor();
		return movie_cinemaExtractor.extractData(rs);
	}
}
