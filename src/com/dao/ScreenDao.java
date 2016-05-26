package com.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.ScreenEntity;
import com.jdbc.ScreenRowMapper;

@Repository("screenDao")
public class ScreenDao {
	DataSource dataSource;
	
	@Autowired
	public ScreenDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public List<ScreenEntity> getSelect(String cinemaID) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from screen where cinemaid=?";
		
		return jdbcTemplate.query(sql, new ScreenRowMapper(), new Object[]{cinemaID});	
	}

	public int getScreenInsert(ScreenEntity se) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "insert into screen values(?,?)";
		
		return jdbcTemplate.update(sql, new Object[]{se.getCinemaID(), se.getScreenID()});	
	}

	public List<ScreenEntity> getSelectAll() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from screen";
		
		return jdbcTemplate.query(sql, new ScreenRowMapper());	
	}
}
