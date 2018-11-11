<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	
	// 현재 시간 지정
	
	// 년도/월 셋팅
	cal.set(year, month, 1);

	int startDay = cal.getMinimum(java.util.Calendar.DATE);
	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
	int starts = cal.get(java.util.Calendar.DAY_OF_WEEK);
	int start = starts - 1;
	int newLine = 0;
	
	int firstDayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// 해당월의 마지막일로 캘린더 설정.
	cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DAY_OF_MONTH));
	int lastDayOfLastWeek = cal.get(Calendar.DAY_OF_WEEK);
	
	// 오늘 날짜 저장.
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
	request.setAttribute("firstDayOfWeek", firstDayOfWeek);
	request.setAttribute("lastDayOfLastWeek", lastDayOfLastWeek);
	
%>


<head>
<meta charset="UTF-8">
<title>매출 현황표</title>

<style type="text/css">

</style>

</head>
<body>
<div class="container" style="width:712px;">
	
	<table width="100%" border="1" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
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
		
			<fmt:parseDate var="dateString" value="${sales.sales_day}" pattern="yyyyMMdd" />
		
			<tr>
				<c:forEach var="i" begin="1" end="${ start }">
					<td width="100px" height="80px" valign="top" align="left" nowrap></td>
					<c:set var="newLine" value="${newLine + 1}" />
				</c:forEach>
				
				<c:forEach var="i" begin="1" end="${ endDay }">
					<c:set var="index" value="${index + 1}"></c:set>
					<c:choose> 
						<c:when test="${newLine eq '0'}"> 
							<c:set var="color" value="RED"></c:set>
						</c:when> 
						<c:when test="${newLine eq '6'}"> 
							<c:set var="color" value="#529DBC"></c:set>
						</c:when> 
						<c:otherwise> 
							<c:set var="color" value="BLACK"></c:set>
						</c:otherwise> 
					</c:choose>
					
					
					
					<td width="100px" height="80px" valign="top" align="left" nowrap>
					<font color='${ color }'>${ index }</font>
					<br>
						
						
						
						
						<c:if test="${ intToday eq sales.sales_day }"></c:if>
						${ sales.sales_total }
					<br>
					</td>
					
					<c:if test="${((i-(8-firstDayOfWeek)) % 7) == 0}">
						</TR>
						<TR>
					</c:if>
					
				</c:forEach>
				
				<c:if test="${ lastDayOfLastWeek != '7' }">
					<c:forEach var="i" begin="1" end="${ 7-lastDayOfLastWeek }">
						<TD width="100px" height="80px" valign="top" align="right" nowrap>
						</TD>
					</c:forEach>
				</c:if>
				
			</tr>
		</tbody>
		
		
		
		
		
	</table>


	
	<h1>${year }</h1>
	<h1>${month }</h1>
	<h1>${date }</h1>
	<h1>${ intToday }</h1>
	<h1>${sales.sales_day}</h1>
	
</div>
</body>
</html>