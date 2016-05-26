package com.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.entity.Booking_SeatEntity;
import com.jdbc.Booking_SeatRowMapper;

@Repository("booking_seatDao")
public class Booking_SeatDao {
	DataSource dataSource;
	
	@Autowired
	public Booking_SeatDao(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	public boolean insertBooking_Seat(Booking_SeatEntity bsentity){
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "insert into booking_seat values(?,?,?,?)";
		
		int r =jdbcTemplate.update(sql, new Object[]{bsentity.getBookingno(), bsentity.getSeatno(), bsentity.getCinemaID(),
				bsentity.getScreenID()});
		
		return r > 0 ? true:false;
	}

	public List<Booking_SeatEntity> getMySeatList(int mybookingno) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		String sql = "select * from booking_seat where bookingno=?";
		
		return jdbcTemplate.query(sql, new Booking_SeatRowMapper(), new Object[]{mybookingno});	
	}

}
