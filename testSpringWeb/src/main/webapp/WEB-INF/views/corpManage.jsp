<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNSOFT</title>
<link type="text/css" href="resources/style/default.css" rel="stylesheet">
<link type="text/css" href="resources/style/common.css" rel="stylesheet">
<link type="text/css" href="resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="resources/style/design.css" rel="stylesheet">
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/table.css" rel="stylesheet" type="text/css">
<link href="resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
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
	
	var popUpX = (window.screen.width/2)-400;
	var popUpY = (window.screen.height/2)-250;
	$('#add').click(function(){
		window.open('corpManageForm','_blank','width=600, height=440, left='+popUpX+', top='+popUpY);
	});
	
	$("[id^=edit]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("edit","");
		var result = $('#delRow'+num).val();
		
		window.open('corpManageForm?CSTCD='+result,'_blank','width=600, height=440, left='+popUpX+', top='+popUpY);
	});
	
});
</script>
</head>
<body>
<!-- header -->
<jsp:include page="public/header.jsp"/>
<!-- header -->
<div class="row">
	<div>
		<div class="card">
			<h3><i class="fas fa-caret-right"></i>사업장 관리</h3>
			<hr />
			<div>
				<form method="GET">
				<table class="table100">
				<thead>
					<tr><th style="width: 3%"><button type="button" id="add" style="background-color: #1467b3;color: white;"><i class="fas fa-plus-square"></i>add</button></th>
						<th style="width: 3%">No.</th>
						<th style="width: 7%">거래처</th>
						<th style="width: 5%">대표자</th>
						<th style="width: 8%">사업자 번호</th>
						<th style="width: 5%">업태</th>
						<th style="width: 5%">업종</th>
						<th style="width: 10%">전화번호</th>
						<th style="width: 10%">팩스번호</th>
						<th style="width: 7%">우편 번호</th>
						<th style="width: 15%">주소</th>
						<th style="width: 10%">비고</th>
						<th style="width: 5%"><button type="submit" style="background-color: #1467b3;color: white;"><i class="fas fa-search"></i>&nbsp;Sch</button></th></tr>
				</thead>
					<tbody>
						<c:forEach items="${corpList }" var="list" varStatus="i">
						<tr><td><button type="button" 
									id="edit${i.index }"><i class="fas fa-edit"></i>edit</button></td>
							<td>${i.index+1 }</td>
							<td>${list.CSTNM }</td>
							<td>${list.CSTCEO }</td>
							<td>${list.BIZNO }</td>
							<td>${list.CSTKIND }</td>
							<td>${list.CSTITEM }</td>
							<td>${list.TELNO }</td>
							<td>${list.FAXNO }</td>
							<td>${list.ZIPNO }</td>
							<td>${list.ADDR1 }&nbsp;${list.ADDR2 }</td>
							<td>${list.REMARK }</td>
							<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i>&nbsp;Del</button>
								<input type="hidden" id="delRow${i.index }" value="${list.CSTCD }"></td></tr>
						</c:forEach>
					</tbody>
				</table>
				</form>
			</div><!-- table end -->
		</div><!-- row1 end -->
	</div><!-- content end -->
</div>
<!-- footer -->
<jsp:include page="public/footer.jsp"/>
<!-- footer -->
</body>
</html>