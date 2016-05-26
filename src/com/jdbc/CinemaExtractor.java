package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.CinemaEntity;
import com.entity.CinemaVO;

public class CinemaExtractor implements ResultSetExtractor<CinemaEntity>{
	
	public CinemaEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		CinemaVO cinemaVO = new CinemaVO(rs.getString("CINEMANAME"),rs.getString("BRAND"),rs.getString("LOC"));
		CinemaEntity cinema = new CinemaEntity(rs.getString("CINEMAID"), cinemaVO);
		return cinema;
	}
}
