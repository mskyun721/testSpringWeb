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
		var week = $('#start'+num).text().split(' ~ ');
		var user = $('#user'+num).text(); 
		var start = week[0].trim();
		var end = week[1].trim();
		$.ajax({
			url:"showReport",
			type:"get",
			data:{STARTWEEK:start,
					ENDWEEK:end,
					USERNM:user},
			success:function(data){
				$('#STARTWEEK').val(data.start);
				$('#ENDWEEK').val(data.end);
				$('#JOBGRADE').val(data.grade);
				$('#USERNM').val(data.user);
				$('#CONTENT').text(data.content);
				$('#PS').text(data.ps);
				$('#REMARK').text(data.remark);
			}
		});
	});
	
	
	/* $('#delBtn').click(function () {
		var startweek = 
	}); */
	
});
</script>
</head>
<body>
<div id="wrap">
	<!-- header -->
	<jsp:include page="../inc/header.jsp"/>
	<!-- header -->
	<div id="content">
		<!-- sidebar -->
		<jsp:include page="../inc/sidebar.jsp"/>
		<!-- sidebar -->
		<div id="row1">
			<div id="title">
				<h3>주간 업무일지</h3>
			</div>
			<div class="floatLeft">
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
								<td id="start${i.index }">${list.STARTWEEK } ~ ${list.ENDWEEK }</td>
								<td id="user${i.index }">${list.USERNM }</td>
								<td>${list.JOBGRADE }</td></tr>
							</c:forEach>
						</tbody>
					</table>
				</div><!-- TaskTable end -->
			</div>
			<div class="floatLeft">
				<form action="/sunsoft/weeklyBoard/insertBoard" method="post">
					<div class="marginLeft_20">
						<button type="submit">저장</button>&nbsp;
						<button type="button" id="delBtn">삭제</button>&nbsp;
						<button type="reset" id="">취소</button>
					</div>
					<div id="weeklyWriteForm">
						<div class="formRow">
							<div class="lbWidth"><label>업무주차</label></div>
							<input type="text" readonly="readonly" size="2">
						</div>
						<div class="formRow">
							<div class="lbWidth"><label>업무기간</label></div>
							<input type="date" name="STARTWEEK" value="${date }" id="STARTWEEK"> ~ <input type="date" name="ENDWEEK" value="${date }" id="ENDWEEK">
						</div>
						<div class="formRow">
							<div class="lbWidth"><label>직급</label></div>
							<input type="text" name="JOBGRADE" value="${sessionScope.JOBGRADE }" size="15" id="JOBGRADE">
						</div>
						<div class="formRow">
							<div class="lbWidth"><label>이름</label></div>
							<input type="text" name="USERNM" value="${sessionScope.USERNM }" size="15" id="USERNM">
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop"><label>처리내용 </label></div>
							<textarea rows="20" cols="70" name="CONTENT" id="CONTENT"></textarea>
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop lbWord-break"><label>특이사항 및 수정사항</label></div>
							<textarea rows="10" cols="70" name="PS" id="PS"></textarea>
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
	</div><!-- content end -->
</div><!-- wrap end -->
</body>
</html>