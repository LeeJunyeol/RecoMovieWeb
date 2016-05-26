package com.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.entity.RatingEntity;
import com.entity.RatingVO;

public class RatingExtractor implements ResultSetExtractor<RatingEntity>{
	
	public RatingEntity extractData(ResultSet rs) throws SQLException, DataAccessException {

		RatingEntity rating = new RatingEntity();
		rating.setRatingno(rs.getInt("RATINGNO"));
		rating.setMovieCd(rs.getString("MOVIECD"));
		rating.setMemberno(rs.getInt("MEMBERNO"));
		rating.setRating(rs.getDouble("RATING"));
		
		return rating;
	}
}
