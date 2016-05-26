<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.entity.MemberEntity, static com.util.Encoder.*" %>
<!DOCTYPE html>
<%
	MemberEntity me = (MemberEntity) session.getAttribute("me");
	if(me!=null){
		
		HashMap<String, String> curinfo = (HashMap<String,String>)request.getAttribute("curinfo");
%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>좌석 선택(Movie - kitri 4조 web프로젝트!)</title>

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

<!-- jQuery -->
<script src="js/jquery.js"></script>
<script src="js/sessionCheck.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		// 예매페이지에서 선택한 정보들 입력
		var time = '<%=curinfo.get("time")%>';
		var movieCd = '<%=curinfo.get("movieCd")%>';
		var cinemaID = '<%=curinfo.get("cinemaID")%>';
		var screenID = '<%=curinfo.get("screenID")%>';
		var strdate = '<%=curinfo.get("strdate")%>';
		var movieName = '<%=curinfo.get("movieName")%>';
		var people = 0;
		var price = 0;
		var seats = [];
		
		/*SeatLoad*/
 		$.ajax({
  			url: "SeatLoad.do",
  			dataType: "json",
  			method: "POST",
  			data: { 'cinemaID': cinemaID, 'screenID': screenID }
  		}).done(function(json){
  			// data: jsonarray 형식
			$.each(json,function(key,seat){
				var seatRow = seat.seatVO.seatRow;
				var seatCol = seat.seatVO.seatCol;
				var seatID = "#" + seatRow + "_" + seatCol;
				
				$(seatID).html("<div class='seatval'>"+seatCol+"</div>");
				$(seatID).attr({
					seat_checked: false,
					isbooked: "available"
				});
				
				$(seatID+"[isbooked='available'] > div").css({
					"background-color": "#5bc0de"
				}); 
				
				var seatInnerSpan = seatID + "> div";
 				$(seatInnerSpan).hover(
					function(){
						$(this).css({
							"opacity": 0.6
						})
					}, function(){
						$(this).css({
							"opacity": 1.0
						})
					}
				)
				$(seatID).click(function(){
					if($(this).attr("isbooked")=="available"){
						if($(this).attr("seat_checked")=="false"){
							$(this).attr("seat_checked", true);
							$(this).children("div").css({
								"background-color": "#337ab7"
							})
							seats.push($(this).attr('id'));
							$("#selectedSeats span").text(seats.join(", "));
							people += 1;
							$("#peopleCnt span").text(people + "명");
							price += 9000;
							$("#totalPrice span").text(price + "원");
						} else {
							$(this).attr("seat_checked", false);
							$(this).children("div").css({
								"background-color": "#5bc0de"
							})
							seats.pop($(this).attr('id'));
							$("#selectedSeats span").text(seats.join(", "));
							people -= 1;
							$("#peopleCnt span").text(people + "명");
							price -= 9000;
							$("#totalPrice span").text(price + "원");
						}
					}
				})
				
			})//ends $.each
		})//ends ajax.done
		
		/*LoadedSeat _ Edited by YooNa*/
 		$.ajax({
  			url: "LoadedSeat.do",
  			dataType: "json",
  			method: "POST",
  			data: { 'cinemaID': cinemaID, 'screenID': screenID, 
  				'time': time, 'strdate': strdate, 'movieCd': movieCd }
  		}).done(function(json){
  			
   			$.each(json,function(key,seat){
   				var seatRow = seat.seatVO.seatRow;
				var seatCol = seat.seatVO.seatCol;
  				var seatID = "#"+seatRow+"_"+seatCol;
  				$(seatID).attr("isbooked","unavailable");
			})//ends $.each
			$("div[isbooked='unavailable'] > div").css({
				"background-color": "#808080"
			});  
		})//ends ajax.done
  		
		$("#movieName").append("<span>" +movieName+ "<span>");
		$("#movieTime").append("<span>" +time+ "<span>");
		$("#screenName").append("<span>" +screenID+ "<span>");
		
		$("#btnConfirm").click(function(){
			$(".bookingVal[name='cinemaID']").attr("value",cinemaID);
			$(".bookingVal[name='screenID']").attr("value",screenID);
			$(".bookingVal[name='seats']").attr("value",seats);
			$(".bookingVal[name='movietime']").attr("value",time);
			$(".bookingVal[name='movieCd']").attr("value",movieCd);
			$(".bookingVal[name='strdate']").attr("value",strdate);
			$("#bookingInfoForm").submit();
		})
	
	})//end document.ready
