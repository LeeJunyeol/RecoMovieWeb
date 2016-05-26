<%@page import="com.entity.MovieEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.MemberEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개 meta 태그들은 head 다음 필수로 와야한다!! 다른 태그들은 위 3 태그 뒤에 온다.-->

   <!-- Swiper CSS -->
   <link rel="stylesheet" href="assets/css/swiper.min.css">
   
   <!-- Bootstrap Core CSS -->
   <link href="css/bootstrap.min.css" rel="stylesheet">
   
   <!-- Custom CSS -->
   <link href="css/agency.css" rel="stylesheet">
   <link href="css/ourstyle.css" rel="stylesheet">

   <!-- Custom Fonts -->
   <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
   <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
   <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
   <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

   <!-- 자바스크립트 (순서변경하지 말 것)-->
   <script src="js/jquery-1.11.3.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   
<title>영화 관리</title>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<script src="js/sessionCheck.js"></script>
	<style type="text/css">
      #wrapper{
         margin-top: 110px;
         height: 100%;
      }
   </style>
      	<script type="text/javascript">
	   	function ch_title(){
		    document.myform.action="movieFind.do";
		    //document.myform.method="get";
		    document.myform.submit();
		}
	   	
	   	$(document).ready(function(){
	   		$("#viewMovieCine").click(function(){
			    document.myform.action="MovieCineAdmin.do";
			    document.myform.method="POST";
			    document.myform.submit();
			})
	   	})
	   	
   	</script> 
</head>
<body style="overflow-x:hidden">
 <!-- ******************************************************************************** -->
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" style="padding:15px; background:#111; ">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="/mrp/">Movie</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li id="navbar-item1"> </li>
                    <li id="navbar-item2"> </li>
                    <li id="navbar-item3"> </li>  
                    <li id="navbar-item4"> </li>
                    <li id="navbar-item5"> </li>
                    <li id="navbar-item6"> </li>
                    <li id="navbar-item7"> </li>
                    <li id="navbar-item8"> </li>
                    <li>
                       <form id="searchform" class="input-append" method="GET" style="margin-top:12px;">
                          <div class="input-group">
                             <input id="moviename" type="text" title="Enter keyword(s) to find" name="kw" class="span2" maxlength="40" style="background-color: #163240;color: white;">
                             <button id="searchbtn" type="button" class="btn" data-toggle="modal" data-target="#searchModal">
                                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                             </button>
                          </div>
                       </form>
                    </li>

                </ul>
                <ul class="nav pull-right">
                
                 </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

<!-- ******************************************************************************** -->
    <div class="topspace" style="padding:15px; background:#111; height:100px"></div>
	<div>
		<%
			ArrayList<MovieEntity> movielist = (ArrayList<MovieEntity>)request.getAttribute("movieList");
		%>
		<form action="movieDelete.do" name=myform>
			<table class="table">
				<thead>
					<tr>
						<th>영화코드</th>
						<th>영화명</th>
						<th>영화명(영문)</th>
						<th>제작연도</th>
						<th>제작국가</th>
						<th>유형</th>
						<th>장르</th>
						<th>감독</th>
						<th>제작사</th>
						<th>개봉일</th>
						<th>상영시간</th>
					</tr>
				</thead>
				<tbody>
					<%
						for(MovieEntity res : movielist) {
					%>
					<tr>
						<td class="movieCd"><%=res.getMovieCd()%></td>
						<td><%=res.getMovo().getTitle()%></td>
						<td><%=res.getMovo().getTitleen()%></td>
						<td><%=res.getMovo().getYear()%></td>
						<td><%=res.getMovo().getNation()%></td>
						<td><%=res.getMovo().getType()%></td>
						<td><%=res.getMovo().getGenre()%></td>
						<td><%=res.getMovo().getDirector()%></td>
						<td><%=res.getMovo().getCompany()%></td>
						<td><%=res.getMovo().getOpendate()%></td>
						<td><%=res.getMovo().getRunningtime()%></td>
						<td><input type="checkbox" name="ch" value="<%=res.getMovieCd()%>"/>						 
					  </td>
					</tr>
					<%
						}
					%>
					<tr>
						<td>
						</td>
						<td align="center"><a href="movieInsert.do">추가</a></td>
						<td style="text-align: center"><a onclick="ch_title();">수정</a></td>	
						<td style="text-align: center"><input type="submit" value="삭제"></td>	
						<td align="center"><input type="button" id="viewMovieCine" value="영화상영정보"></td>
					</tr>
				</tbody>
			</table>
		</form>
		
			<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="MovieUpload.do">
				<input type="file" name="file"/>
				<p style="color: red; font-weight: bold">
				<form:errors path="file"></form:errors></p>
				<input type="submit" value="추가">
			</form:form>
	</div>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Your Website 2016</span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li><a href="#"><i class="fa fa-twitter"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin"></i></a>
                        </li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>