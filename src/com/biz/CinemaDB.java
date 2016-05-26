package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.CinemaDao;
import com.entity.CinemaEntity;
import com.entity.MovieEntity;

@Service("cinemaBiz")
public class CinemaDB {
	CinemaDao cinemaDao;
	
	@Autowired
	public CinemaDB(CinemaDao cinemaDao) {
		super();
		this.cinemaDao = cinemaDao;
	}
	
	public List<CinemaEntity> getSelectAll() {
		List<CinemaEntity> cinemalist = cinemaDao.getSelectAll();
		return cinemalist;
	}

	public List<CinemaEntity> getCinemaRefresh(int movieCd) {
		List<CinemaEntity> cinemalist = cinemaDao.getCinemaRefresh(movieCd);
		return cinemalist;
	}
	
	public List<CinemaEntity> getCinemaSelectAll() {
		List<CinemaEntity> cinemalist = cinemaDao.getCinemaSelectAll();
		return cinemalist;
	}

	public boolean deleteCinema(String[] cine) {
		return cinemaDao.deleteCinema(cine);
	}

	public boolean insertCinema(CinemaEntity cinema) {
		return cinemaDao.insertCinema(cinema);	
	}

	public List<CinemaEntity> findCinema(List<String> ch) {
		return cinemaDao.findCinema(ch);
	}

	public boolean updateCinema(CinemaEntity cinema) {
		return cinemaDao.updateCinema(cinema);
	}
	
	public CinemaEntity getCinema(String cinemaID) {
		return cinemaDao.getCinema(cinemaID);
	}
	
}
