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
	<%-- <jsp:include page="inc/header.jsp"/> --%>
	<!-- header -->
	<!-- sidebar -->
	<jsp:include page="inc/sidebar.jsp"/>
	<!-- sidebar -->
	<div id="content">
		
		<div id="row1">
			<div id="title">
				<h3>사용자 등록</h3>
			</div>
			
			<div class="floatLeft">
				<div id="searchBox">
				
				</div>
				<div class="marginLeft_100">
					<form method="post" action="searchUser">
					<table class="table1100">
						<thead class="tableSection">
							<tr><th></th>
								<th>NO.</th>
								<th>ID</th>
								<th>PassWord</th>
								<th>이름</th>
								<th>직급</th>
								<th>타입</th>
								<th>전화번호</th>
								<th>비상연락망</th>
								<th>비고</th>
								<th></th></tr>
							<tr><td><input type="button" onclick="window.open('userForm','_blank','width=300, height=320'); return false" value="add"></td>
								<td><input type="text" size="1" readonly="readonly"></td>
								<td><input type="text" size="5" name="USERID" value="" id="USERID"></td>
								<td><input type="text" size="5" name="USERPW" value="" id="USERPW"></td>
								<td><input type="text" size="5" name="USERNM" value="" id="USERNM"></td>
								<td><input type="text" size="5" name="JOBGRADE" value="" id="JOBGRADE"></td>
								<td><input type="text" size="5" name="USERTYPE" value="" id="USERTYPE"></td>
								<td><input type="text" size="10" name="HPNUMBER" value="" id="USERTYPE"></td>
								<td><input type="text" size="10" name="HPNUMBER2" value="" id="USERTYPE"></td>
								<td><input type="text" size="10" name="REMARK" value="" id="REMARK"></td>
								<td><input type="submit" value="조회"></td>
								</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList }" var="user" varStatus="i">
							<tr><td><input type="button" onclick="window.open('userForm?USERID=${user.USERID}&USERPW=${user.USERPW}','_blank','width=300, height=320'); return false" value="edit"></td>
							<td>${i.index+1 }</td>
							<td>${user.USERID }</td>
							<td>${user.USERPW }</td>
							<td>${user.USERNM }</td>
							<td>${user.JOBGRADE }</td>
							<td>${user.USERTYPE }</td>
							<td>${user.HPNUMBER }</td>
							<td>${user.HPNUMBER2 }</td>
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