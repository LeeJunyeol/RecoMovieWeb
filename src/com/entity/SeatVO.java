package com.entity;

public class SeatVO {
	private String seatRow;
	private int seatCol;
	private String seatType;
	
	public SeatVO() {
		super();
	}

	public SeatVO(String seatRow, int seatCol, String seatType) {
		super();
		this.seatRow = seatRow;
		this.seatCol = seatCol;
		this.seatType = seatType;
	}

	public String getSeatRow() {
		return seatRow;
	}

	public void setSeatRow(String seatRow) {
		this.seatRow = seatRow;
	}

	public int getSeatCol() {
		return seatCol;
	}

	public void setSeatCol(int seatCol) {
		this.seatCol = seatCol;
	}

	public String getSeatType() {
		return seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}
	
}
