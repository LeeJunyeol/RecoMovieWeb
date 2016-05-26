<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	//배달한 값을 찾아서 출력
		ArrayList<CinemaEntity> cinemafind = (ArrayList<CinemaEntity>) request.getAttribute("cinemaFind");
	%>
	<form action="cinemaUpdate.do">
		<table border=1 width="90%">
			<tr>
				<th>영화관ID</th>
				<th>영화관</th>
				<th>브랜드</th>
				<th>위치</th>		
			</tr>
			<%	
				int i=0;
				for (CinemaEntity res : cinemafind) {
			%>
				<tr>
					<td><input type="text" value="<%=res.getCinemaID()%>" readonly="readonly" name="cinemaList[<%=i%>].cinemaID"></td>
					<td><input type="text" value="<%=res.getCinemaVO().getCinemaname()%>" name="cinemaList[<%=i%>].cinemaVO.cinemaname"/></td>
					<td><input type="text" value="<%=res.getCinemaVO().getBrand()%>" name="cinemaList[<%=i%>].cinemaVO.brand"></td>
					<td><input type="text" value="<%=res.getCinemaVO().getLoc()%>" name="cinemaList[<%=i%>].cinemaVO.loc"></td>				 
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
