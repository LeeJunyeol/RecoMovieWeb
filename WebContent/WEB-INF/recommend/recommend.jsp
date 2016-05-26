
<%@page import="recommend.similarity"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<%
try{
	ArrayList<similarity> data = (ArrayList<similarity>)request.getAttribute("recommendList");
	
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
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<script src="js/sessionCheck.js"></script>

   
   <style type="text/css">
           .wrapper{
         margin-top: 110px;
         height: 100%;
      }
      
      .img-responsive{
         width: 100%;
      }
      
      iframe{
         min-height: 500px;
      }
      
      .modal-content{
          width: 80%;
          margin: 50px auto;
          padding-bottom: 50px;
          min-width: 630px;
       }
       
       .modal-content .modal-body{
          min-width: 600px;
       }
   </style>


<script>
</script>
<!-- 로그인, 회원가입 할 때 이벤트 -->
<script src="js/jlProcess.js"></script>
   <style type="text/css">
      .wrapper{
         height: 100%;
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
                       <a href="board.jsp" class="board-link">BOARD</a>
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

	
	<!-- movie Grid Section -->
    <section id="movie" class="bg-light-gray">
    	<div><%=data %></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">추천 영화 Best 8</h2>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal1" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg1" src="img/movie/no_img.jp*g" class="movieimage img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname1"><%=data.get(0).getMovieid()%></h4>
                        <p class="text-muted">예상평점 : <%=data.get(0).getRate()%></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal2" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg2" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname2"><%=data.get(1).getMovieid()%></h4>
                        <p class="text-muted">예상평점 : <%=data.get(1).getRate()%></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal3" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
	                        <img id="boximg3" src="img/movie/no_img.jpg" class="movieimage img-responsive" style="width:100%" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname3"><%=data.get(2).getMovieid()%></h4>
                        <p class="text-muted">예상평점 : <%=data.get(2).getRate()%></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal4" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
	                        <img id="boximg4" src="img/movie/no_img.jpg" class="movieimage img-responsive" style="width:100%" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname4"><%=data.get(3).getMovieid()%></h4>
                        <p class="text-muted">예상평점 : <%=data.get(3).getRate()%></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal5" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg5" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname5"><%=data.get(4).getMovieid()%></h4>
                        <p class="text-muted">예상평점 : <%=data.get(4).getRate()%></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal6" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg6" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname6"><%=data.get(5).getMovieid()%></h4>
                        <p class="text-muted">예상평점 : <%=data.get(5).getRate()%></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal7" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg7" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname7"><%=data.get(6).getMovieid()%></h4>
                        <p class="text-muted">예상평점 : <%=data.get(6).getRate()%></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal8" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg8" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname8"><%=data.get(7).getMovieid()%></h4>
                        <p class="text-muted">예상평점 : <%=data.get(7).getRate()%></p>
                    </div>
                </div>
            </div>
        </div>
    </section>


<!-- ******************************************************************************** -->
</div>
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
<!-- ******************************************************************************** -->
    
    <!-- movie Modal 1 -->
    <div class="movie-modal modal fade" id="movieModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="modal-body">
                              <iframe id="movieIframe2" src="movieinfomodal2.jsp?movieInfo=<%=data.get(0).getMovieid()%>" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- movie Modal 2 -->
    <div class="movie-modal modal fade" id="movieModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="modal-body">
                              <iframe id="movieIframe2" src="movieinfomodal2.jsp?movieInfo=<%=data.get(1).getMovieid()%>" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- movie Modal 3 -->
    <div class="movie-modal modal fade" id="movieModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="modal-body">
                              <iframe id="movieIframe3" src="movieinfomodal2.jsp?movieInfo=<%=data.get(2).getMovieid()%>" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
<%
} catch (Exception e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
   }
%>