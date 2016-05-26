<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>예약 메인</title>
</head>
<body>
	<%	//배달한 값을 찾아서 출력
		ArrayList<BookingEntity> bookingfind = (ArrayList<BookingEntity>) request.getAttribute("bookingFind");
	%>
	<form action="bookingUpdate.do">
		<table border=1 width="90%">
			<tr>
				<th>시간번호</th>
				<th>영화날짜</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>상영회차</th>
				<th>영화관ID</th>
				<th>스크린ID</th>
				<th>영화코드</th>
			</tr>
			<%
				int i=0;
				for (BookingEntity book : bookingfind) {
			%>
				<tr>
					<td><input type="text" value="<%=book.getBookingno()%>" readonly="readonly" name="bookingList[<%=i%>].bookingno"></td>
					<td><input type="text" value="<%=book.getBvo().getMemberno()%>" name="bookingList[<%=i%>].bvo.memberno"></td>
					<td><input type="text" value="<%=book.getBvo().getPhonenumber()%>" name="bookingList[<%=i%>].bvo.phonenumber"></td>
					<td><input type="text" value="<%=book.getBvo().getTimeno()%>" name="bookingList[<%=i%>].bvo.timeno"></td>
					<td><input type="text" value="<%=book.getBvo().getMovieCd()%>" name="bookingList[<%=i%>].bvo.movieCd"></td>
					<td><input type="text" value="<%=book.getBvo().getCinemaID()%>" name="bookingList[<%=i%>].bvo.cinemaID"></td>
					<td><input type="text" value="<%=book.getBvo().getScreenID()%>" name="bookingList[<%=i%>].bvo.screenID"></td>
				</tr>
			<%
					i++;
				}
			%>
			<tr>
				<td align="center" colspan="7"> <input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
</body>
</html>