<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시간표 메인</title>
</head>
<body>
	<%	//배달한 값을 찾아서 출력
		ArrayList<TimeEntity> timefind = (ArrayList<TimeEntity>) request.getAttribute("timeFind");
	%>
	<form action="timeUpdate.do">
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
				for (TimeEntity time : timefind) {
			%>
				<tr>
					<td><input type="text" value="<%=time.getTimeno()%>" readonly="readonly" name="timeList[<%=i%>].timeno"></td>
					<td><input type="text" value="<%=time.getTimeVO().getS_date()%>" name="timeList[<%=i%>].timeVO.s_date"></td>
					<td><input type="text" value="<%=time.getTimeVO().getE_date()%>" name="timeList[<%=i%>].timeVO.e_date"></td>
					<td><input type="text" value="<%=time.getTimeVO().getStartTime()%>" name="timeList[<%=i%>].timeVO.startTime"></td>
					<td><input type="text" value="<%=time.getTimeVO().getCount()%>" name="timeList[<%=i%>].timeVO.count"></td>
					<td><input type="text" value="<%=time.getTimeVO().getCinemaID()%>" name="timeList[<%=i%>].timeVO.cinemaID"></td>
					<td><input type="text" value="<%=time.getTimeVO().getScreenID()%>" name="timeList[<%=i%>].timeVO.screenID"></td>
					<td><input type="text" value="<%=time.getTimeVO().getMovieCd()%>" name="timeList[<%=i%>].timeVO.movieCd"></td>
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