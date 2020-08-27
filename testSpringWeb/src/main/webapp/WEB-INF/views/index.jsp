<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNSOFT</title>
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/table.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="resources/js/sidebarDrop.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	/* select option 생성 */
	var today = new Date();
	var year = $('#todayYear').val();
	var month = $('#todayMonth').val();
	var firstDay = new Date(year+'-'+month+'-01').getDay();
	
	for(i=0; i<5 ; i++){
		var optionYear = today.getFullYear()-2+i;
		if (optionYear == year) {
			$('#year').append("<option value='"+optionYear+"' selected>"+optionYear+"</option>");
		}else{
			$('#year').append("<option value='"+optionYear+"'>"+optionYear+"</option>");
		}
	}
	
	for(i=1; i<=12 ; i++){
		if (month == i) {
			$('#month').append("<option value='"+i+"' selected>"+i+"</option>");
		}else{
			$('#month').append("<option value='"+i+"'>"+i+"</option>");
		}
	}
});
</script>
</head>
<body>
<div id="wrap">
	<!-- header -->
	<%-- <jsp:include page="inc/header.jsp"/> --%>
	<!-- header -->
	<!-- sidebar -->
		<jsp:include page="inc/sidebar.jsp"/>
		<!-- sidebar -->
	<div id="content">
		
		<div id="row1">
			<div id="title">
				<h3>일정표</h3>
			</div>
			<div class="marginLeft_100 marginBottom_10">
				<form method="get">
					<select id="year" name="year" >
					</select>
					년 &nbsp;&nbsp;
					<select id="month" name="month">
					</select>
					월
					<button type="submit">조회</button>
				</form>
				<input type="hidden" id="todayYear" value="${year }">
				<input type="hidden" id="todayMonth" value="${month }">
			</div>
			<div class="marginLeft_100 floatLeft">
				<table id="calTable">
					<thead>
						<tr><th colspan="2" class="red">Sun</th>
							<th colspan="2">Mon</th>
							<th colspan="2">Tues</th>
							<th colspan="2">Wed</th>
							<th colspan="2">Thurs</th>
							<th colspan="2">Fir</th>
							<th colspan="2" class="blue">Sat</th></tr>
					</thead>
					<tbody>
						<c:forEach items="${day }" var="day1" begin="0" end="5">
							<tr>
								<c:forEach items="${day1 }" var="day2" begin="0" end="6" varStatus="i">
									<c:choose><c:set var="date" value="${year }-${month }-${day2 }"/>
										<c:when test="${i.index == 0 }">
											<td class="content red" id="${day2 }"><c:forEach items="${schList }" var="list"><c:if test="${list.SCHDATE == date }">${list.SCHCONT}</c:if></c:forEach></td>
											<td class="day red"><a href="scheduleForm?year=${year }&month=${month}&day=${day2}" 
												onclick="window.open(this.href,'_blank','width=300, height=200, left=500, top=300'); return false"
												class="red">
												${day2 }</a></td>
										</c:when>
										<c:when test="${i.index == 6 }">
											<td class="content blue" id="${day2 }"><c:forEach items="${schList }" var="list"><c:if test="${list.SCHDATE == date }">${list.SCHCONT}</c:if></c:forEach></td>
											<td class="day blue"><a href="scheduleForm?year=${year }&month=${month}&day=${day2}" 
												onclick="window.open(this.href,'_blank','width=300, height=200, left=500, top=300'); return false"
												class="blue">
												${day2 }</a></td>
										</c:when>
										<c:otherwise>
											<td class="content" id="${day2 }"><c:forEach items="${schList }" var="list"><c:if test="${list.SCHDATE == date }">${list.SCHCONT}</c:if></c:forEach></td>
											<td class="day"><a href="scheduleForm?year=${year }&month=${month}&day=${day2}" 
												onclick="window.open(this.href,'_blank','width=300, height=200, left=500, top=300'); return false">
												${day2 }</a></td>
										</c:otherwise>
									</c:choose>
								</c:forEach>
						</c:forEach>
				</table>
			</div><!-- calTable end -->
			<div class="clear"></div>
		</div><!-- row1 end -->
	</div><!-- content end -->
</div><!-- wrap end -->
</body>
</html>
