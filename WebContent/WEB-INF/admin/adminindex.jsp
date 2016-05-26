<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
    <script src="js/sessionCheck2.js"></script>
	<script>
		$(document).ready(function(){
 			var date = new Date();
 			date.setDate(date.getDate()-1) //어제 날짜 박스오피스 조회
 			var year = date.getFullYear();	// YYYYMMDD 형식으로 변환 한다.
 			var month = date.getMonth()+1;
 			if(month<10){
				month = "0" + month; 				
 			}
 			var day = date.getDate();
 			if(day<10){
 				day = "0" + day;
 			}
 			var targetDt = year +""+ month +""+ day;
  			$.ajax({
  				url: "BoxOfficeLoad.do",
  				dataType: "json",
  				method: "POST",
  				data: {'targetDt': targetDt }
  			}).done(function(json){
  				var i=0;
				// data: jsonarray 형식
				$.each(json,function(key,value){
					var boxname = "#boxname"+ value.rank;
					var boximg = "#boximg" + value.rank;
					var rank = "#rank" + value.rank;
					var movieCd = "#movieCd" + value.rank;
					var movieIframe = "#movieIframe" + value.rank;
					$(boxname).text(value.movieNm);
					$(boximg).attr("value",value.movieCd);
					$(boximg).attr("src","/mrp4/image/"+value.movieCd+".jpg");
					$(rank).text(value.rank + "위");
					$(movieIframe).attr("src","movieBoxInfoModal.do?movieCd="+value.movieCd);
				});//ends $.each
	  			var movieCdArr = new Array();
	  			movieCdArr[0] = $("#boximg1").attr("value");
	  			movieCdArr[1] = $("#boximg2").attr("value");
	  			movieCdArr[2] = $("#boximg3").attr("value");
	  			movieCdArr[3] = $("#boximg4").attr("value");
	  			movieCdArr[4] = $("#boximg5").attr("value");
	  			movieCdArr[5] = $("#boximg6").attr("value");
	  			movieCdArr[6] = $("#boximg7").attr("value");
	  			movieCdArr[7] = $("#boximg8").attr("value");
	  			var postData = { movieCodes: movieCdArr };
	  			setTimeout(function(){
		   			$.ajax({
		  				url: "imgUrlListLoader.do",
		  				dataType: "json",
		  				method: "POST",
		  				success: function(json){
		  					$.each(json,function(key,value){
/* 		  						alert(key);
		  						$("img[value='"+key+"']").attr("src","/mrp4/image/"+key+".jpg");
 */		  					})//ends $.each
 							alert("이미지불러오기가 완료되었습니다.");
		  		        },
		  				data: postData,
		  				async: false,
		  				traditional: true,
		  			})//end
	  			}, 10000)
			})//ends .done
 			$('#searchbtn').click(function(){
			$('#searchIframe').attr("src","movieinfomodal_search.do?movieName="+$('#moviename').val());
 			})
		});//ends document.ready
	
	</script>
	<!-- 로그인, 회원가입 할 때 이벤트 -->
   <script src="js/jlProcess.js"></script>
   
   <style type="text/css">
   		body{
   			background: #1A1A1A;
   		}
		.wrapper{
			margin-top: 110px;
			height: 100%;
		}
		
		.img-responsive{
			width: 100%;
		}
		.container2{
			margin-top: -10px;
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
    	
    	.img-responsive{
    		max-width: 708px;
    		max-height: 497px;
    	}
   </style>
 
   
</head>

<body class="index">
 <!-- ******************************************************************************** -->
    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" style="padding:15px; background: #0F171B; ">
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
	<!-- Swiper -->
	<div class="container2">
	    <div class="swiper-container" >
	        <div class="swiper-wrapper">
				
<!-- 				<div class="swiper-slide" align="center">
					코딩시작
					<video src="#" autoplay  
					poster="include/images/video-poster.JPG" controls
						width="730" height="330">

					</video>
				</div>
 -->				<!-- e: #page-wrap -->
				<div class="swiper-slide">
	            	<img src="image/thinkingofoppa.JPG" class="img-responsive" controls alt="">
	            </div>
	            <div class="swiper-slide">
	            	<img src="image/revenent.jpg" class="img-responsive" alt="">
	            </div>
	            <div class="swiper-slide">
					<img src="image/Kung-Fu-Panda-3.jpg" class="img-responsive" alt="">
				</div>
	            <div class="swiper-slide">
					<img src="image/bigshort.jpg" class="img-responsive" alt="">
				</div>
				<div class="swiper-slide">
					<img src="image/robotsound.jpg" class="img-responsive" alt="">
				</div>
	
	        </div>
	        <!-- Add Pagination -->
	        <div class="swiper-pagination"></div>
	        <!-- Add Arrows -->
	        <div class="swiper-button-next"></div>
	        <div class="swiper-button-prev"></div>
	    </div>
	</div>
	    <!-- Swiper JS -->
	    <script src="assets/js/swiper.min.js"></script>
	
	    <!-- Initialize Swiper -->
	    <script>
	    var swiper = new Swiper('.swiper-container', {
	        pagination: '.swiper-pagination',
	        slidesPerView: 1,
	        paginationClickable: true,
	        spaceBetween: 100,
	        keyboardControl: true,
	        nextButton: '.swiper-button-next',
	        prevButton: '.swiper-button-prev',
	    });
	    </script>

<!-- ******************************************************************************** -->
	<!-- movie Grid Section -->
    <section id="movie" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Boxoffice</h2>
                    <h3 class="section-subheading text-muted">박스 오피스</h3>
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
                        <img id="boximg1" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
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
                        <img id="boximg2" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
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
	                        <img id="boximg3" src="img/movie/no_img.jpg" class="movieimage img-responsive" style="width:100%" alt="">
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
	                        <img id="boximg4" src="img/movie/no_img.jpg" class="movieimage img-responsive" style="width:100%" alt="">
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
                        <img id="boximg5" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
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
                        <img id="boximg6" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
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
                        <img id="boximg7" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
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
                        <img id="boximg8" src="img/movie/no_img.jpg" class="movieimage img-responsive" alt="">
                    </a>
                    <div class="movie-caption">
                        <h4 id="boxname8"></h4>
                        <p id="rank8" class="text-muted"></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
    
    <!-- Team Section -->
    <section id="team" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Our Amazing Team</h2>
                    <h3 class="section-subheading text-muted">movie reservation system makes.</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="img/developer/taejung.jpg" class="img-responsive img-circle" alt="">
                        <h4 style="text-transform: uppercase;">Kim tae jung</h4>
                        <p class="text-muted">Developer</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="img/developer/junyeol.jpg" class="img-responsive img-circle" alt="">
                        <h4 style="text-transform: uppercase;">Lee jun yeol</h4>
                        <p class="text-muted">Web Manager</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="img/developer/chanho.jpg" class="img-responsive img-circle" alt="">
                        <h4 style="text-transform: uppercase;">Jung chan ho</h4>
                        <p class="text-muted">Analysis Manager</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-sm-2"></div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="img/developer/youna.jpeg" class="img-responsive img-circle" alt="">
                        <h4 style="text-transform: uppercase;">Lee you na</h4>
                        <p class="text-muted">Developer, Data Collector</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="team-member">
                        <img src="img/developer/heejung.jpg" class="img-responsive img-circle" alt="">
                        <h4 style="text-transform: uppercase;" >Jae hee jung</h4>
                        <p class="text-muted">Developer, Data Collector</p>
                        <ul class="list-inline social-buttons">
                            <li><a href="#"><i class="fa fa-twitter"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a>
                            </li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            	<div class="col-sm-2"></div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <p class="large text-muted">빅데이터4기 4조 화이팅!^^ 모두 수고하셨습니다!</p>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; MRP4 2016</span>
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

	<!-- search Modal -->
    <div class="movie-modal modal fade" id="searchModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container" style="padding: 0px 0px 0px 0px; ">
                <div class="row">
                    <div class="col-lg-10 col-lg-offset-1">
                        <div class="modal-body">
                        		<iframe id="searchIframe" src="#" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- movie Modals -->
    <!-- Use the modals below to showcase details about your movie projects! -->

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
                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="modal-body">
                        		<iframe id="movieIframe1" src="#" width="100%" height="100%" target="_top" frameborder="0"></iframe>
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
                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="modal-body">
                        		<iframe id="movieIframe2" src="#" width="100%" height="100%" target="_top" frameborder="0"></iframe>
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
                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="modal-body">
                        		<iframe id="movieIframe3" src="#" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- movie Modal 4 -->
    <div class="movie-modal modal fade" id="movieModal4" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="modal-body">
                        		<iframe id="movieIframe4" src="#" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- movie Modal 5 -->
    <div class="movie-modal modal fade" id="movieModal5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="modal-body">
                        		<iframe id="movieIframe5" src="#" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- movie Modal 6 -->
    <div class="movie-modal modal fade" id="movieModal6" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="modal-body">
                        		<iframe id="movieIframe6" src="#" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- movie Modal 7 -->
    <div class="movie-modal modal fade" id="movieModal7" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="modal-body">
                        		<iframe id="movieIframe7" src="#" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- movie Modal 8 -->
    <div class="movie-modal modal fade" id="movieModal8" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-1">
                        <div class="modal-body">
                        		<iframe id="movieIframe8" src="#" width="100%" height="100%" target="_top" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="js/classie.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="js/agency.js"></script>
</html>
