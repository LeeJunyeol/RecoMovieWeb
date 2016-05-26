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
   
<title>관리자 메인</title>

	<!-- jQuery -->
	<script src="js/jquery.js"></script>
	<script src="js/sessionCheck.js"></script>
	<style type="text/css">
      #wrapper{
         margin-top: 110px;
         height: 100%;
      }
   </style>
   <script>
   			$(document).ready(function(){
   		   		$("#updateMember").click(function(){
   					document.myform.action="MemberFindAdmin.do";
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
    <div class="topspace" style="padding:15px; background:#111; height:100px"></div>
	<div>
	<form action="MemberDeleteAdmin.do" name="myform">
		<table class="table">
			<thead>
				<tr>
					<td>회원번호</td>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>성별</td>
					<td>생년월일</td>
					<td>주소</td>
					<td>전화번호</td>
					<td>이메일</td>
				</tr>
			</thead>
			<tbody>
			
				<% ArrayList<MemberEntity> memberlist = (ArrayList<MemberEntity>)request.getAttribute("memberList"); %>
				<%
					for(MemberEntity member : memberlist) {
				%>
				<tr>
					<td><%=member.getMemberno()%></td>
					<td><%=member.getId()%></td>
					<td><%=member.getPw()%></td>
					<td><%=member.getName()%></td>
					<td><%=member.getSex()%></td>
					<td><%=member.getBirth()%></td>
					<td><%=member.getAddr()%></td>
					<td><%=member.getTel()%></td>
					<td><%=member.getEmail()%></td>
					<td><input type="checkbox" name="ch" value="<%=member.getMemberno()%>"/>
				  </td>
				</tr>
				<%
					}
				%>
				<tr>
					<td>
					</td>
					<td colspan="3" style="text-align: center"><a id="updateMember">수정</a></td>
					<td colspan="3" style="text-align: center"><input type="submit" value="삭제"></td>
				</tr>
			</tbody>
		</table>
	</form>
					<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="MemberUpload.do">
						<input type="file" name="file"/>
						<p style="color: red; font-weight: bold">
						<form:errors path="file"></form:errors></p>
						<input type="submit" value="추가">
					</form:form>
					<form:form method="post" enctype="multipart/form-data" modelAttribute="uploadFile" action="SeatUpload.do">
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