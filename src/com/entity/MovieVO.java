package com.entity;

public class MovieVO {
	String title;
	String titleen;
	int year;
	String nation;
	String type;
	String genre;
	String director;
	String company;
	String opendate;
	String runningtime;
	
	public MovieVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MovieVO(String title, String titleen, int year, String nation, String type, String genre, String director,
			String company, String opendate, String runningtime) {
		super();
		this.title = title;
		this.titleen = titleen;
		this.year = year;
		this.nation = nation;
		this.type = type;
		this.genre = genre;
		this.director = director;
		this.company = company;
		this.opendate = opendate;
		this.runningtime = runningtime;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleen() {
		return titleen;
	}
	public void setTitleen(String titleen) {
		this.titleen = titleen;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getOpendate() {
		return opendate;
	}
	public void setOpendate(String opendate) {
		this.opendate = opendate;
	}
	public String getRunningtime() {
		return runningtime;
	}
	public void setRunningtime(String runningtime) {
		this.runningtime = runningtime;
	}
}
