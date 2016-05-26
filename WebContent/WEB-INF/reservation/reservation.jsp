<%@page import="javax.swing.JOptionPane"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page	import="java.util.*, com.entity.MemberEntity, static com.util.Encoder.*"%>
<!DOCTYPE html>
<html>
<%
	MemberEntity me = (MemberEntity) session.getAttribute("me");
	if(me!=null){
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Movie - kitri 4조 web프로젝트!</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/agency.css" rel="stylesheet">
<link href="css/ourstyle.css" rel="stylesheet">
<link href="css/mypage.css" rel="stylesheet">

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

<!-- Datepicker 날짜선택하게 해줌 -->
<link href="css/datepicker.css" rel="stylesheet">

<!-- jQuery -->
<script src="js/jquery.js"></script>

<script src="js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<!-- 로그인, 회원가입 할 때 이벤트 -->
<script src="js/jlProcess.js"></script>
<script src="js/sessionCheck.js"></script>

<!-- http://eternicode.github.io/bootstrap-datepicker/?markup=input&format=&weekStart=&startDate=&endDate=&startView=0&minViewMode=0&todayBtn=false&clearBtn=false&language=en&orientation=auto&multidate=&multidateSeparator=&keyboardNavigation=on&forceParse=on#sandbox -->
<script> 
		$(document).ready(function(){
			//날짜 선택 로딩
			$('#sandbox-container').datepicker({
			    format: "yyyy-mm-dd",
			    language: "kr"
			});
			
			///////////////////////////////////////////////모든 목록 로딩 ////////////////////////////////////////////////
			var movieCd;
			var cinemaID;
			var day; 
			var movieNm;
			var cinemaNm;
			
			//영화 목록 로딩 
			var movieLoadAll = $.ajax({
				url: "OpenMovieLoad.do",
				method: "POST",
				data: {},
				dataType: "json"
			});
			
			movieLoadAll.done(function(json){
					//영화목록을 json형식으로 불러와 movielist에 추가한다. 
					$("#movielist").html("");
					$.each(json,function(key,value){
						$("#movielist").append("<li id='" +value.movieCd + "' class='list-group-item'>" + value.movo.title + "</li>");
					});//ends $.each
					//로딩된 영화목록을 클릭하는 경우 해당하는 영화코드를 기준으로 상영관 목록을 불러옫다.
					$('#movielist').find('li').click(function(){
						movieCd = $(this).attr("id");
						movieNm = $(this).text();
						$.getJSON("CinemaRefresh.do",
								{'movieCd' : movieCd},
								function(json){
									$("#cinemalist").html("");
									$.each(json,function(key,value){
			  							$("#cinemalist").append("<li id='" + value.cinemaID + "' class='list-group-item'>" + value.cinemaVO.cinemaname + "</li>");
									})//ends $.each
									//영화코드와 상영관코드를 이용하여 달력을 업데이트 한다.
									$('#cinemalist').find('li').click(function(){
										cinemaID = $(this).attr("id");
										cinemaNm = $(this).text();
										$.getJSON("CalendarRefresh.do",
												{ 'cinemaID' : cinemaID, 'movieCd' : movieCd },
												function(json){
													var startdate = json[0];
													$('#sandbox-container').datepicker('update', startdate);
													var daylist = [];
													var monthjson = new Object();
													monthjson['01']='January';
													monthjson['02']='February';
													monthjson['03']='March';
													monthjson['04']='April';
													monthjson['05']='May';
													monthjson['06']='June';
													monthjson['07']='July';
													monthjson['08']='August';
													monthjson['09']='September';
													monthjson['10']='October';
													monthjson['11']='November';
													monthjson['12']='December';
													
													$.each(json,function(key,value){
 														var res = value.split("-");
 														var day = res[2];
														if($(".datepicker-days").find("th[class='datepicker-switch']").text()==(monthjson[res[1]]+" "+res[0])){
	 														if(day.substring(0,1)=='0'){
	 															day = day.substring(1,2);
	 														}
	 														var targetday = $("td[class='day']").filter(function() {
	 							                               return $(this).text() == day;
	 							                           });
	 														targetday.css("background-color","#6FB0E8");
															targetday.css("color","#ffffff");
															daylist[key]=value;
														}
													})//ends $.each
													$('#sandbox-container div').click(function(){
														$.each(daylist, function(index, value){
	 														var res = value.split("-");
	 														var day = res[2];
															if($(".datepicker-days").find("th[class='datepicker-switch']").text()==(monthjson[res[1]]+" "+res[0])){
		 														if(day.substring(0,1)=='0'){
		 															day = day.substring(1,2);
		 														}
		 														var targetday = $("td[class='day']").filter(function() {
		 							                               return $(this).text() == day;
		 							                           });
		 														targetday.css("background-color","#6FB0E8");
																targetday.css("color","#ffffff");
															}
														})
														var date = $('#sandbox-container').datepicker("getDate");
														var month = date.getMonth()+1;
														if (month<10){
															month = "0" + month;
														}
														var strdate = date.getFullYear() + "-" + month + "-" + date.getDate();
 														$.getJSON("ViewTimeTable.do",
																{'movieCd': movieCd, 'cinemaID': cinemaID, 'strdate': strdate },
																function(json){
																	$('#schedule_div').html('<div id="scheduleID1"></div>');
																	$.each(json,function(key,value){
																		if(key=='movie'){
																			$.each(json[key],function(index, data){
																			});
																		} else if(key=='time'){
																			var cnt = 1;
																			var spanID;
																			$.each(json[key],function(index, data){
																				divID = "#scheduleID" + cnt;
																				spanID = "#screenID" + cnt;
																				ulID = "#ulID" + cnt;
									
																				if(index==0){
																					$(divID).append('<span id="screenID' + cnt + '"></span>');
																					$(spanID).text(data.timeVO.screenID);
																					$(divID).append('<ul id="ulID' + cnt + '" class="list-group"></ul>');
																				}
																				if($(spanID).text()!=data.timeVO.screenID){
																					cnt = cnt+1;
																					divID = "#scheduleID" + cnt;
																					$('#schedule_div').append('<div id="scheduleID' + cnt + '"></div>');
																					$(divID).append('<span id="screenID' + cnt + '"></span>');
																					$(divID).append('<ul id="ulID' + cnt + '" class="list-group"></ul>');
																					spanID = "#screenID" + cnt;
																					$(spanID).text(data.timeVO.screenID);
																					ulID = "#ulID" + cnt;
																				} 
																				$(ulID).append('<li class="list-group-item">' + data.timeVO.startTime + '</li>');
																			}); //ends $.each index, data
																		}//ends else if 
																	}) //ends $.each key, value
																	var time;
																	var screenID;
																	$('#schedule_div').find('li').click(function(){
																		time = $(this).text();
																		screenID = $( this ).parent().parent().contents().filter("span").text();
																		$('#input_time').attr("value",time);
																		$('#input_screenID').attr("value",screenID);
																	});//ends schedule_div li click
																});//ends ViewTimeTable getJSON																				
 																$('#input_strdate').attr("value",strdate);
															})//click sandbox-container div 
												});//ends CalendarRefresh getJSON 
										$('#input_cinemaID').attr("value",cinemaID);
										$('#input_cinemaNm').attr("value",cinemaNm);
									});//ends cinemalist click
								});//ends CinemaRefresh getJSON
							$('#input_movieCd').attr("value",movieCd);
							$('#input_movieNm').attr("value",movieNm);
					});//ends click movielist
			});//ends done

			movieLoadAll.fail(function(jqXHR, textStatus){
				alert("영화 목록 불러오기가 실패하였습니다.");
			});
			
			//상영관 목록 로딩 
			var cinemaSelect = $.ajax({
				url: "CinemaSelect.do",
				method: "POST",
				data: {},
				dataType: "json"
			});
			
			cinemaSelect.done(function(json){
					$("#cinemalist").html("");
						$.each(json,function(key,value){
  							$("#cinemalist").append("<li id='" + value.cinemaID + "' class='list-group-item'>" + value.cinemaVO.cinemaname + "</li>");
						})//ends $.each
					$('#cinemalist').find('li').click(function(){
						cinemaID = $(this).attr("id");
					});
			});
			
			cinemaSelect.fail(function(jqXHR, textStatus){
				alert("상영관 목록 불러오기가 실패하였습니다.");
			});
		});
</script>
	<style type="text/css">
		#wrapper{
			min-height: 700px;
			margin-top: 130px;
			}
			
		#respanel{
			min-height: 500px;
			background-color: white;
			padding-left: 5%;
			padding-right: 5%;
			padding-top: 20px;
			padding-bottom: 20px;
			width: 80%;
			margin: 0 auto;" 
		}
		.movie_area ul{
			height: 280px; 
			overflow: scroll;
		}
		.cinema_area ul{
			height: 280px; 
			overflow: scroll;
		}
		
		.date_area ul{
			height: 280px; 
			overflow: scroll;
		}
		
		@media(min-width:1200px) {
			#wrapper{
				margin-top: 130px;
				height: 100%;
			}
			#respanel {
				height: 100%;
			}
		}
		
		#schedule_div {
			height: 280px;
			overflow: scroll;
			background: #C7E5FF;
		}
		#schedule_div span{
		    font-size: 17px;
		    font-weight: 600;
		    letter-spacing: 3px;
		    margin-left: 15px;
		    display: inline-block;
		    margin-top: 5px;
		}
		#schedule_div div{
			display: table-row;
		}
		
		#schedule_div ul{
		    display: block;
		    margin-left: 10px;
		    margin-top: 5px;
		    font-weight: 600;
		    color: royalblue;
		}

		#schedule_div li{
			float: left;
		}
		
		#schedule_div .list-group-item {
			padding: 5px 15px;
		}
		
		#confirm_div{
			height: 270px;
			width: 100%;
			margin: 0 auto;
		}
		#bookingform{
			margin-top: 15px;
			margin-bottom: 20px;
		}
		#bookingform input{
			border: 0;
		}
		#confirm_div button{
		    height: 40px;
		    width: 60%;
		    margin-left: 40px;
		    font-size: 120%;
		    text-align: center;
		}
		#confirm_div .label{
			font-size: 120%;
			color: black;
			line-height: 2;
		}
   </style>
