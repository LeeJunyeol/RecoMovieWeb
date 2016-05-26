package com.entity;

public class Movie_CinemaEntity {
	private String movieCd;
	private String cinemaID;
	private String screenID;
	private Movie_CinemaVO m_cvo;

	public Movie_CinemaEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Movie_CinemaEntity(String movieCd, String cinemaID, String screenID, Movie_CinemaVO m_cvo) {
		super();
		this.movieCd = movieCd;
		this.cinemaID = cinemaID;
		this.screenID = screenID;
		this.m_cvo = m_cvo;
	}

	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}

	public String getCinemaID() {
		return cinemaID;
	}

	public void setCinemaID(String cinemaID) {
		this.cinemaID = cinemaID;
	}

	public String getScreenID() {
		return screenID;
	}

	public void setScreenID(String screenID) {
		this.screenID = screenID;
	}

	public Movie_CinemaVO getM_cvo() {
		return m_cvo;
	}

	public void setM_cvo(Movie_CinemaVO m_cvo) {
		this.m_cvo = m_cvo;
	}

}
