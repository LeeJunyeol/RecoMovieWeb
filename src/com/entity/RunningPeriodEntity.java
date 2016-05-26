package com.entity;

import java.sql.Date;

public class RunningPeriodEntity {
	Date s_date;
	Date e_date;
	
	public RunningPeriodEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RunningPeriodEntity(Date s_date, Date e_date) {
		super();
		this.s_date = s_date;
		this.e_date = e_date;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public Date getE_date() {
		return e_date;
	}

	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
}
