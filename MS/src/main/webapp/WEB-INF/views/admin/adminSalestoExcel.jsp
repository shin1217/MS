<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%
    SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);
    String today = format.format(new Date());
    String days = request.getParameter("days");
    String fileName = "매출현황" + today + "." + days;
      response.setHeader("Content-Type", "application/vnd.ms-xls");
    response.setHeader("Content-Disposition",
            "attachment; filename=" + new String((fileName).getBytes("KSC5601"), "8859_1") + ".xls");
%>

<!DOCTYPE html>
<html lang="ko" style="overflow: hidden">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>엑셀 다운로드</title>
</head>
<body>
	
<table style="text-align: center;">
	<thead>
		<tr>
			<th class="sales_hidden">판매시간</th>
			<th class="sales_hidden">판매번호</th>
			<th class="sales_hidden">종합매출</th>
			<th class="sales_hidden">음식매출</th>
			<th class="sales_hidden">좌석매출</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${ salesList }" var="sales">
			<c:if test="${ storeSelectSession.store_id eq sales.store_id }">
				<c:if test="${ nowMonth eq sales.salesMonth }">
					<tr>
						<td class="sales_hidden">${ sales.salesTime }</td>
						<td class="sales_hidden">${ sales.sales_id }</td>
						<td class="sales_hidden">${ sales.sales_total }</td>
						<td class="sales_hidden">${ sales.sales_food }</td>
						<td class="sales_hidden">${ sales.sales_seat }</td>
					</tr>
				</c:if>
			</c:if>
		</c:forEach>
	</tbody>
</table>

<button id="exportToExcel" onclick="exportToExcel()"
    style="z-index: 1110; background: rgb(142, 31, 31); 
float: right; margin-bottom: 16px; 
margin-top: 16px; margin-right: 16px; 
display: block;"
    class="mdl-button mdl-js-button mdl-button--fab"
    data-toggle="modal" data-target="#myModal">
    <i class="material-icons">save</i>
</button>

</body>

<script>
    function exportToExcel() {
        console.log("click");
        location.href= "./adminSalestoExcel";
        
    }
</script>

</html>