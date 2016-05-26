package com.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import com.biz.MovieDB;
import com.entity.MovieEntity;
import com.entity.MovieVO;

import kr.or.kobis.kobisopenapi.consumer.soap.movie.Movie;
import kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieAPIServiceImplService;
import kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieInfoResult;
import kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieListResult;
import kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieListResult.MovieList;
import kr.or.kobis.kobisopenapi.consumer.soap.movie.OpenAPIFault;

public class KobisToMovie {
	
	public static String searchMovieFromKOBIS(String orimovieCd, String enTitle, String year) throws OpenAPIFault{
		System.out.println(enTitle + "영화를 찾아봅시다!!("+year+")");
	   // 발급키
	   String key = "7d7d85581e91f32cc178b1ef8f05a44f";
	   
	   // KOBIS 오픈 API SOAP Client를 통해 호출
	   MovieListResult movieListResult = new MovieAPIServiceImplService().getMovieAPIServiceImplPort().searchMovieList(key,"1","10",enTitle,"","","",year,year,"","");
	   List<Movie> movieList = movieListResult.getMovieList().getMovie();
	   String returnStr="";
	   for(Movie movie : movieList){
		   System.out.println(enTitle+"????"+movie.getMovieNmEn()+" year: "+movie.getPrdtYear());
		   int lenDirector = movie.getDirectors().getDirector().size();
		   String director = null;
		   for(int i=0; i<lenDirector; i++){
			   if(i==0){
				   director=movie.getDirectors().getDirector().get(i).getPeopleNm();
			   }else{
				   director=director+", "+movie.getDirectors().getDirector().get(i).getPeopleNm();
			   }
		   }
		   int lenCompany = movie.getCompanys().getCompany().size();
		   String company = null;
		   for(int i=0; i<lenCompany; i++){
			   if(i==0){
				   company=movie.getCompanys().getCompany().get(i).getCompanyNm();
			   }else{
				   company=company+", "+movie.getCompanys().getCompany().get(i).getCompanyNm();
			   }
		   }

		   returnStr = orimovieCd+"\t"+movie.getMovieCd()+"\t"+movie.getMovieNm()+"\t"+movie.getMovieNmEn()+"\t"
				   +movie.getPrdtYear()+"\t"+movie.getNationAlt()+"\t"+movie.getTypeNm()+"\t"+movie.getGenreAlt()+"\t"+director+"\t"
				   +company+"\t"+movie.getOpenDt()+"\t"+"0";
	   }
	   System.out.println(returnStr);
	   return returnStr;
	   
/*	   String movieNm = movieInfoResult.getMovieInfo().getMovieNm();
	   String movieNmEn = movieInfoResult.getMovieInfo().getMovieNmEn();
	   String movieDate = movieInfoResult.getMovieInfo().getPrdtYear();
	   String type = movieInfoResult.getMovieInfo().getTypeNm();
	   String opendate = movieInfoResult.getMovieInfo().getOpenDt();
	   String runningtime = movieInfoResult.getMovieInfo().getShowTm(); 
	   
	   System.out.println(movieNmEn);
	   System.out.println(movieDate);
	   System.out.println(opendate);
	   
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
*/	}
	
	public static void main(String[] args) throws IOException {
		MovieDB movieDB;
		
		FileReader fr = null;
		FileWriter fw = null;
		
		BufferedReader br = null;
		BufferedWriter bw = null;
		
		PrintWriter pw = null;
		try {
//			/home/junyeol/ProjectWork/MovieRecommendProjectJDBC/src/com/util/movies.csv
			fr = new FileReader("movies1.csv");
			br = new BufferedReader(fr);
			
			fw = new FileWriter("movies_result.csv", true);
			bw = new BufferedWriter(fw);
			pw = new PrintWriter(bw, true);
			
			String s = null;
			String[] movieStr = null;
			br.readLine();
			ArrayList<String> array = new ArrayList<String>();
			while((s=br.readLine())!=null){
				movieStr = s.split("\t");
				int lastIdx = movieStr[1].lastIndexOf(')');
				int firstIdx = movieStr[1].indexOf('(');
				if(firstIdx!=-1){
					if(lastIdx>5){
						String movieNm = movieStr[1].substring(0, firstIdx).trim();
						System.out.println(movieNm.indexOf(", The"));
						if(movieNm.indexOf(", The")>=0){
							movieNm=movieNm.replaceAll(", The", "");
						}
						System.out.println(movieNm);	
						String movieyear = movieStr[1].substring(lastIdx-4, lastIdx).trim();
						String nameNyear = movieStr[0]+";"+movieNm+";"+ movieyear;
						String movieData = "";
						try{
							movieData = searchMovieFromKOBIS(movieStr[0],movieNm, movieyear);
						} catch(Exception e){}
						if(!movieData.isEmpty()){
							pw.write(movieData);
							System.out.println("행 추가");
							pw.write("\n");
						}
					} 
				}
				pw.flush();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			pw.close();
			System.out.println("끝==================================================================================");
		}
	}
}
