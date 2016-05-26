package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.CinemaEntity;
import com.jdbc.CinemaRowMapper;

@Repository("cinemaDao")
public class CinemaDao {
	DataSource dataSource;
	
	@Autowired
	public CinemaDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public List<CinemaEntity> getSelectAll() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		List<CinemaEntity> cinelist = new ArrayList<>();
		String sql = "select * from cinema";
		cinelist = jdbcTemplate.query(sql, new CinemaRowMapper());
		
		return cinelist;
	}
	
	public List<CinemaEntity> getCinemaRefresh(int movieCd) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		List<CinemaEntity> cinelist = new ArrayList<>();
		String sql = "select * from cinema where cinemaID in (select cinemaID from movie_cinema where movieCd=? and isRun = '1')";
		cinelist = jdbcTemplate.query(sql, new CinemaRowMapper(), new Object[]{movieCd});
		
		return cinelist;
	}
	

	public List<CinemaEntity> getCinemaSelectAll() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		List<CinemaEntity> list = new ArrayList<CinemaEntity>();
		String sql = "select * from cinema";
		list = jdbcTemplate.query(sql, new CinemaRowMapper());
		return list;
	}
	
	public CinemaEntity getCinema(String cinemaid) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from cinema where cinemaid=?";
		CinemaEntity cinemainfo = new CinemaEntity();
		cinemainfo = jdbcTemplate.queryForObject(sql, new CinemaRowMapper(), new Object[] {cinemaid});
		return cinemainfo;
	}

	public boolean deleteCinema(String[] cine) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		String sql = "delete from cinema where cinemaid=?";
		int n = 0;

		for (String str : cine) {
			n = jdbcTemplate.update(sql, new Object[] {str});
		}
		return (n > 0) ? true : false;
	}

	public boolean insertCinema(CinemaEntity cinema) {
		String sql = "insert into cinema(cinemaid, cinemaname, brand, loc) values(?,?,?,?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int rows = jdbcTemplate.update(sql,
				new Object[] {cinema.getCinemaID(), cinema.getCinemaVO().getCinemaname(), cinema.getCinemaVO().getBrand(), cinema.getCinemaVO().getLoc()});

		return rows > 0 ? true : false;
	}

	public List<CinemaEntity> findCinema(List<String> ch) {
		CinemaEntity res = new CinemaEntity();
		List<CinemaEntity> arr_cinema = new ArrayList<CinemaEntity>();
		for (String str : ch) {
			res = new CinemaDao(dataSource).getCinema(str);
			arr_cinema.add(res);
		}
		return arr_cinema;
	}

	public boolean updateCinema(CinemaEntity cinema) {
		String sql = "update cinema set cinemaname=?, brand=?, loc=? where cinemaid=?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		int rows = jdbcTemplate.update(sql, new Object[] {cinema.getCinemaVO().getCinemaname(), cinema.getCinemaVO().getBrand(), cinema.getCinemaVO().getLoc(),  cinema.getCinemaID()});

		return rows > 0 ? true : false;
	}
}
