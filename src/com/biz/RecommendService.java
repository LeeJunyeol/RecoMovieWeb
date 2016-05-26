package com.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RatingDao;
import com.entity.RatingEntity;


@Service("RecommendService")
public class RecommendService {

	private RatingDao ratingDao;
	
	@Autowired
	public RecommendService(RatingDao ratingDao) {
		super();
		this.ratingDao = ratingDao;
	}


	public List<RatingEntity> findRatingList(int memberno) {
		return ratingDao.findRatingList(memberno);
	}


	public List<String> distinctMovieCd() {
		// TODO Auto-generated method stub
		return ratingDao.distinctMovieCd();
	}

}
