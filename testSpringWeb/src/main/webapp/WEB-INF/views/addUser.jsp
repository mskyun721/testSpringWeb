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
				url:"delUser",
				type:"get",
				data:{USERID:result},
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
				<h3>사용자 등록</h3>
			</div>
			
			<div class="floatLeft">
				<div id="searchBox">
				
				</div>
				<div class="marginLeft_100">
					<form method="post" action="insertUser">
					<table class="table1100">
						<thead class="tableSection">
							<tr><th class="backWhite"></th>
								<th colspan="10" class="backWhite" align="left"></th>
								<th colspan="3" align="right" class="backWhite">
							<tr><th></th>
								<th>NO.</th>
								<th>ID</th>
								<th>PassWord</th>
								<th>이름</th>
								<th>직급</th>
								<th>타입</th>
								<th>비고</th>
								<th></th></tr>
							<tr>
							<th><input type="button" onclick="window.open('RequestForm','_blank','width=585, height=390'); return false" value="add"></th>
								<th></th>
								<th><input type="text" size="10" name="USERID" value="" id="USERID"></th>
								<th><input type="text" size="10" name="USERPW" value="" id="USERPW"></th>
								<th><input type="text" size="10" name="USERNM" value="" id="USERNM"></th>
								<th><input type="text" size="10" name="JOBGRADE" value="" id="JOBGRADE"></th>
								<th><input type="text" size="5" name="USERTYPE" value="" id="USERTYPE"></th>
								<th><input type="text" size="2" name="REMARK" value="" id="REMARK"></th>
								<th><input type="submit" value="등록" id="insert"></th>
								</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList }" var="user" varStatus="i">
							<tr><td><button>edit</button></td>
							<td>${i.index+1 }</td>
							<td>${user.USERID }</td>
							<td>${user.USERPW }</td>
							<td>${user.USERNM }</td>
							<td>${user.JOBGRADE }</td>
							<td>${user.USERTYPE }</td>
							<td>${user.REMARK }</td>
							<td><button type="button" id="btnDel${i.index }">Del</button>
								<input type="hidden" id="delRow${i.index }" value="${user.USERID }"></td></tr>
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