</head>

<body id="page-top" class="index">
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
                <a class="navbar-brand page-scroll" href="index.html">Movie</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden"><a href="#page-top"></a></li>
		          	<li id="navbar-item1"> </li>
                    <li id="navbar-item2"> </li>
                    <li id="navbar-item3"> </li>  
                    <li id="navbar-item4"> </li>
                    <li id="navbar-item5"> </li>
                    <li id="navbar-item6"> </li>
                    <li id="navbar-item7"> </li>
                    <li id="navbar-item8"> </li>
                    <li>
                    	<form class="input-append" method="GET" action="/search" style="margin-top:12px;">
                    		<div class="input-group">
                    			<input type="text" title="Enter keyword(s) to find" id="kw" name="kw" class="span2" maxlength="40" style="background-color: #163240;color: white;">
                    			<button type="submit" class="btn">
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
<div id="wrapper">
<div id="respanel">
<!-- movie_area -->
<div class="movie_area" >
	<div class="col-md-4">
		<h4>영화 선택</h4>
		<ul id="movielist" class="list-group">
			
		</ul>
	</div>
</div>
<!-- cinema_area -->
<div class="cinema_area">
	<div class="col-md-4">
	<h4>상영관 선택</h4>
	<ul id="cinemalist" class="list-group">
	
	</ul>
	</div>
