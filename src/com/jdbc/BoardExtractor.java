package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.Board;

public class BoardExtractor implements ResultSetExtractor<Board>{

 
	@Override
	public Board extractData(ResultSet rs) throws SQLException, DataAccessException {
		
		Board board = new Board();
		board.setBoardNo(rs.getInt("BOARDNO"));
		board.setName(rs.getString("NAME"));
		board.setTitle(rs.getString("TITLE"));
		board.setContents(rs.getString("CONTENTS"));
		board.setInsertDate(rs.getString("INSERTDATE"));
		board.setHits(rs.getInt("HITS"));
		return board;
	}
}
