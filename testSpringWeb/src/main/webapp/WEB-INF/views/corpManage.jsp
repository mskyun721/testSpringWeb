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
<script type="text/javascript">
$(document).ready(function() {
	$("[id^=btnDel]").click(function () {
		var confirmResult = confirm("삭제하시겠습니까?");
		var id = $(this).attr("id");
		var num = id.replace("btnDel","");
		var result = $('#delRow'+num).val();
		if (confirmResult) {
			$.ajax({
				url:"delCorp",
				type:"get",
				data:{CSTCD:result},
				success:function(data){
					location.reload();
				}
			});
		}
		
	});
});
</script>
</head>
<body>
<div id="wrap">
	<!-- header -->
	<jsp:include page="inc/header.jsp"/>
	<!-- header -->
	<div id="content">
		<!-- sidebar -->
		<jsp:include page="inc/sidebar.jsp"/>
		<!-- sidebar -->
		<div id="row1">
			<div id="title">
				<h3>거래처관리</h3>
			</div>
			
			<div class="floatLeft">
				<div id="searchBox">
				
				</div>
				<div class="marginLeft_50">
					<form method="GET">
					<table class="table1500">
					<thead>
						<tr><th></th>
							<th>No.</th>
							<th>거래처 코드</th>
							<th>거래처</th>
							<th>타입</th>
							<th>대표자</th>
							<th>사업자 번호</th>
							<th>업태</th>
							<th>업종</th>
							<th>전화번호</th>
							<th>팩스번호</th>
							<th>우편 번호</th>
							<th>주소</th>
							<th>비고</th>
							<th></th></tr>
						<tr><th><input type="button" onclick="window.open('corpManageForm','_blank','width=585, height=390'); return false" value="add"></th>
							<th></th>
							<th><input type="text" size="10" name="CSTCD" id="CSTCD"></th>
							<th><input type="text" size="10" name="CSTNM" id="CSTNM"></th>
							<th><input type="text" size="2" name="CSTTYPE" id="CSTTYPE"></th>
							<th><input type="text" size="10" name="CSTCEO" id="CSTCEO"></th>
							<th><input type="text" size="10" name="BIZNO" id="BIZNO"></th>
							<th><input type="text" size="5" name="CSTKIND" id="CSTKIND"></th>
							<th><input type="text" size="5" name="CSTITEM" id="CSTITEM"></th>
							<th><input type="text" size="18" name="TELNO" id="TELNO"></th>
							<th><input type="text" size="18" name="FAXNO" id="FAXNO"></th>
							<th><input type="text" size="7" name="ZIPNO" id="ZIPNO"></th>
							<th><input type="text" size="30" name="ADDR1" id="ADDR1"></th>
							<th><input type="text" size="10"name="REMARK" id="REMARK"></th>
							<th><input type="submit" value="조회"></th>
							</tr>
					</thead>
						<tbody>
							<c:forEach items="${corpList }" var="list" varStatus="i">
							<tr><td><input type="button" 
										onclick="window.open('corpManageForm?CSTCD=${list.CSTCD}',
										'_blank','width=585, height=390'); return false" value="edit"></td>
								<td>${i.index+1 }</td>
								<td>${list.CSTCD }</td>
								<td>${list.CSTNM }</td>
								<td>${list.CSTTYPE }</td>
								<td>${list.CSTCEO }</td>
								<td>${list.BIZNO }</td>
								<td>${list.CSTKIND }</td>
								<td>${list.CSTITEM }</td>
								<td>${list.TELNO }</td>
								<td>${list.FAXNO }</td>
								<td>${list.ZIPNO }</td>
								<td>${list.ADDR1 } ${list.ADDR2 }</td>
								<td>${list.REMARK }</td>
								<td><input type="button" value="Del" id="btnDel${i.index }">
									<input type="hidden" id="delRow${i.index }" value="${list.CSTCD }"></td></tr>
							</c:forEach>
						</tbody>
					</table>
					</form>
				</div><!-- table end -->
			</div>
		</div><!-- row1 end -->
	</div><!-- content end -->
</div>
</body>
</html>