</div>
<!-- date_area -->
<div class="date_area">
	<div class="col-md-4">
		<h4>날짜 선택</h4>
		<div id=sandbox-container>
		</div> 
	</div>
</div>
<!-- movie_time_schedule -->
<div class="schedule_area">
	<div class="col-md-8">
	<h4>상영 시간표</h4>
		<div id="schedule_div">
		</div>
	</div>
</div>
<!-- confirm area -->
<div class="confirm_area">
	<div class="col-md-4">
	<h4>예매 하기</h4>
		<div id="confirm_div">
			<form action="goSeat.do" method="post" id="bookingform">
				<span class="label">시간: </span><input type="text" readonly id="input_time" name="time">
				<span class="label">영화: </span><input type="text" readonly id="input_movieNm" name="movieNm">
				<input type="hidden" readonly id="input_movieCd" name="movieCd">
				<span class="label">장소: </span><input type="text" readonly id="input_cinemaNm" name="cinemaNm">
				<input type="hidden" readonly id="input_cinemaID" name="cinemaID">
				<span class="label">상영관: </span><input type="text" readonly id="input_screenID" name="screenID">
				<span class="label">시간: </span><input type="text" readonly id="input_strdate" name="strdate">
			</form>
			<button id="confirm_btn" form="bookingform" type="submit" class="btn btn-primary">예&nbsp;&nbsp;매</button>
		</div>
	</div>
</div>

</div>
</div> <!-- ends respanel -->
<!-- ************************************************************************************ -->
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

<!-- Plugin JavaScript -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/classie.js"></script>

<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>

<!-- Custom Theme JavaScript -->
<script src="js/agency.js"></script>
<% 	} else {
	%><script>
			alert("로그인이 필요합니다.");
			window.location.href = "index.html";
		</script>
<%} %>
</html>