</script>

   <style type="text/css">
   		body {
   			background-color: black;
   		}
		#wrapper{
			margin-top: 130px;
			background-color: white;
		}
		
		
		#screenLabel{
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
			text-align: center;
			font-weight: 700;
			background-color: #dff0d8;
			padding-top: 5px;
			padding-bottom: 5px;
			margin-bottom: 5px;
		}
		
		.seat{
			min-width: 30px;
			min-height: 30px;
			padding-left: 3px;
			padding-right: 3px;
			font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
			font-weight: 700;
			color: #fff;
		}
		
		.seat div{
			display:inline-block;
			width: 100%;
			height: 100%;
			padding-top: 3px;
    		padding-bottom: 3px;
			text-align: center;
			border-radius: .25em;
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
		
		@media(min-width:1200px) {
			#wrapper{
				margin-top: 130px;
				height: 90%;
			}
			#respanel {
				height: 100%;
			}
		}
		
		.bookinginfo{
			background-color: #eee;
			font-size: 12px;
			border-radius: 6px;
			line-height: 1.42857143;
			padding-top: 30px;
			padding-bottom: 30px;
			padding-right: 40px;
    		padding-left: 40px;
   		}
   </style>
</head>
<body>
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

<div id="wrapper">
<div id="respanel">

<br/><br/>
<div class="col-sm-1"></div>
<div class="col-sm-7">
	<div id="seatMap" class="container-fluid">
		<div class="row">
			<div id="screenLabel" class="col-md-12">SCREEN</div>		
		</div>
		<div id="A" class="row">
			<div id="A_1" class="seat col-md-1"></div>
			<div id="A_2" class="seat col-md-1"></div>
			<div id="A_3" class="seat col-md-1"></div>
			<div id="A_4" class="seat col-md-1"></div>
			<div id="A_5" class="seat col-md-1"></div>
			<div id="A_6" class="seat col-md-1"></div>
			<div id="A_7" class="seat col-md-1"></div>
			<div id="A_8" class="seat col-md-1"></div>
			<div id="A_9" class="seat col-md-1"></div>
			<div id="A_10" class="seat col-md-1"></div>
			<div id="A_11" class="seat col-md-1"></div>
			<div id="A_12" class="seat col-md-1"></div>
		</div>
		<div id="B" class="row">
			<div id="B_1" class="seat col-md-1"></div>
			<div id="B_2" class="seat col-md-1"></div>
			<div id="B_3" class="seat col-md-1"></div>
			<div id="B_4" class="seat col-md-1"></div>
			<div id="B_5" class="seat col-md-1"></div>
			<div id="B_6" class="seat col-md-1"></div>
			<div id="B_7" class="seat col-md-1"></div>
			<div id="B_8" class="seat col-md-1"></div>
			<div id="B_9" class="seat col-md-1"></div>
			<div id="B_10" class="seat col-md-1"></div>
			<div id="B_11" class="seat col-md-1"></div>
			<div id="B_12" class="seat col-md-1"></div>
		</div>
		<div id="C" class="row">
			<div id="C_1" class="seat col-md-1"></div>
			<div id="C_2" class="seat col-md-1"></div>
			<div id="C_3" class="seat col-md-1"></div>
			<div id="C_4" class="seat col-md-1"></div>
			<div id="C_5" class="seat col-md-1"></div>
			<div id="C_6" class="seat col-md-1"></div>
			<div id="C_7" class="seat col-md-1"></div>
			<div id="C_8" class="seat col-md-1"></div>
			<div id="C_9" class="seat col-md-1"></div>
			<div id="C_10" class="seat col-md-1"></div>
			<div id="C_11" class="seat col-md-1"></div>
			<div id="C_12" class="seat col-md-1"></div>
		</div>
		<div id="D" class="row">
			<div id="D_1" class="seat col-md-1"></div>
			<div id="D_2" class="seat col-md-1"></div>
			<div id="D_3" class="seat col-md-1"></div>
			<div id="D_4" class="seat col-md-1"></div>
			<div id="D_5" class="seat col-md-1"></div>
			<div id="D_6" class="seat col-md-1"></div>
			<div id="D_7" class="seat col-md-1"></div>
			<div id="D_8" class="seat col-md-1"></div>
			<div id="D_9" class="seat col-md-1"></div>
			<div id="D_10" class="seat col-md-1"></div>
			<div id="D_11" class="seat col-md-1"></div>
			<div id="D_12" class="seat col-md-1"></div>
		</div>
		<div id="E" class="row">
			<div id="E_1" class="seat col-md-1"></div>
			<div id="E_2" class="seat col-md-1"></div>
			<div id="E_3" class="seat col-md-1"></div>
			<div id="E_4" class="seat col-md-1"></div>
			<div id="E_5" class="seat col-md-1"></div>
			<div id="E_6" class="seat col-md-1"></div>
			<div id="E_7" class="seat col-md-1"></div>
			<div id="E_8" class="seat col-md-1"></div>
			<div id="E_9" class="seat col-md-1"></div>
			<div id="E_10" class="seat col-md-1"></div>
			<div id="E_11" class="seat col-md-1"></div>
			<div id="E_12" class="seat col-md-1"></div>
		</div>
		<div id="F" class="row">
			<div id="F_1" class="seat col-md-1"></div>
			<div id="F_2" class="seat col-md-1"></div>
			<div id="F_3" class="seat col-md-1"></div>
			<div id="F_4" class="seat col-md-1"></div>
			<div id="F_5" class="seat col-md-1"></div>
			<div id="F_6" class="seat col-md-1"></div>
			<div id="F_7" class="seat col-md-1"></div>
			<div id="F_8" class="seat col-md-1"></div>
			<div id="F_9" class="seat col-md-1"></div>
			<div id="F_10" class="seat col-md-1"></div>
			<div id="F_11" class="seat col-md-1"></div>
			<div id="F_12" class="seat col-md-1"></div>
		</div>
		<div id="G" class="row">
			<div id="G_1" class="seat col-md-1"></div>
			<div id="G_2" class="seat col-md-1"></div>
			<div id="G_3" class="seat col-md-1"></div>
			<div id="G_4" class="seat col-md-1"></div>
			<div id="G_5" class="seat col-md-1"></div>
			<div id="G_6" class="seat col-md-1"></div>
			<div id="G_7" class="seat col-md-1"></div>
			<div id="G_8" class="seat col-md-1"></div>
			<div id="G_9" class="seat col-md-1"></div>
			<div id="G_10" class="seat col-md-1"></div>
			<div id="G_11" class="seat col-md-1"></div>
			<div id="G_12" class="seat col-md-1"></div>
		</div>
		<div id="H" class="row">
			<div id="H_1" class="seat col-md-1"></div>
			<div id="H_2" class="seat col-md-1"></div>
			<div id="H_3" class="seat col-md-1"></div>
			<div id="H_4" class="seat col-md-1"></div>
			<div id="H_5" class="seat col-md-1"></div>
			<div id="H_6" class="seat col-md-1"></div>
			<div id="H_7" class="seat col-md-1"></div>
			<div id="H_8" class="seat col-md-1"></div>
			<div id="H_9" class="seat col-md-1"></div>
			<div id="H_10" class="seat col-md-1"></div>
			<div id="H_11" class="seat col-md-1"></div>
			<div id="H_12" class="seat col-md-1"></div>
		</div>
				
	</div>
</div>
<div class="bookinginfo col-sm-3">
	<h3>예약 정보</h3>
	<p id="movieName">영화: </p>
	<p id="movieTime">시간: </p>
	<p id="screenName">상영관: </p>
	<p id="selectedSeats">좌석: <span></span></p>
	<p id="peopleCnt">인원: <span>0명</span></p>
	<p id="totalPrice">가격: <span>0원</span></p>
<form id="bookingInfoForm" action="confirmBooking.do">
	<input type="hidden" class="bookingVal" name="cinemaID"/>
	<input type="hidden" class="bookingVal" name="screenID"/>
	<input type="hidden" class="bookingVal" name="seats"/>
	<input type="hidden" class="bookingVal" name="movietime"/>
	<input type="hidden" class="bookingVal" name="movieCd"/>
	<input type="hidden" class="bookingVal" name="strdate"/>
	<button type="button" id="btnConfirm" class="btn btn-primary">예매하기</button>
</form>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<!-- ************************************************************************************ -->
    <footer style="background: white">
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