package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.Movie_CinemaEntity;
import com.jdbc.Movie_CinemaRowMapper;

@Repository("movie_cinemaDao")
public class Movie_CinemaDao {
	DataSource dataSource;
	
	@Autowired
	public Movie_CinemaDao(DataSource dataSource){
		this.dataSource = dataSource;
	}

	public List<Movie_CinemaEntity> getMovie_CinemaList(String movieCd) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<Movie_CinemaEntity> list = new ArrayList<Movie_CinemaEntity>();
		String sql = "select * from movie_cinema where moviecd=?";
		list = jdbcTemplate.query(sql, new Movie_CinemaRowMapper(), new Object[] {movieCd});
		return list;
	}

	public boolean insertMovie_Cinema(Movie_CinemaEntity mce) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "insert into movie_cinema values(?,?,?,?)";
		int r = jdbcTemplate.update(sql, new Object[]{mce.getMovieCd(), mce.getCinemaID(), mce.getScreenID(), 
				mce.getM_cvo().getIsRun()});
		return r>0? true:false;
	}
}
