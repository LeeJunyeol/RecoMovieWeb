package com.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.RunningPeriodEntity;
import com.entity.ScreenEntity;
import com.entity.TimeEntity;
import com.jdbc.RunningPeriodRowMapper;
import com.jdbc.TimeRowMapper;

@Repository("timeDao")
public class TimeDao {
	DataSource dataSource;

	@Autowired
	public TimeDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public List<TimeEntity> getViewTimeTable(String cinemaID, String movieCd, Date strdate) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<TimeEntity> timelist = new ArrayList<TimeEntity>();
		String sql = "select * from movietime where cinemaID=? and movieCd=? and s_date=?";
		
		timelist = jdbcTemplate.query(sql, new Object[]{cinemaID, movieCd, strdate}, new TimeRowMapper());
		return timelist;
	}

	public List<TimeEntity> getSelect(ScreenEntity se) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<TimeEntity> timelist = new ArrayList<TimeEntity>();
		String sql = "select * from movietime where cinemaID=? and screenID=?";
		
		timelist = jdbcTemplate.query(sql, new Object[]{se.getCinemaID(), se.getScreenID()}, new TimeRowMapper());
		return timelist;
	}

	public List<RunningPeriodEntity> getDayList(String cinemaID, String movieCd) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<RunningPeriodEntity> daylist = new ArrayList<>();
		String sql = "select distinct s_date, e_date from movietime where cinemaID=? and movieCd=?";
		
		daylist = jdbcTemplate.query(sql, new Object[]{cinemaID, movieCd}, new RunningPeriodRowMapper());
		return daylist;
	}
	
	/* Edited By YooNa */
	public TimeEntity getTime(int timeno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from movietime where timeno=?";
		try{
			return jdbcTemplate.queryForObject(sql, new TimeRowMapper(), new Object[] {timeno});	
		}catch(EmptyResultDataAccessException e){
			return null;
		}
	}
	
	public List<TimeEntity> getTimeSelectAll() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<TimeEntity> list = new ArrayList<TimeEntity>();
		String sql = "select * from movietime";
		list = jdbcTemplate.query(sql, new TimeRowMapper());
		return list;
	}

	public boolean deleteTime(String[] ti) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "delete from movietime where timeno=?";
		int n = 0;
		
		for (String str : ti){
			n = jdbcTemplate.update(sql, new Object[]{str}); 
		}
		return (n > 0) ? true:false;
	}

	public boolean insertTime(TimeEntity time) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "insert into movietime(timeno, s_date, e_date, starttime, count, cinemaid, screenid, moviecd) values(?,?,?,?,?,?,?,?)";
		int rows = jdbcTemplate.update(sql, 
				new Object[]{time.getTimeno(), time.getTimeVO().getS_date(), time.getTimeVO().getE_date(), time.getTimeVO().getStartTime(),
						 time.getTimeVO().getCount(), time.getTimeVO().getCinemaID(),
						time.getTimeVO().getScreenID(), time.getTimeVO().getMovieCd()});
		
		return rows > 0 ? true : false;
	}

	public List<TimeEntity> findTime(List<Integer> ti) {
		TimeEntity res = new TimeEntity();
		List<TimeEntity> arr_time = new ArrayList<TimeEntity>();
		for(Integer num : ti){
			res = new TimeDao(dataSource).getTime(num);
			arr_time.add(res);
		}
		return arr_time;
	}
	

	public boolean updateTime(TimeEntity time) {
		String sql = "update movietime set s_date=?, e_date=?, starttime=?, count=?, cinemaid=?, screenid=?, moviecd=? where timeno=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int rows = jdbcTemplate.update(sql, 
				new Object[]{time.getTimeno(), time.getTimeVO().getS_date(), time.getTimeVO().getE_date(), time.getTimeVO().getStartTime(),
						 time.getTimeVO().getCount(), time.getTimeVO().getCinemaID(),
						time.getTimeVO().getScreenID(), time.getTimeVO().getMovieCd()});
		
		return rows > 0 ? true : false;
	}
	/* End */

	public TimeEntity getTimeEntity(String cinemaID, String screenID, String movieCd, Date date, String starttime) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from movietime where cinemaid=? and screenid=? and moviecd=? and starttime=? "
				+ "and s_date <= ? and e_date >= ?";
		TimeEntity timeentity = jdbcTemplate.queryForObject(sql, new Object[]{cinemaID, screenID, movieCd, starttime, date, date},
				new TimeRowMapper());
		return timeentity;
	}
}
