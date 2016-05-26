package com.entity;

import java.util.List;

public class CinemaEntity {
	private String cinemaID;
	private CinemaVO cinemaVO;
	private List<CinemaEntity> cinemaList;
	
	public CinemaEntity() {
		cinemaVO = new CinemaVO();
	}
	
	public CinemaEntity(String cinemaID, CinemaVO cinemaVO) {
		super();
		this.cinemaID = cinemaID;
		this.cinemaVO = cinemaVO;
	}

	public String getCinemaID() {
		return cinemaID;
	}

	public void setCinemaID(String cinemaID) {
		this.cinemaID = cinemaID;
	}

	public CinemaVO getCinemaVO() {
		return cinemaVO;
	}

	public void setCinemaVO(CinemaVO cinemaVO) {
		this.cinemaVO = cinemaVO;
	}

	public List<CinemaEntity> getCinemaList() {
		return cinemaList;
	}

	public void setCinemaList(List<CinemaEntity> cinemaList) {
		this.cinemaList = cinemaList;
	}
	
	
	
}
