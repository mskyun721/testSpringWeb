<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNSOFT</title>
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css">
<link href="../resources/css/print.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	
	
	$("[id^=trRow]").click(function () {
		
		var id = $(this).attr("id");
		var num = id.replace("trRow","");
		var yearWeek = $('#yearWeek'+num).text();
		var userID = $('#userID'+num).val();
		$.ajax({
			url:"showReport",
			type:"get",
			data:{YEARWEEK:yearWeek,
					USERID:userID},
			success:function(data){
				$('#YEARWEEK').val(data.yearweek);
				$('#USERID').val(data.userId);
				$('#JOBGRADE').val(data.grade);
				$('#USERNM').val(data.userNm);
				$('#WEEKWORKCONT').text(data.cont);
				$('#WEEKPS').text(data.ps);
				$('#REMARK').text(data.remark);
				$('#STWEEKDAY').text(data.stweek);
				$('#LTWEEKDAY').text(data.ltweek);
			}
		});
	});
	
	$('#STWEEKDAY').change(function(){
		var date = $('#STWEEKDAY').val();
		$.ajax({
			url:"yearOfWeek",
			type:"get",
			data:{stdate:date},
			success:function(data){
				$('#YEARWEEK').val(data.week);
				$('#LTWEEKDAY').val(data.friday);
			}
		});
	});
	
	$('#delBtn').click(function(){
		var yearWeek = $('#YEARWEEK').val();
		var userId = $('#USERID').val();
		$.ajax({
			url:"delWeekwrkhis",
			type:"get",
			data:{YEARWEEK:yearWeek,
					USERID:userId},
			success:function(data){
				window.location.reload();
			}
		});
	});
	
});
</script>
</head>
<body>
<div id="wrap">
	<!-- header -->
	<%-- <jsp:include page="../inc/header.jsp"/> --%>
	<!-- header -->
	<!-- sidebar -->
	<jsp:include page="../inc/sidebar.jsp"/>
	<!-- sidebar -->
	<div id="content">
		
		<div id="row1" class="printNone">
			<div id="title">
				<h3>주간 업무일지</h3>
			</div>
			<div class="floatLeft ">
				<div id="searchBox">
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
				<div class="marginLeft_100 marginTop_10">
					<table class="table450">
						<thead>
							<tr><th>No.</th>
								<th>업무주차</th>
								<th>담당자</th>
								<th>직급</th></tr>
						</thead>
						<tbody>
							<c:forEach items="${weeklyList }" var="list" varStatus="i">
							<tr id="trRow${i.index }" class="hover_link"><td>${i.index+1 }</td>
								<td id="yearWeek${i.index }">${list.YEARWEEK }주차</td>
								<td>${list.USERNM }
								<input type="hidden" id="userID${i.index }" value="${list.USERID }"></td>
								<td>${list.JOBGRADE }</td></tr>
							</c:forEach>
						</tbody>
					</table>
				</div><!-- TaskTable end -->
			</div>
			<div class="floatLeft">
				<form action="/sunsoft/weeklyBoard/insertBoard" method="post">
					<div class="marginLeft_20 ">
						<button type="submit">저장</button>&nbsp;
						<button type="button" id="delBtn">삭제</button>&nbsp;
						<button type="button" onclick="location.reload();">취소</button>&nbsp;
						<button type="button" onclick="window.print();">출력</button>
					</div>
					<div id="weeklyWriteForm">
						<div class="formRow">
							<div class="lbWidth"><label>업무주차</label></div>
							<input type="text" readonly="readonly" name="YEARWEEK" size="2" value="${week }" id="YEARWEEK">
						</div>
						<div class="formRow">
							<div class="lbWidth"><label>업무기간</label></div>
							<input type="date" name="STWEEKDAY" value="${monday }" id="STWEEKDAY"> ~ <input type="date" name="LTWEEKDAY" value="${friday }" id="LTWEEKDAY">
						</div>
						<div class="formRow">
							<div class="lbWidth"><label>직급</label></div>
							<input type="text" name="JOBGRADE" value="${sessionScope.JOBGRADE }" size="15" id="JOBGRADE">
						</div>
						<div class="formRow">
							<div class="lbWidth"><label>이름</label></div>
							<input type="text" name="USERNM" value="${sessionScope.USERNM }" size="15" id="USERNM">
							<input type="hidden" name="USERID" value="${sessionScope.USERID }" id="USERID">
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop"><label>처리내용 </label></div>
							<textarea rows="25" cols="70" name="WEEKWORKCONT" id="WEEKWORKCONT"></textarea>
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop lbWord-break"><label>특이사항 및 수정사항</label></div>
							<textarea rows="10" cols="70" name="WEEKPS" id="WEEKPS"></textarea>
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop"><label>비고</label></div>
							<textarea rows="5" cols="70" name="REMARK" id="REMARK"></textarea>
						</div>
					</div>
				</form>
			</div>
			<div class="clear"></div>
		</div><!-- row1 end -->
		<div class="webNone">
			<h1>주간업무일지</h1>
			<table class="floatRight">
				<tr><td rowspan="2">결재</td>
					<td width="70">담당자</td>
					<td width="70">과장</td>
					<td width="70">차장</td>
					<td width="70">차장</td>
					<td width="70">사장</td></tr>
				<tr><td height="50"></td>
					<td height="50"></td>
					<td height="50"></td>
					<td height="50"></td>
					<td height="50"></td></tr>
			</table>
			<div class="hiddenBlock"></div>
			<div>
				<table class="print_table marginTop_100">
					<tr height="20"><td>업무기간</td>
						<td>20년 08월 31일 ~ 20년 08월 31일</td>
						<td>직급</td>
						<td>대리</td>
						<td>성명</td>
						<td>문성균</td></tr>
					<tr height="500"><td><pre>업무<br>진행<br>현황</pre></td>
						<td colspan="5"></td></tr>
					<tr height="150"><td><pre>특이사항<br>및<br>수정요구</pre></td>
						<td colspan="5"></td></tr>
					<tr height="100"><td><pre>비고</pre></td>
						<td colspan="5"></td></tr>
				</table>
			</div>
		</div><!-- print webNone end -->
	</div><!-- content end -->
</div><!-- wrap end -->
</body>
</html>