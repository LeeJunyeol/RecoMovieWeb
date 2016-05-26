package com.entity;

import java.sql.Timestamp;

public class RatingEntity {
	private int ratingno=0;
	private String movieCd;
	private double rating;
	private Timestamp timestamp;
	private int memberno;
	
	public RatingEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RatingEntity(String movieCd, double rating, Timestamp timestamp, int memberno) {
		super();
		this.movieCd = movieCd;
		this.rating = rating;
		this.timestamp = timestamp;
		this.memberno = memberno;
	}
	
	public RatingEntity(String movieCd, double rating, int memberno) {
		super();
		this.movieCd = movieCd;
		this.rating = rating;
		this.memberno = memberno;
	}

	public int getRatingno() {
		return ratingno;
	}

	public void setRatingno(int ratingno) {
		this.ratingno = ratingno;
	}

	public String getMovieCd() {
		return movieCd;
	}

	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}

	public double getRating() {
		return rating;
	}

	public void setRating(double rating) {
		this.rating = rating;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public int getMemberno() {
		return memberno;
	}

	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	
	

}	
	