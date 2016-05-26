<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page	import="java.util.*,com.entity.*, com.entity.MemberEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${empty me}">
	<c:redirect url="/index.html"/>
</c:if>
<c:if test="${!empty me}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
function ch_name(){
	    document.myform.action="update.do";
	    //document.myform.method="get";
	    document.myform.submit();
}
</script>

<style>
/* Form */

.insertboard{width:70%; border-left:2px solid #bdbdbd; border-right:2px solid #bdbdbd; border-top:2px solid #bdbdbd; border-bottom:2px solid #bdbdbd;font-family:"NanumGothic",sans-serif;}
.insertboard .qwer{text-align:center; margin:0 0 10px 0;} 
.insertboard tr{border-top:1px solid #cdcdcd; padding-top:3px solid #cdcdcd;} 
.insertboard tr:first-child{border-top:0;} 
 .insertboard th{background:#ffffff; width:25%; text-align:center; padding-left:3%}  
.insertboard td{text-align:left; background:#fff; padding-top:1%!important; padding-bottom:1%!important;color:#5c5c5c;font-size:15px;line-height:26px;padding-left:3%}
/* .insertboard insertemail{text-align:left; background:#fff; padding-top:1%!important; padding-bottom:1%!important;color:#5c5c5c;font-size:15px;line-width:70px;line-height:26px;padding-left:3%} */
.insertboard select{margin-right:1%;color:#5c5c5c;line-height:12px;font-size:14px;font-family:"NanumGothic",sans-serif;background:#f6f6f6;vertical-align:middle;border:1px solid #cdcdcd;padding:1%;} 
 .insertboard select{padding:0.9%;}
 .insertboard textarea{vertical-align:middle;border:1px solid #cdcdcd; width:94%; height:200px;background:#f6f6f6;padding:1%} 
 .insertboard label{margin-right:1%;}
 .insertboard .add{margin-top:1%;} 
 .insertboard .wid10{width:10%;} 
 .insertboard .wid20{width:20%;} 
 .insertboard .wid30{width:30%;} 
 .insertboard .wid53{width:49%;} 

.insertenroll{margin-top:20px;} 
.insertenroll {margin-right:20px; width:8%;margin:0 auto;padding:0.7em 1.5em 0.8em 1.5em;font-size:16px;color:#000000;border:1px solid #008d2d;border-radius:2em;background:#DADADA; text-align:center;letter-spacing:-0.5px; font-weight:bold;}
.insertenroll:hover{background:#fff;color:#676767;}
.insertenroll{margin-top:20px;} 



.insertcancel {margin-left:5%;width:8%;margin:0 auto;padding:0.7em 1.5em 0.8em 1.5em;font-size:16px;color:#000000;border:1px solid #008d2d;border-radius:2em;background:#DADADA; text-align:center;letter-spacing:-0.5px; font-weight:bold;}
.insertcancel:hover{background:#fff;color:#676767;}

.listbutton {margin-left:5%;width:8%;margin:0 auto;padding:0.7em 1.5em 0.8em 1.5em;font-size:16px;color:#000000;border:1px solid #008d2d;border-radius:2em;background:#DADADA; text-align:center;letter-spacing:-0.5px; font-weight:bold;}
.listbutton:hover{background:#fff;color:#676767;}
</style>

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
    });
 })
</script>
	<style type="text/css">
		#wrapper{
			height: 100%;
			margin-top: 100px;
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
                        <a class="page-scroll" href="#movie">movie</a>
                    </li>
                    
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
	                    <a href="reservation.jsp" class="res-link">REServation</a>
                    </li>
                    <li>
	                    <a class="page-scroll" href="#team">team</a>
                    </li>
                    <li>
	                    <a href="AllList.do" class="board-link">BOARD</a>
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
	<div align="center" style="padding-top: 200px;">
		<form method="post" action="insertProc.do">
			<table class="insertboard" width="100%" >
			<caption class="qwer"></caption>
				<tr>
					<th class="th" scope="row"><img src="img/insertboard/inserttitle1.PNG"  alt="제목"/></th>
					<td><input type=text name=title size="50" maxlength="100"></td>
				</tr>

				<tr>
					<th class="th" scope="row"><img src="img/insertboard/insertname1.PNG" alt="이름"/></th>
					<td><b>${me.id }</b></td>
					<input type="hidden" name=name class="wid20" size=20 maxlength=20 value=${me.id } >
				</tr>
				<tr>
					<th class="th" scope="row"><img src="img/insertboard/inserthand1.PNG" alt="핸드폰번호"/></th>
					<td><select class="wid10" title="핸드폰 앞 자리 선택">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select><input type="text" title="전화번호 앞" maxlength="4" lass="wid20" /> 
					<input type="text" title="전화번호 뒤" maxlength="4" class="wid20" /></td>
				</tr>
				
				<tr>
					<th class="insertemail" scope="row"><img src="img/insertboard/insertemail1.PNG" alt="이메일"/></th>
					<td><input type="text" class="wid53" title="이메일"
						placeholder="예 : abcd@gmail.com"></td>
					</td>
				</tr>
				<tr>
					<th class="th" scope="row"><img src="img/insertboard/insertpass1.PNG" alt="비밀번호"/></th>
					<td><input type="password" name="password" id="writepassword"
						maxlength="10"></td>
				</tr>
				<tr>
					<th class="th" scope="row"><img src="img/insertboard/insertcontent1.PNG" alt="내용"/></th>
					<td><textarea name=contents cols=50 rows=10 title="Q&A"
							placeholder="500자 이내(1000byte)로 입력해 주세요"></textarea></td>
				</tr>
			</table>

			<div class="insertenca">
<!-- 				<tr align="center"> -->
					<input class="insertenroll" type="submit" value="write"/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input class="insertcancel" type="reset" value="reset" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="listbutton"type="list" name="listbutton1" value="list">list</button>
				
			</div>
		</form>
	</div>
	<!-- ******************************************************************************** -->

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; kitri4 Website 2016</span>
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
</html>
</c:if>