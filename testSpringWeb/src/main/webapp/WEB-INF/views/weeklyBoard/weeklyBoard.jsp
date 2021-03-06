<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNSOFT</title>
<link type="text/css" href="../resources/style/default.css" rel="stylesheet">
<link type="text/css" href="../resources/style/common.css" rel="stylesheet">
<link type="text/css" href="../resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="../resources/style/design.css" rel="stylesheet">
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css">
<link href="../resources/css/print.css" rel="stylesheet" type="text/css">
<link href="../resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
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
				var arrStweek = data.stweek.split('-');
				var arrLtweek = data.ltweek.split('-');
				var date = arrStweek[0].substr(2,2)+"년 "+arrStweek[1]+"월 "+arrStweek[2]+"일 ~ "+arrLtweek[0].substr(2,2)+"년 "+arrLtweek[1]+"월 "+arrLtweek[2]+"일";
				$('#YEARWEEK').val(data.yearweek);
				$('.DATE').text(date);
				$('#USERID').val(data.userId);
				$('#JOBGRADE').val(data.grade);
				$('.JOBGRADE').text(data.grade);
				$('#USERNM').val(data.userNm);
				$('.USERNM').text(data.userNm);
				$('#WEEKWORKCONT').text(data.cont);
				$('.WEEKWORKCONT').text(data.cont);
				$('#WEEKPS').text(data.ps);
				$('.WEEKPS').text(data.ps);
				$('#REMARK').text(data.remark);
				$('.REMARK').text(data.remark);
				$('#STWEEKDAY').val(data.stweek);
				$('#LTWEEKDAY').val(data.ltweek);
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
	
	$('#month').change(function(){
		var monthVal = $(this).val();
		var yearVal = $('#year').val();
		
		location.href="/sunsoft/weeklyBoard/weeklyBoard?year="+yearVal+"&month="+monthVal;
	});
	$('#year').change(function(){
		var yearVal = $(this).val();
		var monthVal = $('#month').val();
		
		location.href="/sunsoft/weeklyBoard/weeklyBoard?year="+yearVal+"&month="+monthVal;
	});
});
</script>
</head>
<body>
<!-- header -->
<div class="printNone"><jsp:include page="../public/header.jsp"/></div>
<!-- header -->
<div class="row printNone">
	<div style="width:40%;float: left; ">
		<div class="card">
			<h3><i class="fas fa-caret-right"></i> 주간업무일지</h3>
			<hr />
			<div>
				<div>
					<form method="get">
						<select id="year" name="year" >
						</select>
						년 &nbsp;&nbsp;
						<select id="month" name="month">
						</select>
						월
					</form>
					<input type="hidden" id="todayYear" value="${year }">
					<input type="hidden" id="todayMonth" value="${month }">
				</div>
				<div>
					<table class="table100">
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
		</div>
	</div>
		
		<div style="width: 60%;float: right;">
			<div class="card">
				<form action="/sunsoft/weeklyBoard/insertBoard" method="post" class="weeklyForm">
					<div style="margin-left: 1em;">
						<button type="submit"><i class="fas fa-save" style="font-size:15px;"></i>&nbsp;&nbsp;저장</button>&nbsp;
						<button type="button" id="delBtn"><i class="fas fa-trash-alt" style="font-size:15px;"></i>&nbsp;&nbsp;삭제</button>&nbsp;
						<button type="button" onclick="location.href='/sunsoft/weeklyBoard/weeklyBoard?';return false;"><i class="fas fa-window-close" style="font-size:15px;"></i>&nbsp;&nbsp;취소</button>&nbsp;
						<button type="button" onclick="window.print();"><i class="fas fa-file-powerpoint" style="font-size:15px;"></i>&nbsp;&nbsp;출력</button>
					</div>
					<div id="weeklyWriteForm">
						<div class="formRow">
							<div class="lbWidth">&nbsp;<label>업무주차</label></div>
							<input type="text" readonly="readonly" name="YEARWEEK" size="1" value="${week }" id="YEARWEEK">
						</div>
						<div class="formRow">
							<div class="lbWidth">&nbsp;<label>업무기간</label></div>
							<input type="date" name="STWEEKDAY" value="${monday }" id="STWEEKDAY"> ~ <input type="date" name="LTWEEKDAY" value="${friday }" id="LTWEEKDAY">
						</div>
						<div class="formRow">
							<div class="lbWidth">&nbsp;<label>직급</label></div>
							<input type="text" name="JOBGRADE" value="${sessionScope.JOBGRADE }" size="15" id="JOBGRADE">
						</div>
						<div class="formRow">
							<div class="lbWidth">&nbsp;<label>이름</label></div>
							<input type="text" name="USERNM" value="${sessionScope.USERNM }" size="15" id="USERNM">
							<input type="hidden" name="USERID" value="${sessionScope.USERID }" id="USERID">
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop">&nbsp;<label>처리내용 </label></div>
							<textarea rows="30" cols="100" name="WEEKWORKCONT" id="WEEKWORKCONT"></textarea>
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop lbWord-break"><label>특이사항<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;및<br>수정사항</label></div>
							<textarea rows="5" cols="100" name="WEEKPS" id="WEEKPS"></textarea>
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop">&nbsp;<label>비고</label></div>
							<textarea rows="5" cols="100" name="REMARK" id="REMARK"></textarea>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div><!-- row end -->

		<div class="webNone marginTop_50">
			<div class="marginLeft_100"><h1>주간업무일지</h1></div><br>
			<table class="marginLeft approTable">
				<tr><td rowspan="2" style="width: 10%;">결<br>재</td>
					<td style="width: 18%;">담당자</td>
					<td style="width: 18%;">과장</td>
					<td style="width: 18%;">차장</td>
					<td style="width: 18%;">차장</td>
					<td style="width: 18%;">사장</td></tr>
				<tr><td height="50"></td>
					<td height="50"></td>
					<td height="50"></td>
					<td height="50"></td>
					<td height="50"></td></tr>
			</table>
			<div class="hiddenBlock"></div>
			<div>
				<table class="print_table">
					<tr height="40"><td width="100">업무기간</td>
						<td class="DATE" width="290"></td>
						<td width="50">직급</td>
						<td class="JOBGRADE"></td>
						<td width="50">성명</td>
						<td class="USERNM"></td></tr>
					<tr height="550"><td><pre>업 무<br><br>진 행<br><br>현 황</pre></td>
						<td colspan="5" class="dataPre"><pre class="WEEKWORKCONT dataPre"></pre></td></tr>
					<tr height="150"><td><pre>특이사항<br>및<br>수정요구</pre></td>
						<td colspan="5" class="dataPre"><pre class="WEEKPS dataPre"></pre></td></tr>
					<tr height="100"><td><pre>비 고</pre></td>
						<td colspan="5" class="dataPre"><pre class="REMARK dataPre"></pre></td></tr>
				</table>
			</div>
		</div><!-- print webNone end -->
<!-- footer -->
<div class="printNone"><jsp:include page="../public/footer.jsp"/></div>
<!-- footer -->
</body>
</html>