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
    
    String moviename = request.getParameter("movieName");
    
    // 파라메터 설정
	String curPage = request.getParameter("curPage")==null?"1":request.getParameter("curPage");					//현재페이지
	String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");		//결과row수
	String movieNm = request.getParameter("movieNm")==null?moviename:request.getParameter("movieNm");						//영화명
	String directorNm = request.getParameter("directorNm")==null?"":request.getParameter("directorNm");				//감독명
	String openStartDt = request.getParameter("openStartDt")==null?"":request.getParameter("openStartDt");			//개봉연도 시작조건 ( YYYY )
	String openEndDt = request.getParameter("openEndDt")==null?"":request.getParameter("openEndDt");				//개봉연도 끝조건 ( YYYY )	
	String prdtStartYear = request.getParameter("prdtStartYear")==null?"":request.getParameter("prdtStartYear");	//제작연도 시작조건 ( YYYY )
	String prdtEndYear = request.getParameter("prdtEndYear")==null?"":request.getParameter("prdtEndYear");			//제작연도 끝조건    ( YYYY )
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
	
	// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
	String nationCdResponse = service.getComCodeList(true,"2204");
	HashMap<String,Object> nationCd = mapper.readValue(nationCdResponse, HashMap.class);
	request.setAttribute("nationCd",nationCd);

	String movieTypeCdResponse = service.getComCodeList(true,"2201");
	HashMap<String,Object> movieTypeCd = mapper.readValue(movieTypeCdResponse, HashMap.class);
	request.setAttribute("movieTypeCd",movieTypeCd);	
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
      
      $('.btn').click(function(){
    	  //alert($(this).parent().contents().filter("input").val());
    	  $(location.href="movieBoxInfoModal.do?movieCd="+$(this).parent().contents().filter("input").val());
    	  
	   })
      
      
   }); //ends document.ready
</script>
<script type="text/javascript">
<%
	String movieTypeCds = "[";
	if(movieTypeCdArr!=null){
		for(int i=0;i<movieTypeCdArr.length;i++){
			movieTypeCds += "'"+movieTypeCdArr[i]+"'";
			if(i+1<movieTypeCdArr.length){
				movieTypeCds += ",";
			}
		}
		movieTypeCds += "]";
%>

$(function(){
	var movieTypeCd = <%=movieTypeCds%>;
	$(movieTypeCd).each(function(){
		$("input[name='movieTypeCdArr'][value='"+this+"']").prop("checked",true);
	});
});

<%
	}
%>
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
      
      min-height: auto;
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
		<div class=container style="padding: 0px 0px 0px 0px; font-size:small; ">
			
			<table border="1">
				<tr>
					<td>영화명</td><td>영화명(영)</td><td>제작연도</td><td>개봉연도</td><td>제작국가</td><td>감독</td>
					<td>참여영화사</td>
					<td>상세정보</td>
					<td>영화코드</td>
				</tr>
			<c:if test="${not empty result.movieListResult.movieList}">
			<c:forEach items="${result.movieListResult.movieList}" var="movie">
				<tr>
					<td>
						<p>
							<c:out value="${movie.movieNm }"/>
						</p>
					</td>
					<td><c:out value="${movie.movieNmEn }"/></td>
					<td><c:out value="${movie.prdtYear }"/></td>
					<td><c:out value="${movie.openDt }"/></td>
					<td><c:out value="${movie.repNationNm}"/></td>
					<td><c:forEach items="${movie.directors}" var="director"><c:out value="${director.peopleNm}"/>,</c:forEach></td>
					<td><c:forEach items="${movie.companys}" var="company"><c:out value="${company.companyNm}"/>,</c:forEach></td>	
					<td>
						<form id="searchform" class="input-append" method="GET" style="margin-top:12px;">
							<div>
				                 <input type="text" id="movieCd" value="${movie.movieCd }"/>
				                 <button id="searchbtn" type="button" class="btn"/>
		                    	 	<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				                 </button>
			                 </div>
		                 </form>
					</td>
					<td><c:out value="${movie.movieCd }"/></td>		
				</tr>
			</c:forEach>
			</c:if>
			</table>
			<form action="">
				<br>
				<p>현재페이지 : <input type="text" name="curPage" value="<%=curPage %>">
				   최대 출력갯수 : <input type="text" name="itemPerPage" value="<%=itemPerPage %>"><br></p>
				<p>감독명 : <input type="text" name="directorNm" value="<%=directorNm %>"></p>	
				<p>영화명 : <input type="text" name="movieNm" value="<%=movieNm %>"> <br/></p>
				<p>개봉연도조건 : <input type="text" name="openStartDt" value="<%=openStartDt %>"> ~ <input type="text" name="openEndDt" value="<%=openEndDt %>"></p>
				<p>제작연도조건 : <input type="text" name="prdtStartYear" value="<%=prdtStartYear %>"> ~ <input type="text" name="prdtEndYear" value="<%=prdtEndYear %>"></p>		
		
				<p>국적 : <select name="repNationCd">
					<option value="">-전체-</option>
					<c:forEach items="${nationCd.codes}" var="code">
					<option value="<c:out value="${code.fullCd}"/>"<c:if test="${param.repNationCd eq code.fullCd}"> selected="seleted"</c:if>><c:out value="${code.korNm}"/></option>
					</c:forEach>
					</select><br/>
				</p>
				<p>
				영화형태 : 
					<c:forEach items="${movieTypeCd.codes}" var="code" varStatus="status">
					<input type="checkbox" name="movieTypeCdArr" value="<c:out value="${code.fullCd}"/>" id="movieTpCd_<c:out value="${code.fullCd}"/>"/> <label for="movieTpCd_<c:out value="${code.fullCd}"/>"><c:out value="${code.korNm}"/></label>
					<c:if test="${status.count %4 eq 0}"><br/></c:if>
					</c:forEach>
					<br/>
				<input type="submit" name="" value="조회">
				</p>
			</form>
		</div> <!-- ends infodiv -->

		</div>
	</div>


</body>
</html>