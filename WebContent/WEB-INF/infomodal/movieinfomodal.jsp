<!DOCTYPE html>
<%@page import="com.web.KOBISKey"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@page import="javax.xml.bind.Element"%>
<%@page import="org.w3c.dom.Document"%>
<%@page import="com.entity.MovieEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.comm.CodeAPIServiceImplService"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.comm.CodeResultVO"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieAPIServiceImplService"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieInfoResult"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.sql.Timestamp" %>
<%@ page import="com.entity.MemberEntity"%>
    <%
    // 파라메터 설정   
   String movieCd = request.getParameter("movieCd");                  //영화코드
   Timestamp now = new Timestamp(System.currentTimeMillis());
   
   // 발급키
   String key = KOBISKey.key;
   
   // KOBIS 오픈 API SOAP Client를 통해 호출
   MovieInfoResult movieInfoResult = new MovieAPIServiceImplService().getMovieAPIServiceImplPort().searchMovieInfo(key, movieCd);
   request.setAttribute("movieInfoResult",movieInfoResult);   
   
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
    %>
    
    
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Movie - kitri 4조 web프로젝트!</title>
<!-- Swiper CSS -->
<link rel="stylesheet" href="assets/css/swiper.min.css">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- jQuery -->
<script src="js/jquery.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
   $(document).ready(function(){
		var movieCd = '<%=movieCd%>';
// 		$("#movieImg").attr("src","img/movie/"+movieCd+".jpg");
// 		$("#movieImg").error(function(){
// 			$("#movieImg").attr("src","img/movie/no_img.jpg");
// 		}) 
      $.post("SessionCheck.do",
            {},
            function(data, status){
               if(data=="sessionNull"){   // 로그인 X 
                  $('#rate-dropdownMenu').attr("disabled","disabled");
                  $('#ratingForm').find('input[type="submit"]').attr("disabled","disabled");
               } else {// 로그인 O
                  $('#rate-dropdownMenu').removeAttr("disabled");
                  $('#ratingForm').find('input').removeAttr("disabled");
                  $('#memNo').attr("value",data);
               } 
         });//ends $.post
      $('#rate-dropdownUl').find('li').click(function(){
         var score = $(this).find('a').text();
         var iconpath = $(this).find('img').attr("src");
         $('#rate-dropdownMenu').attr("value",score);
         $('#rate-dropdownMenu').find('img').attr("src",iconpath);
      })//ends rate-dropdwonUl li click
      
      // Attach a submit handler to the form
      $( "#ratingForm" ).submit(function( event ) {
       
        // Stop form from submitting normally
        event.preventDefault();
       
        // Get some values from elements on the page:
        var $form = $( this ),
         url = $form.attr( "action" );
        
        var now = '<%=now%>';
        var mcd = '<%=movieCd%>';
        
        var movienm = '<%=movieNm%>';
        var movienmen ='<%=movieNmEn%>';
        var moviedate ='<%=movieDate%>';
        var opendate = '<%=opendate%>';
        var nation = '<%=nation%>';
        var type = '<%=type%>';
        var genre = '<%=genre%>';
        var director = '<%=director%>';
        var company = '<%=company%>';
        var runningtime = '<%=runningtime%>';
        
        // Send the data using post
        var posting = $.post( url, { 'myno': $form.find("#memNo").val(), 'myrating': $form.find( "button" ).val(), 'movieCd': mcd, 'now': now,
                              'movieNmEn': movienmen, 'movieDate':moviedate, 'movieNm': movienm, 'opendate': opendate,
                              'nation': nation, 'type': type, 'genre': genre, 'director': director,
                              'company': company, 'runningtime': runningtime} );
       
			// Put the results in a div
			posting.done(function( data ) {
				alert(data);
			});
		});//ends ratingform.submit
      
		$(function(){
			$("#res").click(function(){
				var mcd = '<%=movieCd%>';
				top.location.href='reservation.do?movieCd='+mcd;
			});
		})
      
		$("#cloud").click(function(){
			var mvnm = '<%=movieNm%>';
			$(location.href="wordcloud.do?movieNm="+mvnm);
		});
               
         $('.btnCloud').click(function(){
            //alert($(this).parent().contents().filter("input").val());
            $(location.href="movieBoxInfoModal.do?movieCd="+$(this).parent().contents().filter("input").val());
            
         })
   }); //ends document.ready
</script>
<style type="text/css">
   body{
      background-color: transparent;
   }
   
   div{
      display: inline-block;
   }
   
   #imgdiv{
      position: absolute;
   }
   #infodiv{
      margin-left: 220px;
      min-height: 280px;
   }
   .dropdown-menu img{
      margin-right: 10px;
   }
   #rate-dropdownMenu img{
      margin-left: 6px;
   }
</style>
</head>
<body>
<div class="col-md-8 col-md-offset-2">
<div id="imgdiv">
<img id="movieImg" src="/mrp4/image/<%=movieCd%>.jpg" height=280px width=210px>
</div>
<div id="infodiv"><h2><%=movieNm %>
<small><%=movieNmEn %></small>
</h2>
<p>장르: <%=genre%></p>
<p>유형: <%=type %></p>
<p>감독: <%=director%></p>
<p>출연: <%=actor%></p>
<p>개봉일: <%=opendate %></p>
<p>상영시간: <%=runningtime %>분</p>
</div> <!-- ends infodiv -->
<div id="container1" style="width: 100%; margin-top: 20px;">
<div class="rating" style="width: 50%; position: absolute;">
<!-- rating -->
<form id="ratingForm" action="RatingFind.do" method="post" style="width: 75%">
<div class="dropdown">
  <button class="btn btn-default dropdown-toggle" type="button" id="rate-dropdownMenu" data-toggle="dropdown" aria-expanded="true" value=5>
    평점 <img src="img/icons/star_5.png">
    <span class="caret"></span>
  </button>
  <ul id="rate-dropdownUl" class="dropdown-menu" role="menu" aria-labelledby="rate-dropdownMenu">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_5.png">5</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_4.5.png">4.5</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_4.png">4</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_3.5.png">3.5</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_3.png">3</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_2.5.png">2.5</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_2.png">2</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_1.5.png">1.5</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_1.png">1</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_0.5.png">0.5</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="img/icons/star_0.png">0</a></li>
  </ul>
</div><!-- ends dropdown -->
   <input id="memNo" type="hidden" value="">
   <input type="submit" class="btn btn-primary" value="등록">
</form>
</div><!-- ends rating -->
<!-- wordcloud -->
<div class="clouding" style="width: 20%; padding-right: 50px; float: right;">
   <input id="cloud" type="button" value="워드클라우드" class="btn btnCloud btn-primary" />
</div><!-- ends wordcloud -->

<!-- booking -->
<div class="booking" style="width: 45%; padding-right: 50px; float: right;">
   <input id="res" type="button" class="btn btn-primary" value="예매하기" style="float: right;">
</div><!-- ends booking -->

</div>
</div>

</body>
</html> 