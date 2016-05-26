<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page	import="java.util.*, com.entity.MemberEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty me}">
	<c:redirect url="/index.html"/>
</c:if>
<c:if test="${!empty me}">
<% MemberEntity me = (MemberEntity) session.getAttribute("me");
	String msg = "";
	if(request.getParameter("successmsg")!=null){
		msg = request.getParameter("successmsg");
	} 
%>
<!DOCTYPE html>
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
</script>

<!--회원탈퇴 -->
<script type="text/javascript">
$(document).ready(function(){
    /* 회원 탈퇴 이벤트 */
    $("#memberdelete").click(function(){
        var memberno=$("#myNo").attr("value");
        var q1 = confirm("정말 탈퇴하시겠습니까?");
        if (q1==true){
           var q2 =   confirm("진짜죠?");
           if(q2==true){
              $.post("memberdelete.do",
                    {
                       no: memberno
                    },
                    function(data, status){
                       alert("탈퇴하셨습니다. 또 오세요.");
              	   });
           }
        }
     })
 });
</script>

<script>
$(document).ready(function(){
	var reservationList = $.ajax({
		url:"loadBookingInfo.do",
		method:"POST",
		data:{"myNo": <%=me.getMemberno()%> },
		dataType:"json"
	});
	
	reservationList.done(function(json){
		$.each(json, function(index, bookinginfo){
			var mybookinginfoID = "mybookinginfo" + index;
			var myInfoID = "myInfo" + index;
			$("#mybookinginfo").append("<div id='"+mybookinginfoID+"' class='mybookinginfo col-md-12'></div>");
			var mybookinginfoIDsel = "#"+mybookinginfoID;
			$(mybookinginfoIDsel).append("<div class='posterdiv col-md-2' style='height: 200px; display:inline-block'></div>");
			$(mybookinginfoIDsel).append("<div class='infocontainer col-md-10'></div>");
			var infocontainerSel = mybookinginfoIDsel + "> div[class~='infocontainer']";
 			$(infocontainerSel).append("<ul class='myinfoUL' style='-webkit-padding-start: 0px;'></ul>");
 			var posterdivSel = mybookinginfoIDsel + "> div[class~='posterdiv']";
 			
 		/* 	$.ajax{
 				url: "ImageLoad.do",
  				dataType: "json",
  				method: "POST",
  				
 			} */
 			
 			$(posterdivSel).css({
 				"background-image":"url(img/movie/no_img.jpg)",
 	 			"background-size":"cover"
 			});
 			
			$(mybookinginfoIDsel).find("ul").append("<li class='bookingNo' value='"+bookinginfo["bookingNo"]+"' style='display: inline-block;'><span class='label label-default'></span>&nbsp;&nbsp;"+bookinginfo["bookingNo"]+"</li>");
 			//추가
			$(mybookinginfoIDsel).find("ul").append("<button type='button' class='reservationdelete' style= 'display: inline-block; margin-left: 30%'>예매 취소</button>");
			
 			$(mybookinginfoIDsel).find("ul").append("<li class='movieName'><span class='label label-default'></span>&nbsp;&nbsp;"+bookinginfo["movieName"]+"</li>");
			$(mybookinginfoIDsel).find("ul").append("<li class='cinemaName'><span class='label label-default'></span>&nbsp;&nbsp;"+bookinginfo["cinemaName"]+"</li>");
			$(mybookinginfoIDsel).find("ul").append("<li class='screenID'><span class='label label-default'></span>&nbsp;&nbsp;"+bookinginfo["screenID"]+"</li>");
			$(mybookinginfoIDsel).find("ul").append("<li class='date'><span class='label label-default'></span>&nbsp;&nbsp;"+bookinginfo["date"]+"</li>");
			$(mybookinginfoIDsel).find("ul").append("<li class='startTime'><span class='label label-default'></span>&nbsp;&nbsp;"+bookinginfo["startTime"]+"</li>");
			$(mybookinginfoIDsel).find("ul").append("<li class='seatList'><span class='label label-default'></span>&nbsp;&nbsp;"+bookinginfo["seatList"]+"</li>");
			$(".bookingNo").find("span").text("예약번호");
			$(".screenID").find("span").text("상영관");
			$(".date").find("span").text("상영날짜");
			$(".cinemaName").find("span").text("영화관");
			$(".startTime").find("span").text("상영시간");
			$(".seatList").find("span").text("좌석");
			$(".movieName").find("span").text("영화명");
		//	$(".bookingNo").css("display","block");
 		}) // each end
 		
	   // 추가
	   $(".reservationdelete").click(function(){
		   //alert($(this).prev().attr("value"));
 		   var bookingno=$(this).prev().attr("value");
           var q1 = confirm("정말 취소하시겠습니까?");
           if (q1==true){
        	   $.post("reservationdelete.do",
        	   	{
                  resno: bookingno
              }).done(function(data){
	          	  	alert("취소되었습니다.");
	              window.location.replace('/mrp4/mybookingstat.do');
                });
          } 
 	    }) // click end 
 		
	})
	var msg = '<%=msg %>';
	if(msg!=""){
		alert(msg);
	}
});
</script>
	<style type="text/css">
		#wrapper{
			height: 100%;
			margin-top: 100px;
		}
		
		.mybookinginfo{
			padding:15px; 
			background-color:#31A7D7;
			margin-bottom: 8px;
			border-radius: .50em;
		}
		.infocontainer{
			background-color: #FFF;
			height: 200px;
			display:inline-block;
		}
		.infocontainer .label{
			color: #25ACE6;
			background: transparent;
			font-size: 20px;
			font-weight: 800;
		}
		
		.infocontainer li{
			background-color:transparent;
			margin-bottom: 13px;
			height: 30px;
			width: 50%;
			display: inline-block;
			font-size: 20px;
			font-weight: 800;
			color:#A7E4FF;
		}
		
		.nav {
			list-style:none;
         	text-align:center;
         	border:10px;
         	border-color:blue; 
        } 
        
      	.nav li {
	      	text-transform:uppercase;
	      	letter-spacing:5px; /*글자간격*/
	      	border: 5cm;
      	}
      	
      		
      	
		.list-group-item{
			padding: 0px;
		}
		
      	.reservationdelete {
		     border: 0px solid #0a3c59;
			 background: #25ACE6;
			 /* background: -webkit-gradient(linear, left top, left bottom, from(#bcdff5), to(#25ACE6));
			 background: -webkit-linear-gradient(top, #bcdff5, #25ACE6);
			 background: -moz-linear-gradient(top, #bcdff5, #25ACE6);
			 background: -ms-linear-gradient(top, #bcdff5, #25ACE6);
			 background: -o-linear-gradient(top, #bcdff5, #25ACE6);
			 background-image: -ms-linear-gradient(top, #bcdff5 0%, #25ACE6 100%);  */
			 padding: 8px 16px;
			 -webkit-border-radius: 9px;
			 -moz-border-radius: 9px;
			 border-radius: 9px;
			 -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
			 -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
			 box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
			 text-shadow: #ffffff 0 1px 0;
			 color: #ffffff;
			 font-size: 15px;
			 font-family: Malgun Gothic;
			 text-decoration: none;
			 vertical-align: middle;
		}
	
		.reservationdelete:active {
			position:relative;
			top:1px;
		}
      
   </style>
