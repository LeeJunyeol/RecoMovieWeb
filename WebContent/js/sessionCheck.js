$(document).ready(function(){
	$.post("SessionCheck.do",
			{},
			function(data, status){
				if(data == "sessionNull") {	// 로그인 X 
					$('#navbar-item1').html('<a href="memberlogin.do" class="login-link">Login</a>');
		      		$('#navbar-item2').html('<a href="memberjoin.do" class="Join-link">Join</a>');
		      		$("#navbar-item3").html('<a href="recommend.do" id="recommend-link" class="recommend-link">recommend</a>');
					$("#navbar-item4").html('<a href="movie.do" id="movie-link" class="movie-link">Movie</a>');
					$("#navbar-item5").html('<a href="about.do" id="member-link" class="member-link">About</a>');
					$("#navbar-item6").html('<a href="reservation.do" id="cinema-link" class="cinema-link">REServation</a>');
					$("#navbar-item7").html('<a href="team.do" id="booking-link" class="booking-link">team</a>');
					$("#navbar-item8").html('<a href="AllList.do" id="timetable-link" class="timetable-link">BOARD</a>');
				} 
				else if(data == "admin") { // 관리자 로그인
					$("#navbar-item1").html('<a href="memberlogout.do" id="logout-link" class="logout-link">logout</a>');
					$("#navbar-item2").html('<a href="mybookingstat.do" id="myPage-link" class="myPage-link">myPage</a>');
					$("#navbar-item3").html('<a href="goScreenAdm.do" id="recommend-link" class="recommend-link">Screen</a>');
					$("#navbar-item4").html('<a href="goMemberAdm.do" id="member-link" class="member-link">Member</a>');
					$("#navbar-item5").html('<a href="goMovieAdm.do" id="movie-link" class="movie-link">Movie</a>');
					$("#navbar-item6").html('<a href="goCinemaAdm.do" id="cinema-link" class="cinema-link">Cinema</a>');
					$("#navbar-item7").html('<a href="goBookingAdm.do" id="booking-link" class="booking-link">Booking</a>');
					$("#navbar-item8").html('<a href="goTimeAdm.do" id="timetable-link" class="timetable-link">Time-Table</a>');
				} 
				else { // 일반회원 로그인 
					$("#navbar-item1").html('<a href="memberlogout.do" id="logout-link" class="logout-link">logout</a>');
					$("#navbar-item2").html('<a href="mybookingstat.do" id="myPage-link" class="myPage-link">myPage</a>');
					$("#navbar-item3").html('<a href="recommend.do" id="recommend-link" class="recommend-link">recommend</a>');
					$("#navbar-item4").html('<a href="movie.do" id="movie-link" class="movie-link">Movie</a>');
					$("#navbar-item5").html('<a href="about.do" id="member-link" class="member-link">About</a>');
					$("#navbar-item6").html('<a href="reservation.do" id="cinema-link" class="cinema-link">REServation</a>');
					$("#navbar-item7").html('<a href="team.do" id="booking-link" class="booking-link">team</a>');
					$("#navbar-item8").html('<a href="AllList.do" id="timetable-link" class="timetable-link">BOARD</a>');
					
				} 
		});//ends $.post
})
