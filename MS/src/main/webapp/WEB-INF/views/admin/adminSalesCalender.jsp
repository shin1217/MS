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

.sales_ModalTable {
	border: 1px !important;
	border-color: black !important;
	border-style: solid !important;
	width: 110px !important;
}

</style>

</head>
<body>
<div class="container" style="width:712px;">
	
	<table>
		<thead>
			<tr bgcolor="#CECECE">
				<td width="100px" height="40px">
					<div align="center" style="font-weight: bold;"><font color="red">일</font></div>
				</td>
				<td width="100px" height="40px">
					<div align="center" style="font-weight: bold;">월</div>
				</td>
				<td width="100px" height="40px">
					<div align="center" style="font-weight: bold;">화</div>
				</td>
				<td width="100px" height="40px">
					<div align="center" style="font-weight: bold;">수</div>
				</td>
				<td width="100px" height="40px">
					<div align="center" style="font-weight: bold;">목</div>
				</td>
				<td width="100px" height="40px">
					<div align="center" style="font-weight: bold;">금</div>
				</td>
				<td width="100px" height="40px">
					<div align="center" style="font-weight: bold;"><font color="#529DBC">토</font></div>
				</td>
			</tr>
		</thead>
		
		<tbody>
		
				<%-- <fmt:formatDate value="${sales.sales_day}" type pattern="yyyyMMdd" /> --%>
			
				<tr>
					<c:forEach var="i" begin="1" end="${ start }">
						<td width="100px" height="80px" valign="top" align="left" nowrap></td>
						<c:set var="newLine" value="${newLine + 1}" />
					</c:forEach>
					
					<c:forEach var="i" begin="1" end="${ endDay }">
						<c:set var="index" value="${index + 1}"></c:set>
						
						<c:choose> 
							<c:when test="${((i-(8-firstDayOfWeek)) % 7) == 1}"> 
									<td width="100px" height="80px" valign="top" align="left" nowrap>
									<p><font style="font-weight: bold; color: RED;">${ index }</font></p>
									<p><font style="font-weight: bold; color: GRAY;">
									<a data-target="#layerpop" data-toggle="modal" id="indexId${ index }" value="${ index }" class="salesText">
									
									<c:set var="total" value="0"></c:set>
									
									<c:forEach items="${ salesList }" var="sales">
										<c:if test="${ index eq sales.sales_day }">
											<%-- 총 매출 : ${ sales.sales_total }
											음식 매출 : ${ sales.sales_food }
											좌석 매출 : ${ sales.sales_seat } --%>
											<c:set var="total" value="${total + sales.sales_total}"></c:set>
										</c:if>
									</c:forEach>
										총 매출 : <c:out value="${total }"></c:out>
									</a></font></p></td>
							</c:when> 
							<c:when test="${((i-(8-firstDayOfWeek)) % 7) == 0}"> 
									<td width="100px" height="80px" valign="top" align="left" nowrap>
									<p><font style="font-weight: bold; color: #529DBC;">${ index }</font></p>
									<p><font style="font-weight: bold; color: GRAY;">
									<a data-target="#layerpop" data-toggle="modal" id="indexId${ index }" value="${ index }" class="salesText">
									
									<c:set var="total" value="0"></c:set>
									
									<c:forEach items="${ salesList }" var="sales">
										<c:if test="${ index eq sales.sales_day }">
											<%-- 총 매출 : ${ sales.sales_total }
											음식 매출 : ${ sales.sales_food }
											좌석 매출 : ${ sales.sales_seat } --%>
											<c:set var="total" value="${total + sales.sales_total}"></c:set>
										</c:if>
									</c:forEach>
										총 매출 : <c:out value="${total }"></c:out>
									</a></font></p></td>
							</c:when> 
							<c:otherwise> 
									<td width="100px" height="80px" valign="top" align="left" nowrap>
									<p><font style="font-weight: bold; color: BLACK;">${ index }</font></p>
									<p><font style="font-weight: bold; color: GRAY;">
									<a data-target="#layerpop" data-toggle="modal" id="indexId${ index }" value="${ index }" class="salesText">
									
									<c:set var="total" value="0"></c:set>
									
									<c:forEach items="${ salesList }" var="sales">
										<c:if test="${ index eq sales.sales_day }">
											<%-- 총 매출 : ${ total }
											음식 매출 : ${ sales.sales_food }
											좌석 매출 : ${ sales.sales_seat } --%>
											<c:set var="total" value="${total + sales.sales_total}"></c:set>
										</c:if>
									</c:forEach>
										총 매출 : <c:out value="${total }"></c:out>
									</a></font></p></td>
							</c:otherwise> 
						</c:choose>
						
							<%-- <c:if test="${ intToday eq sales.sales_day }">
							${ sales.sales_total }
							</c:if> --%>
							
						<c:if test="${((i-(8-firstDayOfWeek)) % 7) == 0}">
							<tr>
							</tr>
						</c:if>
						
					</c:forEach>
					
					<c:if test="${ lastDayOfLastWeek != '7' }">
						<c:forEach var="i" begin="1" end="${ 7-lastDayOfLastWeek }">
							<td width="100px" height="80px" valign="top" align="right" nowrap>
							</td>
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
	<h1>${lastDayOfLastWeek}</h1>
	<h1>${firstDayOfWeek}</h1>
	<h1>${date }</h1>
	
