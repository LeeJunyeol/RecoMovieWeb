<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page	import="java.util.*,com.entity.*, com.entity.MemberEntity"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- [if (gt IE 9)|!(IE)]><!<html lang="ko" class="no-js modern"><![endif] -->
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

<!-- 게시판 버튼 css -->
<link rel="stylesheet" href="css/style.css" />

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

<!-- board button -->
<script src="js/libs/modernizr.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>window.jQuery || document.write('<script src="js/libs/jquery.min.js"><\/script>')</script>
<script src="js/libs/jquery.sound.min.js"></script>



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
//     alert($("#buttons_wrap").attr("id"));
//     $("#buttons_wrap > .button").css("color","red");
//    	$("#button1").css("color","red");


//     var url = "http://stackoverflow.com";    
//     $(location).attr('href',url);
 })
</script>
	<style type="text/css">
		#wrapper{
			height: 100%;
			margin-top: 100px;
		}
		
		.button{
			width: 200px;
		}
		
	</style>
	
<!-- table css -->
<style type="text/css">

/* 화면에 보여지는 글 등록 버튼 */

/* boardcss_list 에서 사용되는 글 등록 버튼 테이블 크기 */
#BoardAll_list_add_button_table { 
width: 100%; margin: 0 auto 15px; 
}

/* 화면에 보여지는 글 등록 버튼 */
#BoardAll_list_add_button_table .add_button { 
 cursor: pointer; border: 1px solid #bebebe; position: absolute; right: 200px; top: 700px; width: 85px; padding: 6px 0 6px; text-align: center; font-weight: bold;
}

/* 글 등록 버튼과 글 목록이 겹치지 않게 만들어준 아무것도 아닌것 */
#BoardAll_list_add_button_table .BoardAll_list_add_button ul { width: 100%; overflow: hidden;  height: 30px;}

/* BoardAll_list_table 에서 사용하는 글 목록 테이블 크기*/
.BoardAll_list_table { 
width: 100%;  
padding-top: 30px;
}

/* 화면에 보여지는 글 목록 테이블 */
.list_table { width: 100%; }

