<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	//배달한 값을 찾아서 출력
		ArrayList<MovieEntity> moviefind = (ArrayList<MovieEntity>) request.getAttribute("movieFind");
	%>
	<form action="movieUpdate.do">
		<table border=1 width="90%">
			<tr>
				<th>영화코드</th>
				<th>영화명</th>
				<th>영화명(영문)</th>
				<th>제작연도</th>
				<th>제작국가</th>
				<th>유형</th>
				<th>장르</th>
				<th>감독</th>
				<th>제작사</th>
				<th>개봉일</th>
				<th>상영시간</th>			
			</tr>
			<%
				int i=0;
				for (MovieEntity res : moviefind) {	
			%>
				<tr>
					<td><input type="text" value="<%=res.getMovieCd()%>" readonly="readonly" name="movieList[<%=i%>].movieCd"></td>
					<td><input type="text" value="<%=res.getMovo().getTitle()%>" name="movieList[<%=i%>].movo.title"/></td>
					<td><input type="text" value="<%=res.getMovo().getTitleen()%>" name="movieList[<%=i%>].movo.titleen"></td>
					<td><input type="text" value="<%=res.getMovo().getYear()%>" name="movieList[<%=i%>].movo.year"></td>
					<td><input type="text" value="<%=res.getMovo().getNation()%>" name="movieList[<%=i%>].movo.nation"></td>
					<td><input type="text" value="<%=res.getMovo().getType()%>" name="movieList[<%=i%>].movo.type"></td>
					<td><input type="text" value="<%=res.getMovo().getGenre()%>" name="movieList[<%=i%>].movo.genre"></td>
					<td><input type="text" value="<%=res.getMovo().getDirector()%>" name="movieList[<%=i%>].movo.director"></td>
					<td><input type="text" value="<%=res.getMovo().getCompany()%>" name="movieList[<%=i%>].movo.company"></td>
					<td><input type="text" value="<%=res.getMovo().getOpendate()%>" name="movieList[<%=i%>].movo.opendate"></td>
					<td><input type="text" value="<%=res.getMovo().getRunningtime()%>" name="movieList[<%=i%>].movo.runningtime"></td>					 
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
