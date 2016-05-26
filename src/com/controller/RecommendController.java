/* Editor: Chanho */
package com.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.TreeMap;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.biz.RecommendService;
import com.entity.MemberEntity;
import com.entity.RatingEntity;

import recommend.ReadHashmap;
import recommend.RecMovie;
import recommend.similarity;


@Controller
public class RecommendController {
	
	RecommendService recommendService;

	@Autowired
	public RecommendController(RecommendService recommendService) {
		super();
		this.recommendService = recommendService;
	}

	
	@RequestMapping("/recommend.do")
	public ModelAndView findRatingData(HttpSession session){
		MemberEntity me =(MemberEntity) session.getAttribute("me");
		int memberno =me.getMemberno();
		HashMap<String, Double> userinfo = new HashMap<>();
		
		List<String> DistinctMovieCd = recommendService.distinctMovieCd(); //중복제거한 영화코드를 불러오기
		System.out.println("rating의 중복제거 영화 갯수는 : "+DistinctMovieCd.size());
		List<RatingEntity> ratingList = recommendService.findRatingList(memberno); //해당 고객의 평가 영화리스트를 얻어오고
		System.out.println(memberno+"이 평가한 영화 갯수는 : "+ratingList.size());
		
		for(RatingEntity entity:ratingList){
			userinfo.put(entity.getMovieCd(), entity.getRating());
			System.out.println(entity.getMovieCd()+"영화의 평점 : "+entity.getRating());
		}
		
		RecMovie rm = new RecMovie();
		ArrayList<similarity> recommendList = rm.recommendMovie(userinfo, DistinctMovieCd, 30);
		
		ModelAndView mav = new ModelAndView("recommend/recommend", "recommendList", recommendList);
		return mav;
	}
		
//	
//	@RequestMapping(value = "/AllList.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView page(@ModelAttribute("Board") Board board) {
//
//		ModelAndView mav = new ModelAndView();
//		
//	    
//	    Board boardpage = new Board();
//	    boardpage.setTotalCount(totalCount); //����¡ ó���� ���� setter ȣ��
//	    System.out.println(boardpage.getFinalPageNo());
//	    
//	    mav.addObject("pageVO", boardpage);
//	    //--����¡ ó��
//	  
//	    List<Board> boardList = boardService.listBoard(boardpage);
//	  
//	    mav.addObject("all", boardList);
//	    
//	    mav.setViewName("board/BoardAll");
//	    return mav;
//	}
//	
//	
//	
//	@RequestMapping(value = "/searchList.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView searchpage(@ModelAttribute("Board") Board board, @RequestParam("searchf") String searchf,
//									@RequestParam("searchv") String searchv) {
//
//		ModelAndView mav = new ModelAndView();
//
//		Board boardpage = new Board();
//		boardpage.setSearchFiled(searchf);
//	    boardpage.setSearchValue(searchv);
//		
//		int totalCount = boardService.getSearchBoardListCount(boardpage); //�Խù� �Ѱ����� ���Ѵ�.
//	    System.out.println("������ �� ������ : "+totalCount);
//	    
//	    boardpage.setTotalCount(totalCount); //����¡ ó���� ���� setter ȣ��
//	    
//	    mav.addObject("pageVO", boardpage);
//	    //--����¡ ó��
//	  
//	    List<Board> boardList = boardService.listBoard(boardpage);
//	  
//	    mav.addObject("all", boardList);
//	    
//	    mav.setViewName("board/BoardAll");
//	    return mav;
//	}
//	
}
