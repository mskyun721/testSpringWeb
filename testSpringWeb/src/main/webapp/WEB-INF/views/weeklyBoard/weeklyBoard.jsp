<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var firstDay = new Date(year+'-'+month+'-01').getDay();
	
	for(i=0; i<5 ; i++){
		year = today.getFullYear()-2+i;
		if (year == today.getFullYear()) {
			$('#year').append("<option value='"+year+"' selected>"+year+"</option>");
		}else{
			$('#year').append("<option value='"+year+"'>"+year+"</option>");
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
								<th>업무기간</th>
								<th>담당자</th>
								<th>직급</th></tr>
						</thead>
						<tbody>
							<tr><td>1</td>
								<td>yyyy-mm-dd ~ yyyy-mm-dd</td>
								<td>xxx</td>
								<td>xx</td></tr>
							<tr><td>2</td>
								<td>yyyy-mm-dd ~ yyyy-mm-dd</td>
								<td>xxx</td>
								<td>xx</td></tr>
							<tr><td>3</td>
								<td>yyyy-mm-dd ~ yyyy-mm-dd</td>
								<td>xxx</td>
								<td>xx</td></tr>
							<tr><td>4</td>
								<td>yyyy-mm-dd ~ yyyy-mm-dd</td>
								<td>xxx</td>
								<td>xx</td></tr>
							<tr><td>5</td>
								<td>yyyy-mm-dd ~ yyyy-mm-dd</td>
								<td>xxx</td>
								<td>xx</td></tr>
							<tr><td>6</td>
								<td>yyyy-mm-dd ~ yyyy-mm-dd</td>
								<td>xxx</td>
								<td>xx</td></tr>
							<tr><td>7</td>
								<td>yyyy-mm-dd ~ yyyy-mm-dd</td>
								<td>xxx</td>
								<td>xx</td></tr>
						</tbody>
					</table>
				</div><!-- TaskTable end -->
			</div><!-- row1_1 end -->
			<div class="floatLeft">
				<div class="marginLeft_20">
					<button id="">저장</button>&nbsp;
					<button id="">삭제</button>&nbsp;
					<button id="">취소</button>
				</div>
				<div id="weeklyWriteForm">
					<form>
						<div class="formRow">
							<div class="lbWidth"><label>업무기간</label></div>
							<input type="date" name="wwt_date"> ~ <input type="date" name="wwt_date">
						</div>
						<div class="formRow">
							<div class="lbWidth"><label>직급</label></div>
							<input type="text" name="wwt_rank" id="wwt_rank" size="15">
						</div>
						<div class="formRow">
							<div class="lbWidth"><label>이름</label></div>
							<input type="text" name="wwt_writer" id="wwt_writer" size="15">
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop"><label>처리내용 </label></div>
							<textarea rows="15" cols="70"></textarea>
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop lbWord-break"><label>특이사항 및 수정사항</label></div>
							<textarea rows="5" cols="70"></textarea>
						</div>
						<div class="formRow">
							<div class="lbWidth verticalTop"><label>비고</label></div>
							<textarea rows="5" cols="70"></textarea>
						</div>
					</form>
				</div>
			</div>
			<div class="clear"></div>
		</div><!-- row1 end -->
	</div><!-- content end -->
</div><!-- wrap end -->
</body>
</html>