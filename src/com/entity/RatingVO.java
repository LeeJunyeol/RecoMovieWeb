package com.entity;

import java.sql.Timestamp;

public class RatingVO {
	private int movieCd;
	private double rating;
	private Timestamp timestamp;
	private int memberno;
	
	public RatingVO() {
		super();
	}

	public RatingVO(int movieCd, double rating, Timestamp timestamp, int memberno) {
		super();
		this.movieCd = movieCd;
		this.rating = rating;
		this.timestamp = timestamp;
		this.memberno = memberno;
	}

	public int getmovieCd() {
		return movieCd;
	}

	public void setmovieCd(int movieCd) {
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
