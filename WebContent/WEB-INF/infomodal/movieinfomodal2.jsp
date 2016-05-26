<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Set"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>

<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.comm.CodeAPIServiceImplService"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.comm.CodeResultVO"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieAPIServiceImplService"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.soap.movie.MovieInfoResult"%>

<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--
------------------------------------------------------------
* @설명 : 영화코드 조회 REST 호출 - 서버측에서 호출하는 방식 예제
------------------------------------------------------------
-->
	
	
    <%
    String moviename=null;
    String startyear=null;
    String movieInfo = request.getParameter("movieInfo");
    if(movieInfo.indexOf("The")==-1){// The 가 없다면 
		//년도 뽑기
		String year[]=movieInfo.split(" ");
		startyear=year[(year.length)-1].replace("(", "").replace(")", "");
		//영화 검색용 제목 뽑기
		String name[]=movieInfo.split("\\(");
		moviename=name[0];
	}else{
		//년도 뽑기
		String year[]=movieInfo.split(" ");
		startyear=year[(year.length)-1].replace("(", "").replace(")", "");
		
		//영화 검색용 제목 뽑기
		String name[]=movieInfo.split("\\|");
		moviename=name[0];
	}
  	
	
    
    
    // 파라메터 설정
	String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");					//현재페이지
	String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");		//결과row수
	String movieNm = request.getParameter("movieNm")==null?moviename:request.getParameter("movieNm");						//영화명
	String directorNm = request.getParameter("directorNm")==null?"":request.getParameter("directorNm");				//감독명
	String openStartDt = request.getParameter("openStartDt")==null?"":request.getParameter("openStartDt");			//개봉연도 시작조건 ( YYYY )
	String openEndDt = request.getParameter("openEndDt")==null?"":request.getParameter("openEndDt");				//개봉연도 끝조건 ( YYYY )	
	String prdtStartYear = request.getParameter("prdtStartYear")==null?startyear:request.getParameter("prdtStartYear");	//제작연도 시작조건 ( YYYY )
	String prdtEndYear = request.getParameter("prdtEndYear")==null?startyear:request.getParameter("prdtEndYear");			//제작연도 끝조건    ( YYYY )
	String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");			//대표국적코드 (공통코드서비스에서 '2204'로 조회된 국가코드)
	String[] movieTypeCdArr = request.getParameterValues("movieTypeCdArr")==null? null:request.getParameterValues("movieTypeCdArr");	//영화형태코드 배열 (공통코드서비스에서 '2201'로 조회된 영화형태코드)
	
	// 발급키
	String key = com.web.KOBISKey.key;
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// 영화코드조회 서비스 호출 (boolean isJson, String curPage, String itemPerPage,String directorNm, String movieCd, String movieNm, String openStartDt,String openEndDt, String ordering, String prdtEndYear, String prdtStartYear, String repNationCd, String[] movieTypeCdArr)
    String movieCdResponse = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> result = mapper.readValue(movieCdResponse, HashMap.class);

	request.setAttribute("result",result);
	
		
    %>
    
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

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

<title>Insert title here</title>

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script>
   $(document).ready(function(){
      
      $("#movieImg").error(function(){
         $("#movieImg").attr("src","img/movie/no_img.jpg");
      })
      $.post("SessionCheck",
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
        
        <%-- var now = '<%=now%>';
        var mcd = '<%=movieCd%>'; --%>
        // Send the data using post
        var posting = $.post( url, { 'myno': $form.find("#memNo").val(), 'myrating': $form.find( "button" ).val(), 'movieCd': mcd, 'now': now} );
       
        // Put the results in a div
        posting.done(function( data ) {
           alert(data);
        });
      });//ends ratingform.submit
      
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
	<hr>
	<br>
	
	<div class="col-md-8 col-md-offset-2">
		<div class=container>
		<c:if test="${not empty result.movieListResult.movieList}">
			<c:forEach items="${result.movieListResult.movieList}" var="movie">
				<div id="imgdiv">
					<img id="movieImg" src="#" height=280px width=210px>
				</div>
				<div id="infodiv">
					<h2><c:out value="${movie.movieNm }"/>
					<small><c:out value="${movie.movieNmEn }"/></small>
					</h2>
					<p>유형 : <c:out value="${movie.typeNm }"/></p>
					<p>국가 : <c:out value="${movie.repNationNm }"/></p>
					<p>장르 : <c:out value="${movie.genreAlt }"/></p>
					<p>감독 : <c:forEach items="${movie.directors}" var="director"><c:out value="${director.peopleNm}"/>,</c:forEach></p>
					<p>제작사 : <c:forEach items="${movie.companys}" var="company"><c:out value="${company.companyNm}"/>,</c:forEach></p>					
					<br>
					<hr>
				</div>
			</c:forEach>
		</c:if>	
		</div> <!-- ends infodiv -->
		
		<div id="container1" style="width: 100%; margin-top: 20px;">
			<div class="rating" style="width: 50%; position: absolute;">
			<!-- rating -->
				<form id="ratingForm" action="RatingFind" method="post">
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
			<!-- booking -->
			<div class="booking" style="width: 48%; padding-right: 25%; float: right;">
			<form>
			   <input type="submit" class="btn btn-primary" value="예매하기" style="float: right;">
			</form>
			</div><!-- ends booking -->
		</div>
		
		</div>
	</div>
<%-- 	<%= result%>
	<br>
	
	<br>
	<br>
	<%= result.get("movieListResult").getClass() %>
	<br>
	<br>
	<%= result.get("movieListResult").get("movieList")%>
	 --%>
	
	
</body>
</html>