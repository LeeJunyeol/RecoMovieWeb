<%@page import="com.entity.TimeEntity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.entity.MemberEntity"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
   
<title>시간표 관리</title>

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
		    document.myform.action="timeFind.do";
		    //document.myform.method="get";
		    document.myform.submit();
		}
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
                <a class="navbar-brand page-scroll" href="/mrp4/">Movie</a>
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
	<!-- 코딩시직 -->
	<div class="topspace" style="padding:15px; background:#111; height:100px"></div>
	<div>
		<%
			ArrayList<TimeEntity> timelist = (ArrayList<TimeEntity>)request.getAttribute("timeList");
		%>
		<form action="timeDelete.do" name=myform>
			<table class="table">
			<thead>
				<tr>
					<th>시간번호</th>
					<th>영화날짜</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>상영회차</th>
					<th>영화관ID</th>
					<th>스크린ID</th>
					<th>영화코드</th>
				</tr>
				</thead>
				<tbody>
				<%
					for(TimeEntity time : timelist) {
				%>
				<tr>
					<td><%=time.getTimeno()%></td>
					<td><%=time.getTimeVO().getS_date()%></td>
					<td><%=time.getTimeVO().getE_date()%></td>
					<td><%=time.getTimeVO().getStartTime()%></td>
					<td><%=time.getTimeVO().getCount()%></td>
					<td><%=time.getTimeVO().getCinemaID()%></td>
					<td><%=time.getTimeVO().getScreenID()%></td>
					<td><%=time.getTimeVO().getMovieCd()%></td>
					<td><input type="checkbox" name="ch" value="<%=time.getTimeno()%>"/>						 
				  </td>
				</tr>
				<%
					}
				%>
				<tr>
					<td align="center" colspan="3"><a href="timeInsert.do">추가</a></td>
					<!-- <td align="center" colspan="3"><a href="timeFind">수정</a></td> -->
					<td align="center" colspan="3"><a onclick="ch_title();">수정</a></td>	
					<td align="center" colspan="3"><input type="submit" value="삭제"></td>	
				</tr>
				</tbody>
			</table>
		</form>
		
		<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="TimeUpload.do">
				<input type="file" name="file"/>
				<p style="color: red; font-weight: bold">
				<form:errors path="file"></form:errors></p>
				<input type="submit" value="추가">
			</form:form>
			<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="Movie_CinemaUpload.do">
				<input type="file" name="file"/>
				<p style="color: red; font-weight: bold">
				<form:errors path="file"></form:errors></p>
				<input type="submit" value="추가">
			</form:form>
			
	</div>
<!-- ******************************************************************************** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Your Website 2014</span>
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