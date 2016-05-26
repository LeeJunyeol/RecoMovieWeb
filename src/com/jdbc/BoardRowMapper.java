package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.Board;


public class BoardRowMapper implements RowMapper<Board>{
	
	//�ϳ��� �����ٰ� ������ ����
	//emp rowmapper�� ������ �;���
	public Board mapRow(ResultSet rs, int rowNum) throws SQLException{
		BoardExtractor boardE = new BoardExtractor();
		return boardE.extractData(rs);
	}
}
