<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
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
   <script src="js/bootstrap-datepicker.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   
    <script src="js/sessionCheck.js"></script>

   <!-- Login Page Css -->
   <link href="css/mloginstyle.css" rel="stylesheet" type="text/css">


<title>Insert title here</title>

<%
   String errorMessage = (String)request.getAttribute("error_message"); 
   if(errorMessage!=null){%>
      <script>
         alert("<%=errorMessage%>");
         window.location.replace("memberlogin.do");
      </script>
   <%} %>

<!--     jQuery -->
    <script src="js/jquery.js"></script>

   <style type="text/css">
      #wrapper{
         margin-top: 110px;
         height: 71%;
      }
      
      .form-control{
		width: 70%;
		display: inline-block;
      }
      
      .label{
      	color: black;
      	font-size: 18px;
      	font-weight: 700;
      	width: 25%;
      	display: inline-block;
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
<div class="row" style="padding-top: 3%">
	<div class="col-md-3"></div>
	<div class="col-md-6" style="text-align: center;
    height: 120px;
    font-size: 50px;
    font-weight: 700;
    font-family: monospace;
    text-transform: uppercase;">
		Welcome
	</div>
	<div class="col-md-3"></div>
</div>
<div class="row" style="height: 68%; padding-top: 2%">
   <div class="col-md-3"></div>
   <div class="col-md-6">
		  <div class="col-md-10">
		     <form class="form-horizontal" action="loginproc.do" method="post">
	         <div class="col-md-10">
		         <div class="col-md-12">
				      <div class="form-group">
			            <div class="label">아이디</div><input type="text" name="id" class="form-control" id="inputId" placeholder="아이디">
			         </div>
			      </div>
		         <div class="col-md-12">
				      <div class="form-group">
			            <div class="label">비밀번호</div><input type="password" name="pw" class="form-control" id="inputPw" placeholder="비밀번호">
			         </div>
			      </div>
		      </div>
		         <div class="col-md-2  text-center">
			         <div class="form-group">
		               <input type="submit" class="form-control" style="width:100%; height: 70px; padding:0px;" id="memberlogin" value="회원로그인">
		            </div>
		         </div>
		        </form>
		  </div>
<!--   <div class="col-xs-6">
     <form class="form-horizontal" action="index.jsp" method="post" target="_parent">
      <div class="form-group">
         <div class="col-xs-11">
            <input type="text" name="telid" class="form-control" id="inputTelNum" placeholder="휴대폰번호">
         </div>
      </div>
      <div class="form-group">32
         <div class="col-xs-11">
            <input type="text" name="name" class="form-control" id="inputPw" placeholder="이름">
         </div>
      </div>
         <div class="form-group">
            <div class="col-xs-11 text-center">
               <input type="submit" class="form-control" id="nomemberlogin" value="비회원로그인">
            </div>
         </div>
        </form>
     </div>
 -->     </div>
 <div class="col-md-3"></div>
 </div>
</div>
<footer>
<div class="row">
	    <div class="container">
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