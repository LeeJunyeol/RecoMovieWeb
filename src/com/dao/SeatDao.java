package com.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.MovieEntity;
import com.entity.SeatEntity;
import com.jdbc.MovieRowMapper;
import com.jdbc.SeatRowMapper;

@Repository("seatDao")
public class SeatDao {
	DataSource dataSource;
	
	@Autowired
	public SeatDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public List<SeatEntity> doSeatLoad(String cinemaID, String screenID){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from seat where cinemaID=? and screenID=?";
		
		return jdbcTemplate.query(sql, new SeatRowMapper(), new Object[]{cinemaID, screenID});	
	}
	
	public int getSeatNo(String cinemaID, String screenID, String[] seatrowcol) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from seat where cinemaID=? and screenID=? and seatrow=? and seatcol=?";
		
		SeatEntity seat = jdbcTemplate.queryForObject(sql, new Object[]{cinemaID, screenID, seatrowcol[0], 
				seatrowcol[1]}, new SeatRowMapper());
	
		return seat.getSeatNo();
	}

	public boolean getSeatInsert(SeatEntity se) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "insert into seat values(?,?,?,?,?,?)";
		int r = jdbcTemplate.update(sql, new Object[]{se.getSeatNo(), se.getCinemaID(), se.getScreenID(),
				se.getSeatVO().getSeatRow(), se.getSeatVO().getSeatCol(), se.getSeatVO().getSeatType()});
		return r>0? true:false;
		}

	public SeatEntity getSeat(int seatno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from seat where seatno=?";
		try{
			return jdbcTemplate.queryForObject(sql, new SeatRowMapper(), new Object[] {seatno});
		}catch(EmptyResultDataAccessException e){
			return null;
		} 
	}
}
