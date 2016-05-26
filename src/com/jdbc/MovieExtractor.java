package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.MovieEntity;
import com.entity.MovieVO;

public class MovieExtractor implements ResultSetExtractor<MovieEntity>{
	//영화객체 추출
	public MovieEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		MovieVO movieVO = new MovieVO(rs.getString("TITLE"),rs.getString("TITLEEN"),rs.getInt("YEAR"),
				rs.getString("NATION"), rs.getString("TYPE"), rs.getString("GENRE"), rs.getString("DIRECTOR"),
				rs.getString("COMPANY"), rs.getString("OPENDATE"), rs.getString("RUNNINGTIME"));
		MovieEntity movie = new MovieEntity(rs.getString("MOVIECD"), movieVO);
		return movie;
	}
}
