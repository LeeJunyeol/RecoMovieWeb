package com.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.biz.MovieDB;
import com.biz.RatingService;
import com.dao.MovieDao;
import com.entity.MovieEntity;
import com.entity.MovieVO;
import com.entity.RatingEntity;

@Controller
public class RatingController{
	RatingService ratingService;
	MovieDao movieDao;
	
	@Autowired
	public RatingController(RatingService ratingService, MovieDao movieDao) {
		super();
		this.ratingService = ratingService;
		this.movieDao = movieDao;
	}


	@RequestMapping("/RatingFind.do")
	public String doRatingFind(@RequestParam("movieCd") String movieCd, @RequestParam("movieNm") String movieNm, @RequestParam("movieNmEn") String movieNmEn, @RequestParam("movieDate") String movieDate,
			@RequestParam("myrating") Double myrating,  @RequestParam("now") Timestamp nowtime, @RequestParam("myno") Integer myno,
			@RequestParam("nation") String nation, @RequestParam("type") String type,
			@RequestParam("genre") String genre, @RequestParam("director") String director,
			@RequestParam("company") String company, @RequestParam("opendate") String opendate,
			@RequestParam("runningtime") String runningtime) {

		//1.평점 입력 버튼 눌렀을 때 그 로그인한 아이디와 그 영화에 대한 평점이 있는지 없는지 체크.
		RatingEntity ratingEntity = new RatingEntity(movieCd,myrating,nowtime,myno); 
		int n = ratingService.findRating(ratingEntity);
		System.out.println("find결과는?????"+n);
		if(n>0){ //평점이 이미 입력되어 있었으니까 수정을 한다.
			System.out.println("평점 수정한다.");
			ratingService.updateRating(ratingEntity);
			return "평점이 수정 되었습니다.";
		}else{ //평점이 입력되어있지 않다.
			//movie table에 해당 영화가 저장되어 있는지 체크
			List<String> codelist=new ArrayList<>();
			System.out.println(movieCd);
			
			
			Boolean a =codelist.add(movieCd);
			System.out.println(codelist);
			
			List<MovieEntity> movie=movieDao.findMovie(codelist);
			System.out.println(movie.get(0));
			if(movie.get(0)!=null){//영화데이터가 테이블에는 있다. 그럼 rating테이블에만 insert하면 된다. 
				ratingService.insertRating(ratingEntity);
				return "평점이 등록 되었습니다.";
				
			}else{//아니면 영화테이블에 영화데이터 생성해주고 rating에 insert
				MovieVO movievo = new MovieVO(movieNm,movieNmEn,Integer.parseInt(movieDate),nation,type,genre,director,company,opendate,runningtime);
				MovieEntity movieentity =new MovieEntity(movieCd,movievo);
				movieDao.insertMovie(movieentity);
				ratingService.insertRating(ratingEntity);
				return "평점이 등록 되었습니다.";
			}
		}
		
	}
	
}
