<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.TimeEntity" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<pre>
		<form action="timeInput.do">
			
			시간번호 : <input type="text" name="timeno"/>
			영화날짜 : <input type="text" name="day"/>
			시작시간 : <input type="text" name="starttime"/>
			종료시간 : <input type="text" name="endtime"/>
			상영회차 : <input type="text" name="count"/>
			영화관ID: <input type="text" name="cinemaID"/>
			스크린ID: <input type="text" name="screenID"/>
			영화코드: <input type="text" name="movieCD"/>	
		
			<input type="submit" value="ok">
			<input type="reset" value="cancle"/>
		</form>
	</pre>
</body>
</html>