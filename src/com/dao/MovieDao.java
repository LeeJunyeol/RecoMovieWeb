package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.MovieEntity;
import com.jdbc.MovieRowMapper;

@Repository("movieDao")
public class MovieDao {
	DataSource dataSource;
	
	@Autowired
	public MovieDao(DataSource dataSource){
		this.dataSource = dataSource;
	}

	public List<MovieEntity> getOpenMovieLoad() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<MovieEntity> oml = new ArrayList<>();
		
		//상영중인 영화 목록을 로딩
		String sql = "select * from movie where movieCd in (select movieCd from movie_cinema where isRun = '1')";
		oml = jdbcTemplate.query(sql, new MovieRowMapper());
		
		return oml;
	}
	
	public List<MovieEntity> getMovieSelectAll() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<MovieEntity> list = new ArrayList<MovieEntity>();
		String sql = "select * from movie";
		list = jdbcTemplate.query(sql, new MovieRowMapper());
		return list;
	}
	
	public List<MovieEntity> getMovieList(String movieCd) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<MovieEntity> list = new ArrayList<MovieEntity>();
		String sql = "select * from movie where moviecd=?";
		list = jdbcTemplate.query(sql, new MovieRowMapper(), new Object[] {movieCd});
		return list;
	}
	
	/* Edited By HeeJung */
	public MovieEntity getMovie(String movieCd) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from movie where moviecd=?";
		try{
			return jdbcTemplate.queryForObject(sql, new MovieRowMapper(), new Object[] {movieCd});
		}catch(EmptyResultDataAccessException e){
			return null;
		}
	}

	public boolean deleteMovie(String[] ch) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String sql = "delete from movie where moviecd=?";
		int n = 0;

		for (String str : ch) {
			n = jdbcTemplate.update(sql, new Object[] {str});
		}
		return (n > 0) ? true : false;
	}

	public boolean insertMovie(MovieEntity movie) {
		String sql = "insert into movie(moviecd, title, titleen, year, nation, type, genre, director, company, opendate, runningtime) values(?,?,?,?,?,?,?,?,?,?,?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int rows = jdbcTemplate.update(sql,
				new Object[] {movie.getMovieCd(), movie.getMovo().getTitle(), movie.getMovo().getTitleen(),
						movie.getMovo().getYear(), movie.getMovo().getNation(), movie.getMovo().getType(), 
						movie.getMovo().getGenre(), movie.getMovo().getDirector(), movie.getMovo().getCompany(),
						movie.getMovo().getOpendate(), movie.getMovo().getRunningtime()});

		return rows > 0 ? true : false;
		
	}

	public List<MovieEntity> findMovie(List<String> ch) {
		MovieEntity res = new MovieEntity();
		List<MovieEntity> arr_movie = new ArrayList<MovieEntity>();
		for (String num : ch) {
			res = new MovieDao(dataSource).getMovie(num);
			arr_movie.add(res);
		}
		return arr_movie;
	}
	
	public boolean updateMovie(MovieEntity movie) {
		String sql = "update movie set title=?, titleen=?, year=?, nation=?, type=?, genre=?, director=?, company=?, opendate=?, runningtime=? where moviecd=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int rows = jdbcTemplate.update(sql, new Object[] { movie.getMovo().getTitle() , movie.getMovo().getTitleen(),
				movie.getMovo().getYear(), movie.getMovo().getNation(), movie.getMovo().getType(), 
				movie.getMovo().getGenre(), movie.getMovo().getDirector(), movie.getMovo().getCompany(),
				movie.getMovo().getOpendate(), movie.getMovo().getRunningtime(), movie.getMovieCd()});

		return rows > 0 ? true : false;
	}
	/* End */

	public boolean findMovie(int movieCd) {
		// TODO Auto-generated method stub
		return false;
	}

}
