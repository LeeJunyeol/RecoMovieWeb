package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.SeatEntity;
import com.entity.SeatVO;

public class SeatExtractor implements ResultSetExtractor<SeatEntity>{
	
	public SeatEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		SeatVO seatVO = new SeatVO(rs.getString("SEATROW"), rs.getInt("SEATCOL"), rs.getString("SEATTYPE"));
		SeatEntity seat = new SeatEntity(rs.getInt("SEATNO"), rs.getString("CINEMAID"), rs.getString("SCREENID"), seatVO);
		return seat;
	}
}
