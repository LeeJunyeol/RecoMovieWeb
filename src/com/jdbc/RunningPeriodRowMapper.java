package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.RunningPeriodEntity;

public class RunningPeriodRowMapper implements RowMapper<RunningPeriodEntity> {

	public RunningPeriodEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		RunningPeriodExtractor RunningPeriodExtractor = new RunningPeriodExtractor();
		return RunningPeriodExtractor.extractData(rs);
	}
}
