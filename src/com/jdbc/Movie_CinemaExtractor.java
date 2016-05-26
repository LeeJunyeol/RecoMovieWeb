package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.Movie_CinemaEntity;
import com.entity.Movie_CinemaVO;

public class Movie_CinemaExtractor implements ResultSetExtractor<Movie_CinemaEntity>{
	
	public Movie_CinemaEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		Movie_CinemaVO movie_cinemaVO = new Movie_CinemaVO(rs.getString("ISRUN"));
		Movie_CinemaEntity movie_cinema = new Movie_CinemaEntity(rs.getString("MOVIECD"), rs.getString("CINEMAID"),
				rs.getString("SCREENID"), movie_cinemaVO);
		return movie_cinema;
	}
}