/* list_table 에서 사용되는 thead */
.list_table thead th { border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 5px 0; text-align: center; background: #faf9fa; }

/* list_table 에서 사용되는 tbody */
.list_table tbody td { padding: 5px 0; text-align: center; border-bottom: 1px solid #e5e5e5; }

/* 새글쓰기 버튼  */
.newbutton {
position: relative; top: 20px;  }

.newbutton {
   border: 3px solid #c4c4c4;
   background: #80868a;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#80868a));
   background: -webkit-linear-gradient(top, #ffffff, #80868a);
   background: -moz-linear-gradient(top, #ffffff, #80868a);
   background: -ms-linear-gradient(top, #ffffff, #80868a);
   background: -o-linear-gradient(top, #ffffff, #80868a);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #80868a 100%);
   padding: 13px 26px;
   -webkit-border-radius: 17px;
   -moz-border-radius: 17px;
   border-radius: 17px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #666666 0 1px 0;
   color: #ffffff;
   font-size: 24px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.newbutton:hover {
   border: 3px solid #adadad;
   text-shadow: #0b8f26 0 1px 0;
   background: #7a7a7a;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#7a7a7a));
   background: -webkit-linear-gradient(top, #ffffff, #7a7a7a);
   background: -moz-linear-gradient(top, #ffffff, #7a7a7a);
   background: -ms-linear-gradient(top, #ffffff, #7a7a7a);
   background: -o-linear-gradient(top, #ffffff, #7a7a7a);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #7a7a7a 100%);
   color: #0A7EF2;
   }
.newbutton:active {
   text-shadow: #ffffff 0 1px 0;
   border: 3px solid #c4c4c4;
   background: #80868a;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#7a7a7a));
   background: -webkit-linear-gradient(top, #ffffff, #80868a);
   background: -moz-linear-gradient(top, #ffffff, #80868a);
   background: -ms-linear-gradient(top, #ffffff, #80868a);
   background: -o-linear-gradient(top, #ffffff, #80868a);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #80868a 100%);
   color: #707070;
   }

}

/* 페이지넘버  */
.bopageno{
	margin-top: 80px; text-align: center;
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
	<%		
		ArrayList<Board> sm = (ArrayList<Board>) request.getAttribute("all");
		Board bd = (Board)request.getAttribute("pageVO");
	%>
	
<div>
</div>
	<div id="board" >
		<div align="center">
		<div class="container">
            <div class="row">
            <div class="row">
 				<div class="boardlist" style="display: inline-block; float: left; margin-left: 5%;"><h2 style="padding-top:150px; color:#A4A4A4"><u>BOARDLIST</u></h2></div>
			</div>
			
			
			
            <div class="row">
    			<div id="buttons_wrap" style="display: inline-block; margin-top: 30px;">
    			<a href="Boardnotice.jsp" id="button1" class="button white big round">NOTICE</a>
    			<a href="#" class="button white big round">Q&A</a>
    			<a href="#" class="button white big round">INFORMATION</a>
    			<a href="#" class="button white big round">MEMBERSHIP</a>
    			<a href="#" class="button white big round">HOW TO USE?</a>
    			</div>
    			<div class="row" align="center" style="padding-top:40px;">
    			<th class="boarddefault" scope="row"><img src="img/insertboard/qaboard.PNG" alt="기본설정"/></th>
    			</div>
			</div>
    		
              </div>
		
		
			<form action="insert.do" name=myform style="padding-top:0px;">

<!-- 					등록버튼 시작 -->
<!-- 					<div id="BoardAll_list_add_button_table"> -->
<!-- 						<div class="BoardAll_list_add_button"> -->
<!-- 							<p class="add_button">등록</p> -->
							
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					등록버튼 종료 -->
					
					<!-- table 시작 -->
				<div class="BoardAll_list_table">
					<table class="list_table">
						<colgroup>
								<col width="10%" />
								<col width="20%" />
								<col width="40%" />
								<col width="20%" />
								<col width="10%" />
							</colgroup>
					<tr>
						<td width=50><p align=center><h1>번호</h1></p></td>
						<td width=100><p align=center><h1>작성자</h1></p></td>
						<td width=320><p align=center><h1>제목</h1></p></td>
						<td width=160><p align=center><h1>등록일</h1></p></td>
						<td width=100><p align=center><h1>조회수</h1></p></td>
					</tr> 
					<%
						for (Board res : sm) {
					%>
					<tr>
						<td><p align=center><%=res.getBoardNo()%></p></td>
						<td><p align=center><%=res.getName()%></p></td>
						<td><p align=center><a href="find.do?boardno=<%=res.getBoardNo()%>"><%=res.getTitle()%></p></td>
						<td><p align=center><%=res.getInsertDate()%></p></td>
						<td><p align=center><%=res.getHits()%></p></td>
					</tr>
					<%
						}
					%>
		
				</table>
				<!-- table 끝 -->
				<input class="newbutton" type="submit" value="WRITE">
			</form>
		</div>
		
		<div align="center" class="bopageno" style="margin-top: 40px; text-align: center;">
		    <input type="hidden" name="pageNo" /><!-- //페이지 번호 -->
		    <input type="hidden" name="searchFiled" value="${pageVO.searchFiled }" /><!-- //검색조건 -->
		    <input type="hidden" name="searchValue" value="${pageVO.searchValue }" /><!-- //검색어 -->
		    
			<div id="wrap">
			    <div id="page">
				    <c:if test="${pageVO.pageNo != 0}">
				        <c:if test="${pageVO.pageNo > pageVO.pageBlock}">
				            <a href="anotherList.do?number=${pageVO.firstPageNo}" style="text-decoration: none;">[첫 페이지]</a>
				    	</c:if>
						<c:if test="${pageVO.pageNo != 1}">
				           <a href="anotherList.do?number=${pageVO.prevPageNo}" style="text-decoration: none;">[이전]</a>
				        </c:if>
				        <span>
				            <c:forEach var="i" begin="${pageVO.startPageNo}" end="${pageVO.endPageNo}" step="1">
				                <c:choose>
				                    <c:when test="${i eq pageVO.pageNo}">
				                        <a href="anotherList.do?number=${i}" style="text-decoration: none;">
				
				                            <font style="font-weight: bold;">${i}</font>
				
				                        </a>
				                    </c:when>

				                    <c:otherwise>
				                        <a href="anotherList.do?number=${i}" id="pageno" style="text-decoration: none;">${i}
				                        
				                        </a>
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
				        </span>
				        <c:if test="${pageVO.pageNo != pageVO.finalPageNo }">
				            <a href="anotherList.do?number=${pageVO.nextPageNo}" style="text-decoration: none;">[다음]</a>
				        </c:if>
				        <c:if test="${pageVO.endPageNo < pageVO.finalPageNo }">
				            <a href="anotherList.do?number=${pageVO.finalPageNo}" style="text-decoration: none;">[마지막 페이지]</a>
				        </c:if>
				   </c:if>
				
				<form  method="post" action="searchList.do" >	
					<select name ="searchf">
						<option value=""></option>
						<option value="name">작성자</option>
						<option value="titlecont">제목+내용</option>	
					</select>
			        <input type="text" name="searchv"/>
			        <input type="submit" value="search">
		        </form>  
		        </div>
			</div>
		</div>
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