</head>

<body>
 <!-- ******************************************************************************** -->
<div class="row">
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
</div>
<!-- ******************************************************************************** -->
<div class="row">
<div id="wrapper">
	<div class="container-fluid">
		<div class="row" style="
		    margin-bottom: 30px;
		">
			<div class="col-sm-2"></div>
			<div class="col-sm-8 text-center" style="
			    font-weight: 600;
			    font-size: 18px;
			">
				<ul class="nav nav-pills nav-stacked">
					<li class="active" id="mybookinglist"><a href="mybookingstat.do">내 예약 정보</a></li>		
					<li><a href="memberupdate.do">회원정보수정</a></li>
					<li>
						<input id="myNo" type="hidden" value=${me.memberno}>
						<a id="memberdelete">회원탈퇴</a>
						
					</li>
				</ul>
				
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
<!-- ******************************************************************************** -->
	<div class="row">
		<div class="col-sm-2"></div>
		<div id="mybookinginfo" class="col-sm-8">
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>
</div>
<div class="row">
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Bigdata4 - MovieRocommendProject</span>
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
</div>
</body>
<!-- Plugin JavaScript -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="js/classie.js"></script>

<!-- Contact Form JavaScript -->
<script src="js/jqBootstrapValidation.js"></script>

<!-- Custom Theme JavaScript -->
<script src="js/agency.js"></script>
</html>
</c:if>