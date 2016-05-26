package com.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.RatingEntity;
import com.jdbc.RatingRowMapper;


@Repository("ratingDao")
public class RatingDao {
	DataSource dataSource;
	
	@Autowired
	public RatingDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	public List<RatingEntity> findRatingList(int memberno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from rating where memberno=?";
		List<RatingEntity> list = new ArrayList<>();

		list= jdbcTemplate.query(sql,new Object[]{memberno},new RatingRowMapper());
		System.out.println(list);

		return list;
	}
	public List<String> distinctMovieCd() {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select distinct moviecd from rating";
		List<String> list = new ArrayList<>();
		

		list= jdbcTemplate.queryForList(sql,String.class);

		
		return list;
	}
	
	
	public int findRating(RatingEntity re) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "select * from rating where moviecd=? and memberno=?";
		List<RatingEntity> list = new ArrayList<>();
		
		int n = 0;
		try{
			 list= jdbcTemplate.query(sql,new Object[]{re.getMovieCd(),re.getMemberno()},new RatingRowMapper());
			 n=list.get(0).getRatingno();
		}catch(Exception e){
		}
		return n;
	}
	
	public boolean updateRating(RatingEntity re) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "update rating set rating=?,timestamp=? where moviecd=? and memberno=?";
		int n = jdbcTemplate.update(sql, new Object[]{re.getRating(),re.getTimestamp(),re.getMovieCd(),re.getMemberno()});
		return (n > 0)? true : false;
	}
	
	public boolean insertRating(RatingEntity re) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		
		String sql = "insert into rating(ratingno, moviecd, rating, timestamp, memberno) values(rating_seq.nextval,?,?,?,?)";
		int n = jdbcTemplate.update(sql, new Object[]{re.getMovieCd(),re.getRating(),re.getTimestamp(),re.getMemberno()});
		return (n > 0)? true : false;
	}
	
}
