package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.RunningPeriodEntity;

public class RunningPeriodExtractor implements ResultSetExtractor<RunningPeriodEntity>{
	
	public RunningPeriodEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		RunningPeriodEntity rpe = new RunningPeriodEntity(rs.getDate("s_date"), rs.getDate("e_date"));
		
		return rpe;
	}
}
 