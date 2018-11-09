<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<html>

<%
	Calendar cal = Calendar.getInstance();

	/* int year = cal.get(Calendar.YEAR);
	int months = cal.get(Calendar.MONTH);
	int month = months + 1;

	int date = cal.get(Calendar.DATE);

	request.setAttribute("year", year);
	request.setAttribute("month", month);
	request.setAttribute("date", date); */

	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");

	int year = cal.get(Calendar.YEAR);
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);

	if(strYear != null) {
		year = Integer.parseInt(strYear);
		month = Integer.parseInt(strMonth);
	} else {
	}
	
	//년도/월 셋팅
	cal.set(year, month, 1);

	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int newLine = 0;

	//오늘 날짜 저장.
	Calendar todayCal = Calendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
	
	request.setAttribute("year", year);
	request.setAttribute("month", month);
	request.setAttribute("date", date);
	request.setAttribute("startDay", startDay);
	request.setAttribute("endDay", endDay);
	request.setAttribute("start", start);
	request.setAttribute("newLine", newLine);
	request.setAttribute("intToday", intToday);
	
%>


<head>
<meta charset="UTF-8">
<title>매출 현황표</title>

<style type="text/css">

</style>

</head>
<body>
<div class="container" style="width:712px;">
	
	<table width="100%" border="0" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
		<thead>
			<tr bgcolor="#CECECE">
				<td width="100px">
					<div align="center"><font color="red">일</font></div>
				</td>
				<td width="100px">
					<div align="center">월</div>
				</td>
				<td width="100px">
					<div align="center">화</div>
				</td>
				<td width="100px">
					<div align="center">수</div>
				</td>
				<td width="100px">
					<div align="center">목</div>
				</td>
				<td width="100px">
					<div align="center">금</div>
				</td>
				<td width="100px">
					<div align="center"><font color="#529DBC">토</font></div>
				</td>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				
		
		
		</tbody>
		
		
		
		
		
	</table>


	
	<h1>${year }</h1>
	<h1>${month }</h1>
	<h1>${date }</h1>
	
</div>
</body>
</html>