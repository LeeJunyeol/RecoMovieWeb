package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.entity.MemberEntity;

public class MemberRowMapper implements RowMapper<MemberEntity> {

	public MemberEntity mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberExtractor memberExtractor = new MemberExtractor();
		return memberExtractor.extractData(rs);
	}
}
