package com.entity;

public class SeatEntity {
	private int seatNo;
	private String cinemaID;
	private String screenID;
	private SeatVO seatVO;
	
	public SeatEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SeatEntity(int seatNo, String cinemaID, String screenID, SeatVO seatVO) {
		super();
		this.seatNo = seatNo;
		this.cinemaID = cinemaID;
		this.screenID = screenID;
		this.seatVO = seatVO;
	}

	public int getSeatNo() {
		return seatNo;
	}

	public void setSeatNo(int seatNo) {
		this.seatNo = seatNo;
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

	public SeatVO getSeatVO() {
		return seatVO;
	}

	public void setSeatVO(SeatVO seatVO) {
		this.seatVO = seatVO;
	}
	
	
}
