package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MovieDao;
import com.entity.MovieEntity;

@Service("movieBiz")
public class MovieDB {
	MovieDao movieDao;
	
	@Autowired
	public MovieDB(MovieDao movieDao) {
		super();
		this.movieDao = movieDao;
	}

	public List<MovieEntity> getMovieSelectAll() {
		List<MovieEntity> movielist = movieDao.getMovieSelectAll();
		return movielist;
	}

	public List<MovieEntity> getMovieList(String movieCd) {
		List<MovieEntity> movielist = movieDao.getMovieList(movieCd);
		return movielist;
	}

	public List<MovieEntity> getOpenMovieLoad() {
		List<MovieEntity> movielist = movieDao.getOpenMovieLoad();
		return movielist;
	}

	/* Edited By HeeJung*/
	public MovieEntity getMovie(String movieCd) {
		return movieDao.getMovie(movieCd);
	}
	
	public boolean deleteMovie(String[] mov) {
		return movieDao.deleteMovie(mov);
	}
	
	public boolean insertMovie(MovieEntity movie) {
		return movieDao.insertMovie(movie);
	}

	public List<MovieEntity> findMovie(List<String> ch) {
		return movieDao.findMovie(ch);
	}

	public boolean updateMovie(MovieEntity movie) {
		return movieDao.updateMovie(movie);
	}
	/* End */
}
