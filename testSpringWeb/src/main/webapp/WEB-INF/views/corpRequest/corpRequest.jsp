<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNSOFT</title>
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css">
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
		
		<div id="row1">
			<div id="title">
				<h3>업체 요청 사항</h3>
			</div>
			<div class="floatLeft">
				<div id="searchBox">
					<form action="">
						<input type="text" size="15">&nbsp;<button>검색</button>
					</form>
				</div>
				<div class="marginLeft_100">
					<table class="table1100">
						<thead>
							<tr><th>No.</th>
								<th>날짜</th>
								<th>거래처명</th>
								<th>담당자</th>
								<th>요청자</th>
								<th>승인여부</th>
								<th>완료여부</th>
								<th>완료날짜</th></tr>
						</thead>
						<tbody>
							<tr onclick="window.open('/sunsoft/corpRequest/RequestForm','_blank','width=640, height=840'); return false" class="hover_link">
								<td>1</td>
								<td>yyyy-mm-dd</td>
								<td>(주)xxxxx</td>
								<td>xxx</td>
								<td>xxx</td>
								<td>승인</td>
								<td>미완료</td>
								<td>yyyy-mm-dd</td></tr>
							<tr><td>2</td>
								<td>yyyy-mm-dd</td>
								<td>(주)xxxxx</td>
								<td>xxx</td>
								<td>xxx</td>
								<td>승인</td>
								<td>미완료</td>
								<td>yyyy-mm-dd</td></tr>
							<tr><td>3</td>
								<td>yyyy-mm-dd</td>
								<td>(주)xxxxx</td>
								<td>xxx</td>
								<td>xxx</td>
								<td>승인</td>
								<td>미완료</td>
								<td>yyyy-mm-dd</td></tr>
							<tr><td>4</td>
								<td>yyyy-mm-dd</td>
								<td>(주)xxxxx</td>
								<td>xxx</td>
								<td>xxx</td>
								<td>승인</td>
								<td>미완료</td>
								<td>yyyy-mm-dd</td></tr>
							<tr><td>5</td>
								<td>yyyy-mm-dd</td>
								<td>(주)xxxxx</td>
								<td>xxx</td>
								<td>xxx</td>
								<td>승인</td>
								<td>미완료</td>
								<td>yyyy-mm-dd</td></tr>
							<tr><td>6</td>
								<td>yyyy-mm-dd</td>
								<td>(주)xxxxx</td>
								<td>xxx</td>
								<td>xxx</td>
								<td>승인</td>
								<td>미완료</td>
								<td>yyyy-mm-dd</td></tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>