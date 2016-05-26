<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookingEntity" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<pre>
		<form action="bookingInput.do">
			
			예약번호 : <input type="text" name="bookingno"/>
			회원번호 : <input type="text" name="memberno"/>
			휴대폰번호 : <input type="text" name="phonenumber"/>
			시간번호 : <input type="text" name="timeno"/>
			영화코드 : <input type="text" name="movieCd"/>
			영화관ID: <input type="text" name="cinemaID"/>
			스크린ID: <input type="text" name="screenID"/>
			
			<input type="submit" value="ok">
			<input type="reset" value="cancle"/>
		</form>
	</pre>
</body>
</html>