package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.Booking_SeatDao;
import com.entity.Booking_SeatEntity;

@Service("booking_seatBiz")
public class Booking_SeatDB {
	Booking_SeatDao booking_seatDao;

	@Autowired
	public Booking_SeatDB(Booking_SeatDao booking_seatDao) {
		super();
		this.booking_seatDao = booking_seatDao;
	}
	
	public boolean insertBooking_Seat(Booking_SeatEntity bsentity){
		return booking_seatDao.insertBooking_Seat(bsentity);
	}

	public List<Booking_SeatEntity> getMySeatList(int mybookingno) {
		return booking_seatDao.getMySeatList(mybookingno);
	}

}
