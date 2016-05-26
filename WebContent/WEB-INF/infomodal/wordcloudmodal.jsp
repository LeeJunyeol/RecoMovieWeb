<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="static com.util.Encoder.isoToUTF"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="js/jquery.js"></script>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
<%
   String title = request.getParameter("movieNm");
   try{
	   title = title.replaceAll(",", "");
	   title = title.replaceAll(" ", "");
	   int s = title.indexOf(":");
	   if(s > 0){
		   title = title.substring(0, s);
	   }
   } catch(Exception e){
	   
   }
//    System.out.println("title :" + title);
//    System.out.println("python C:\\mrp\\MovieRecommendProjectJDBC\\WebContent\\WEB-INF\\finalcloud.py "+title);
   Runtime.getRuntime().exec("python /home/junyeol/ProjectWork/MovieRecommendProjectJDBC/WebContent/WEB-INF/finalcloud.py "+title);
%>
	var title = <%=title%>;
</script>
</head>
<body>
	<h3 align="center">
		"<%=title%>"의 <font color="blue">WORD CLOUD</font>의 결과
	</h3>
	<img src="/mrp4/cloudimg/<%=title%>.jpg" width="100%" height="400px" />
	<a class="btn btn-primary" onclick="history.back()" style="width: 100px; float: right;">←BACK</a>
</body>
</html>
