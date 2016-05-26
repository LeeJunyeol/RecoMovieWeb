package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.TimeEntity;
import com.entity.TimeVO;

public class TimeExtractor implements ResultSetExtractor<TimeEntity>{
	
	public TimeEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		TimeVO timeVO = new TimeVO(rs.getDate("S_DATE"), rs.getDate("E_DATE"), rs.getString("STARTTIME"), 
				rs.getInt("COUNT"), rs.getString("CINEMAID"), rs.getString("SCREENID"), rs.getString("MOVIECd"));
		TimeEntity time = new TimeEntity(rs.getInt("TIMENO"), timeVO);
		return time;
	}
}
