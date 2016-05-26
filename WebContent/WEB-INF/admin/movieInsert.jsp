<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.MovieEntity"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<pre>
	   <form action="movieInput.do">
	   
	          영화코드  : <input type="text" name="movieCd"/> 
	          영 화 명  : <input type="text" name="title"/>
	          영화명(영문)  : <input type ="text" name ="titleen"/>
	          제작연도  : <input type="text" name="year"/>  
	          제작국가  : <input type="text" name="nation"/>   
	          유    형  : <input type="text" name="type"/>   
	          장    르  : <input type="text" name="genre"/>   
	          감    독  : <input type="text" name="director"/>   
	          제 작 사  : <input type="text" name="company"/>   
	          개 봉 일  : <input type="text" name="opendate"/>    
	          상영시간  : <input type="text" name="runningtime"/>   
	        
	        <input type="submit" value="ok"> 
	        <input type="reset" value="cancel"/>  
	     </form>
	</pre>
</body>
</html>