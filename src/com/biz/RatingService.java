package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BoardDao;
import com.dao.RatingDao;
import com.entity.Board;
import com.entity.RatingEntity;


@Service("ratingService")
public class RatingService {

	private RatingDao ratingDao;
	
	@Autowired
	public RatingService(RatingDao ratingDao) {
		super();
		this.ratingDao = ratingDao;
	}

	public int findRating(RatingEntity re) {
		return ratingDao.findRating(re);
	}
		
	public boolean insertRating(RatingEntity re) {
		return ratingDao.insertRating(re);
	}

	public boolean updateRating(RatingEntity re) {
		return ratingDao.updateRating(re);
	}



}