</div>


<!-- 모달 창 -->

<div class="modal fade" id="layerpop" >
	<div class="modal-dialog">
		<div class="modal-content">
		
			<!-- header -->
			<div class="modal-header">
				<!-- header title -->
				<h4 class="modal-title">세부 매출 기록</h4>
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			
			<!-- body -->
			<div id="salesViewText" class="modal-body">
			<input id="getText"></input>
			<table>
				<thead>
					<tr>
						<th class="sales_ModalTable" style="text-align: center;">판매 번호</th>
						<th class="sales_ModalTable" style="text-align: center;">총 매출</th>
						<th class="sales_ModalTable" style="text-align: center;">음식 매출</th>
						<th class="sales_ModalTable" style="text-align: center;">좌석 매출</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="Sales">
						<script>document.write(getText);</script>
					</c:set>
					<c:out value="${ pageScope.Sales }" ></c:out>
					<c:forEach items="${salesList}" var="sales" varStatus="status">
					
					<c:if test=""></c:if>
						<tr>
							<td class="sales_ModalTable" id = "sales_id" style="text-align: center; vertical-align: middle;"></td>
							<td class="sales_ModalTable" style="text-align: center; vertical-align: middle;">${sales.sales_total}</td>
							<td class="sales_ModalTable" style="text-align: center; vertical-align: middle;">${sales.sales_food}</td>
							<td class="sales_ModalTable" style="text-align: center; vertical-align: middle;">${sales.sales_seat}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
			<%-- <c:forEach items="${ salesList }" var="sales">
					총 매출 : ${ sales.sales_total }
					음식 매출 : ${ sales.sales_food }
					좌석 매출 : ${ sales.sales_seat }
					<br>
			</c:forEach> --%>
			</div>
			
			<!-- Footer -->
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		
		var getText = '';
		
		 /* $(document).on("click",".salesText",function(){ */
		$('.salesText').click(function() {
			
			var getText = $(this).attr('value');
			alert(getText);
			
			$("#getText").val(getText);
			
		});
	
		$('.salesText').click(function() {
			var salesText = '';
			var indexId = $(this).attr('value');
			//console.log(getText);
			$.ajax({
				type : 'get',
				url : '${pageContext.request.contextPath}/admin/salesInfo/' + indexId,
				success : function(data) {
					console.log(data);
					$('#sales_id').html(data[0].sales_id);
					/* // $('#indexId').html(data.length + ' comments');
					$('#salesViewText').html('');
					$(data).each(function(index, item) {
						// $('#indexId').html(data.length + ' comments');
						salesText += '<c:forEach items="${ salesList }" var="sales">';
						salesText += '<c:if test="${ indexId eq sales.sales_day }">';
						salesText += '총 매출 : ${ sales.sales_total }';
						salesText += '음식 매출 : ${ sales.sales_food }';
						salesText += '좌석 매출 : ${ sales.sales_seat }';
						salesText += '</c:if>';
						salesText += '</c:forEach>';
					$('#salesViewText').html(salesText);
					
					});
					
					salesText = ''; */
					
					$('#indexId').val('');
				
				}
			});
		});
	});
</script>

</body>
</html>