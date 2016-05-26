package com.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jython.bigdata.interfaces.ImgUrlSearchType;
import org.jython.bigdata.util.JythonObjectFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.biz.MovieDB;
import com.entity.MovieEntity;
import com.entity.MovieVO;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieAPIServiceImplService;
import kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieInfoResult;
import kr.or.kobis.kobisopenapi.consumer.soap.movie.OpenAPIFault;

@Controller
public class MovieController {
	MovieDB movieDB;
	
	@Autowired
	public MovieController(MovieDB movieDB){
		super();
		this.movieDB=movieDB;
	}
	
	@RequestMapping("/MovieSelectAll.do")
	public ModelAndView doMovieSelectAll(){
		List<MovieEntity> movieList = movieDB.getMovieSelectAll();
		return new ModelAndView("/admin/manager_movie", "movlist", movieList);
	}
	
	@RequestMapping("/movieBoxInfoModal.do")
	public ModelAndView viewMovieInfoModal(@RequestParam("movieCd") Integer movieCd){
		return new ModelAndView("/infomodal/movieinfomodal","movieCd",movieCd);
	}
	
	@RequestMapping("/movieinfomodal_search.do")
	public ModelAndView searchMovieInfoModal(@RequestParam("movieName") String movieName){
		return new ModelAndView("/infomodal/movieinfomodal_search","movieName",movieName);
	}
	
