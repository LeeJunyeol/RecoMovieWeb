package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.SeatDao;
import com.entity.SeatEntity;

@Service("seatBiz")
public class SeatDB {
	SeatDao seatDao;

	@Autowired
	public SeatDB(SeatDao seatDao) {
		super();
		this.seatDao = seatDao;
	}
	
	public List<SeatEntity> doSeatLoad(String cinemaID, String screenID){
		return seatDao.doSeatLoad(cinemaID, screenID);
	}

	public int getSeatNo(String cinemaID, String screenID, String[] seatrowcol) {
		return seatDao.getSeatNo(cinemaID, screenID, seatrowcol);
	}

	public boolean getSeatInsert(SeatEntity se) {
		return seatDao.getSeatInsert(se);
	}

	public SeatEntity getSeat(int seatno) {
		return seatDao.getSeat(seatno);
	}

}
