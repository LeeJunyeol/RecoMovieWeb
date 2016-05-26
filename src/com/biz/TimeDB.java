package com.biz;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.TimeDao;
import com.entity.BookingEntity;
import com.entity.RunningPeriodEntity;
import com.entity.ScreenEntity;
import com.entity.TimeEntity;

@Service("timeBiz")
public class TimeDB {
	TimeDao timeDao;

	@Autowired
	public TimeDB(TimeDao timeDao) {
		super();
		this.timeDao = timeDao;
	}

	public List<TimeEntity> getViewTimeTable(String cinemaID, String movieCd, Date strdate) {
		List<TimeEntity> timelist = timeDao.getViewTimeTable(cinemaID, movieCd, strdate);
		return timelist;
	}

	public List<TimeEntity> getSelect(ScreenEntity se) {
		List<TimeEntity> timelist = timeDao.getSelect(se);
		return timelist;
	}

	public List<RunningPeriodEntity> getDayList(String cinemaID, String movieCd) {
		List<RunningPeriodEntity> daylist = timeDao.getDayList(cinemaID, movieCd);
		return daylist;
	}
	
	public List<TimeEntity> getTimeSelectAll() {
		List<TimeEntity> timelist = timeDao.getTimeSelectAll();
		return timelist;
	}

	public boolean deleteTime(String[] time) {
		return timeDao.deleteTime(time);		
	}

	public boolean insertTime(TimeEntity time) {
		return timeDao.insertTime(time);
	}

	public List<TimeEntity> findTime(List<Integer> ch) {
		return timeDao.findTime(ch);
	}

	public boolean updateTime(TimeEntity time) {
		return timeDao.updateTime(time);		
	}

	public TimeEntity getTimeEntity(String cinemaID, String screenID, String movieCd, Date date, String starttime) {
		return timeDao.getTimeEntity(cinemaID, screenID, movieCd, date, starttime);
	}
	
	public TimeEntity getTime(int timeno) {
		return timeDao.getTime(timeno);
	}
}
