package com.entity;

import java.util.List;

public class MovieEntity {
	private String movieCd;
	private MovieVO movo;
	private List<MovieEntity> movieList;
	
	public MovieEntity() {
		super();
	}
	
	public MovieEntity(String movieCd, MovieVO movo) {
		super();
		this.movieCd = movieCd;
		this.movo = movo;
	}

	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
	public MovieVO getMovo() {
		return movo;
	}
	public void setMovo(MovieVO movo) {
		this.movo = movo;
	}

	public List<MovieEntity> getMovieList() {
		return movieList;
	}

	public void setMovieList(List<MovieEntity> movieList) {
		this.movieList = movieList;
	}
	
}
