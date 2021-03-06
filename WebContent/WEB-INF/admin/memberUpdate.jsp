<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.entity.MemberEntity"%>
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

	<style type="text/css">
      #wrapper{
         margin-top: 110px;
         height: 100%;
      }
   </style>
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
                   <li id="navbar-item3">
                    </li>
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                      <li id="navbar-item1">
                    </li>
                      <li id="navbar-item2">
                    </li>
                    	<li>
                        <a href="goMainAdm.do" class="page-scroll">메인</a>
                    </li>
                    <li>
                        <a href="goMemberAdm.do" class="page-scroll">회원</a>
                    </li>
                    
                    <li>
                        <a href="goMovieAdm.do" class="page-scroll">영화</a>
                    </li>
                    <li>
                       <a href="goCinemaAdm.do" class="res-link">상영관</a>
                    </li>
                    <li>
                       <a href="goBookingAdm.do" class="page-scroll">예매</a>
                    </li>
                    <li>
                       <a href="goTimetableAdm.do" class="board-link">시간표</a>
                    </li>
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
	<%	//배달한 값을 찾아서 출력
		ArrayList<MemberEntity> memlist = (ArrayList<MemberEntity>) request.getAttribute("memlist");
	%>
	<form action="MemberUpdateAdmin.do">
		<table border=1 width="90%" class="table">
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>성별</th>
				<th>생년월일</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>이메일</th>
			</tr>
			<%
				int i = -1;
				for (MemberEntity res : memlist) {
					i++;
			%>
				<tr>
					<td><input type="text" value="<%=res.getMemberno()%>" readonly="readonly" name="memberList[<%=i%>].memberno"></td>
					<td><input type="text" value="<%=res.getId()%>" name="memberList[<%=i%>].id"/></td>
					<td><input type="text" value="<%=res.getPw()%>" name="memberList[<%=i%>].pw"></td>
					<td><input type="text" value="<%=res.getName()%>" name="memberList[<%=i%>].name"></td>
					<td><input type="text" value="<%=res.getSex()%>" name="memberList[<%=i%>].sex"></td>
					<td><input type="text" value="<%=res.getBirth()%>" name="memberList[<%=i%>].birth"></td>
					<td><input type="text" value="<%=res.getAddr()%>" name="memberList[<%=i%>].addr"></td>
					<td><input type="text" value="<%=res.getTel()%>" name="memberList[<%=i%>].tel"></td>
					<td><input type="text" value="<%=res.getEmail()%>" name="memberList[<%=i%>].email"></td>
				</tr>
			<%
				}
			%>
			<tr>
				<td align="center" colspan="7"> <input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>
