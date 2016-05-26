package com.entity;

import java.util.List;

public class TimeEntity {
	private int timeno; 
	private TimeVO timeVO;
	private List<TimeEntity> timeList;
	
	public TimeEntity(int timeno, TimeVO timeVO) {
		super();
		this.timeno = timeno;
		this.timeVO = timeVO;
	}

	public TimeEntity() {
		// TODO Auto-generated constructor stub
	}

	public int getTimeno() {
		return timeno;
	}

	public void setTimeno(int timeno) {
		this.timeno = timeno;
	}

	public TimeVO getTimeVO() {
		return timeVO;
	}

	public void setTimeVO(TimeVO timeVO) {
		this.timeVO = timeVO;
	}

	public List<TimeEntity> getTimeList() {
		return timeList;
	}
	
	public void setTimeList(List<TimeEntity> timeList){
		this.timeList = timeList;
	}
	
}
