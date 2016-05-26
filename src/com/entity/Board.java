package com.entity;


public class Board extends PageVO{
	private int boardNo;
	private String id;
	private String name;
	private String title;
	private String contents;
	private String insertDate;
	private int hits;
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Board(int boardNo, String id, String name, String title, String contents, String insertDate, int hits) {
		super();
		this.boardNo = boardNo;
		this.id = id;
		this.name = name;
		this.title = title;
		this.contents = contents;
		this.insertDate = insertDate;
		this.hits = hits;
	}
	public Board(int boardNo,String name, String title, String contents) {
		super();
		this.boardNo = boardNo;
		this.name = name;
		this.title = title;
		this.contents = contents;
	}
	

	public void setHits(int hits) {
		this.hits = hits;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public void setInsertDate(String insertDate) {
		this.insertDate = insertDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getTitle() {
		return title;
	}

	public String getContents() {
		return contents;
	}

	public String getInsertDate() {
		return insertDate;
	}
	
	public int getHits() {
		return hits;
	}
	
	
	
	
}
