<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.CinemaEntity"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
	   <form action="cinemaInput.do">
			영화관ID  : <input type="text" name="cinemaID"/> 
			영화관 : <input type="text" name="cinemaname"/>
			브랜드 : <input type="text" name="brand"/>
			위치 : <input type="text" name="loc"/>
	        
	        <input type="submit" value="ok"> 
	        <input type="reset" value="cancel"/>  
	     </form>
	</pre>
</body>
</html>