<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
<%
	String title = request.getParameter("movieNmEn");
	Runtime.getRuntime().exec("python /home/junyeol/ProjectWork/MovieRecommendProjectJDBC/WebContent/WEB-INF/finalcloud.py "+title);
%>
</script>
</head>
<body>
	<%
		System.out.println("exepython.jsp");
    %>
	<img src="cloudimg/<%=title%>.png" />
</body>
</html>