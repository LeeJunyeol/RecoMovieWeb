<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- �� 3�� meta �±׵��� head ���� �ʼ��� �;��Ѵ�!! �ٸ� �±׵��� �� 3 �±� �ڿ� �´�.-->

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

   <!-- �ڹٽ�ũ��Ʈ (������������ �� ��)-->
   <script src="js/jquery-1.11.3.min.js"></script>
   <script src="js/bootstrap-datepicker.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   
    <script src="js/sessionCheck2.js"></script>

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
<!-- movie Grid Section -->
    <section id="movie" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Boxoffice</h2>
                    <h3 class="section-subheading text-muted">�ڽ� ���ǽ�</h3>
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
                        <img id="boximg1" src="#" class="img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname1"></h4>
                        <p id="rank1" class="text-muted"></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal2" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg2" src="#" class="img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname2"></h4>
                        <p id="rank2" class="text-muted"></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal3" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
	                        <img id="boximg3" src="#" class="img-responsive" style="width:100%" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname3"></h4>
                        <p id="rank3" class="text-muted"></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal4" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
	                        <img id="boximg4" src="#" class="img-responsive" style="width:100%" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname4"></h4>
                        <p id="rank4" class="text-muted"></p>
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
                        <img id="boximg5" src="#" class="img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname5"></h4>
                        <p id="rank5" class="text-muted"></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal6" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg6" src="#" class="img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname6"></h4>
                        <p id="rank6" class="text-muted"></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal7" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg7" src="#" class="img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname7"></h4>
                        <p id="rank7" class="text-muted"></p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 movie-item">
                    <a href="#movieModal8" class="movie-link" data-toggle="modal">
                        <div class="movie-hover">
                            <div class="movie-hover-content">
                                <i class="fa fa-plus fa-3x"></i>
                            </div>
                        </div>
                        <img id="boximg8" src="#" class="img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname8"></h4>
                        <p id="rank8" class="text-muted"></p>
                    </div>
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