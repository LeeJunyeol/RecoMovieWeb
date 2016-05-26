package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.Movie_CinemaDao;
import com.entity.Movie_CinemaEntity;

@Service("movie_cinemaBiz")
public class Movie_CinemaDB {
	Movie_CinemaDao movie_CinemaDao;
	
	@Autowired
	public Movie_CinemaDB(Movie_CinemaDao movie_CinemaDao) {
		super();
		this.movie_CinemaDao = movie_CinemaDao;
	}

	public List<Movie_CinemaEntity> getMovie_CinemaList(String movieCd) {
		List<Movie_CinemaEntity> movie_cinemalist = movie_CinemaDao.getMovie_CinemaList(movieCd);
		return movie_cinemalist;
	}

	public boolean insertMovie_Cinema(Movie_CinemaEntity mce) {
		return movie_CinemaDao.insertMovie_Cinema(mce);
	}

}
