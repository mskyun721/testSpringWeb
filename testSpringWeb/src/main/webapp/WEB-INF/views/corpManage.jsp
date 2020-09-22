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
		
		window.open('corpManageForm?UNTCD='+result,'_blank','width=600, height=440, left='+popUpX+', top='+popUpY);
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
					<tr><th style="width: 3%"></th>
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
						<th style="width: 5%"></th></tr>
					<tr><td><button type="button" id="add"><i class="fas fa-plus-square"></i>add</button></td>
						<td><input type="text" size="1" readonly="readonly"></td>
						<td><input type="text" size="10" name="CSTNM" id="CSTNM"></td>
						<td><input type="text" size="10" name="CSTCEO" id="CSTCEO"></td>
						<td><input type="text" size="10" name="BIZNO" id="BIZNO"></td>
						<td><input type="text" size="5" name="CSTKIND" id="CSTKIND"></td>
						<td><input type="text" size="5" name="CSTITEM" id="CSTITEM"></td>
						<td><input type="text" size="20" name="TELNO" id="TELNO"></td>
						<td><input type="text" size="20" name="FAXNO" id="FAXNO"></td>
						<td><input type="text" size="7" name="ZIPNO" id="ZIPNO"></td>
						<td><input type="text" size="40" name="ADDR1" id="ADDR1"></td>
						<tD><input type="text" size="10"name="REMARK" id="REMARK"></td>
						<td><button type="submit"><i class="fas fa-search"></i>&nbsp;검색</button></td>
						</tr>
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