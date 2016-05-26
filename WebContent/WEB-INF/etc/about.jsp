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
      </script>
   <%} %>

   <!-- jQuery -->
	<script src="js/jquery.js"></script>
	<script src="js/sessionCheck2.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

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
                <li class="hidden"> <a href="#page-top"></a> </li>
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
 <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">About</h2>
                    <h3 class="section-subheading text-muted">Project MVC</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <ul class="timeline">
                        <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/1.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h3>OCTOBER 2015</h3>
                                    <h4 class="subheading">1차 PROJECT </h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">java를 이용 </p>
                                    <p class="text-muted">영화관 예매시스템과 추천프로그램</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/2.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>SEPTEMBER 2015</h4>
                                    <h4 class="subheading">2차 PROJECT</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">웹(부트스트랩), oracle DB를 이용</p>
                                    <p class="text-muted">영화관 예매시스템과 추천프로그램</p>
                                </div>
                            </div>
                        </li>
                        <!-- <li>
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/3.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>December 2012</h4>
                                    <h4 class="subheading">Transition to Full Service</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <img class="img-circle img-responsive" src="img/about/4.jpg" alt="">
                            </div>
                            <div class="timeline-panel">
                                <div class="timeline-heading">
                                    <h4>July 2014</h4>
                                    <h4 class="subheading">Phase Two Expansion</h4>
                                </div>
                                <div class="timeline-body">
                                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                                </div>
                            </div>
                        </li>
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4>Be Part
                                    <br>Of Our
                                    <br>Story!</h4>
                            </div>
                        </li> -->
                    </ul>
                </div>
            </div>
        </div>
    </section>

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