	@RequestMapping("/BoxOfficeLoad.do")
	protected void doBoxOfficeLoad(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String targetDt = request.getParameter("targetDt")==null?"20151111":request.getParameter("targetDt");			//조회일자
		String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");		//결과row수
		String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");		//“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
		String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");			//“K: : 한국영화 “F” : 외국영화 (default : 전체)
		String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");				//“0105000000” 로서 조회된 지역코드

		String key = com.web.KOBISKey.key;
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		
		try {
			PrintWriter out = response.getWriter();
			String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
			JSONParser parser = new JSONParser();
			Object dailyObject = parser.parse(dailyResponse);
			JSONObject dailyJSON = (JSONObject)dailyObject;
			JSONObject boxOfficeResult = (JSONObject) dailyJSON.get("boxOfficeResult");
			JSONArray dailyBoxOfficeList = (JSONArray) boxOfficeResult.get("dailyBoxOfficeList");
			Iterator<?> itr = dailyBoxOfficeList.iterator();
			while(itr.hasNext()){
				JSONObject boxobj = (JSONObject) itr.next();
				String movieCd = (String) boxobj.get("movieCd");
				String movieName = (String) boxobj.get("movieNm");
				if(insertMovieFromKOBIS(movieCd)){
					System.out.println("새로운 영화("+movieName+")가 입력되었습니다.");
				} 
			}
			out.print(dailyBoxOfficeList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/imgUrlListLoader.do")
	public @ResponseBody HashMap<String, String> imgUrlListLoader(@RequestParam("movieCodes") List<String> movieCodes){
		System.out.println("확인");
		HashMap<String, String> movieUrlMap = new HashMap<String, String>();
		System.out.println(movieCodes);
		for(String movieCd : movieCodes){
			MovieEntity movie = movieDB.getMovie(movieCd);
			String movieTitle = movie.getMovo().getTitle();
			String year = Integer.toString(movie.getMovo().getYear());
			System.out.println(year);
			JythonObjectFactory factory = JythonObjectFactory.getInstance();
			ImgUrlSearchType imgUrlSearch = (ImgUrlSearchType) factory.createObject(ImgUrlSearchType.class, "ImgUrlSearch");
			String imgurl = imgUrlSearch.imgUrlLoader(movieTitle, year);
			System.out.println(movieTitle +": "+imgurl);
			movieUrlMap.put(movieCd, imgurl);
			
		   /*image_file*/ 
	      Image image = null;
	       try {
/*	        URL url = new URL("http://t1.search.daumcdn.net/thumb/R438x0.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Fmovie%2F4669be3dcca8d821f202630752dd30c362e3a064");
*/	          URL url = new URL(imgurl);
	          BufferedImage img = ImageIO.read(url);
	           File file 
	              = new File("/home/junyeol/ProjectWork/MovieRecommendProjectJDBC/WebContent/image/"+movieCd+".jpg");
	           ImageIO.write(img, "jpg", file);
	       } catch (IOException e) {
	        e.printStackTrace();
	       }  

		}
		return movieUrlMap;
	}

	public boolean insertMovieFromKOBIS(String movieCd) throws OpenAPIFault{
	   // 발급키
	   String key = com.web.KOBISKey.key;
	   
	   // KOBIS 오픈 API SOAP Client를 통해 호출
	   MovieInfoResult movieInfoResult = new MovieAPIServiceImplService().getMovieAPIServiceImplPort().searchMovieInfo(key, movieCd);
	   
	   String movieNm = movieInfoResult.getMovieInfo().getMovieNm();
	   String movieNmEn = movieInfoResult.getMovieInfo().getMovieNmEn();
	   String movieDate = movieInfoResult.getMovieInfo().getPrdtYear();
	   String type = movieInfoResult.getMovieInfo().getTypeNm();
	   String opendate = movieInfoResult.getMovieInfo().getOpenDt();
	   String runningtime = movieInfoResult.getMovieInfo().getShowTm(); 
	   
	   int lenDirector = movieInfoResult.getMovieInfo().getDirectors().getDirector().size();
	   String director=null;
	   for(int i=0; i<lenDirector; i++){
		   if(i==0){
			   director=movieInfoResult.getMovieInfo().getDirectors().getDirector().get(i).getPeopleNm();
		   }else{
			   director= director+", "+movieInfoResult.getMovieInfo().getDirectors().getDirector().get(i).getPeopleNm();
		   }
	   }
	   
	   int lenGenre= movieInfoResult.getMovieInfo().getGenres().getGenre().size();
	   String genre=null;
	   for(int i=0; i<lenGenre; i++){
		   if(i==0){
			   genre=movieInfoResult.getMovieInfo().getGenres().getGenre().get(i).getGenreNm();
		   }else{
			   genre= genre+", "+movieInfoResult.getMovieInfo().getGenres().getGenre().get(i).getGenreNm();
		   }
	   }
	   
	   int lenActor= movieInfoResult.getMovieInfo().getActors().getActor().size();
	   String actor=null;
	   for(int i=0; i<lenActor; i++){
		   if(i==0){
			   actor=movieInfoResult.getMovieInfo().getActors().getActor().get(i).getPeopleNm();
		   }else{
			   actor= actor+", "+movieInfoResult.getMovieInfo().getActors().getActor().get(i).getPeopleNm();
		   }
	   }
	   
	   int lenNation= movieInfoResult.getMovieInfo().getNations().getNation().size();
	   String nation=null;
	   for(int i=0; i<lenNation; i++){
		   if(i==0){
			   nation=movieInfoResult.getMovieInfo().getNations().getNation().get(i).getNationNm();
		   }else{
			   nation= nation+", "+movieInfoResult.getMovieInfo().getNations().getNation().get(i).getNationNm();
		   }
	   }
	   
	   int lenCompany= movieInfoResult.getMovieInfo().getCompanys().getCompany().size();
	   String company=null;
	   for(int i=0; i<lenCompany; i++){
		   if(i==0){
			   company=movieInfoResult.getMovieInfo().getCompanys().getCompany().get(i).getCompanyNm();
		   }else{
			   company= company+", "+movieInfoResult.getMovieInfo().getCompanys().getCompany().get(i).getCompanyNm();
		   }
	   }
	   MovieEntity movie = movieDB.getMovie(movieCd);
/*	   System.out.println(movie.getMovieCd());
	   System.out.println(movieCd);
*/	   if(movie==null){
		   MovieVO movievo = new MovieVO(movieNm,movieNmEn,Integer.parseInt(movieDate),nation,type,genre,director,company,opendate,runningtime);
		   MovieEntity movieentity =new MovieEntity(movieCd,movievo);
		   return movieDB.insertMovie(movieentity);
		} else {
			return false;
		}
	}
	
   // 추가 (희정)
   @RequestMapping("/wordcloud.do")
   public ModelAndView WordCloudInfoModal(@RequestParam("movieNm") String title){
      System.out.println("wordcloud controller");
      return new ModelAndView("/infomodal/wordcloudmodal", "movieNm", title);
   }
   @RequestMapping("/viewWordCloud.do")
   public ModelAndView viewWordCloudInfoModal(@RequestParam("title") String title){
      System.out.println("view wordcloud controller");
      return new ModelAndView("/infomodal/wordcloudview", "title", title);
   }

}
