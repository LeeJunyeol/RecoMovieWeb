package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.MemberEntity;

public class MemberExtractor implements ResultSetExtractor<MemberEntity>{

	public MemberEntity extractData(ResultSet rs) throws SQLException, DataAccessException {
		MemberEntity member = new MemberEntity(rs.getInt("MEMBERNO"), rs.getString("ID"), rs.getString("PW"), 
				rs.getString("NAME"), rs.getString("SEX"), rs.getDate("BIRTH"), rs.getString("ADDR"), rs.getString("TEL"), rs.getString("EMAIL"));
		return member;
	}
}
