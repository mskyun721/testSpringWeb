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
				url:"delUser",
				type:"get",
				data:{USERID:result},
				success:function(data){
					location.reload();
				}
			});
		}
		
	});
	
	
	$('#add').click(function(){
		var popUpX = (window.screen.width/2)-400;
		var popUpY = (window.screen.height/2)-250;
		
		window.open('userForm','_blank','width=335, height=410, left='+popUpX+', top='+popUpY);
	});
	
	$("[id^=edit]").click(function(){
		var id = $(this).attr("id");
		var num = id.replace("edit","");
		var userid = $('#delRow'+num).val();
		
		var popUpX = (window.screen.width/2)-400;
		var popUpY = (window.screen.height/2)-250;
		
		window.open('userForm?USERID='+userid,'_blank','width=335, height=410, left='+popUpX+', top='+popUpY);
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
			<h3><i class="fas fa-caret-right"></i> 사용자 관리</h3>
			<hr />
			<div>
				<form method="post" action="searchUser">
				<table class="table100">
					<thead>
						<tr><th style="width: 3%"><button type="button" id="add" style="background-color: #1467b3;color: white;"><i class="fas fa-plus-square"></i>add</button></th>
							<th style="width: 3%">NO.</th>
							<th style="width: 7%">ID</th>
							<th style="width: 7%">PassWord</th>
							<th style="width: 7%">이름</th>
							<th style="width: 5%">직급</th>
							<th style="width: 10%">전화번호</th>
							<th style="width: 10%">비상연락망</th>
							<th style="width: 15%">비고</th>
							<th style="width: 3%"><button type="submit" style="background-color: #1467b3;color: white;"><i class="fas fa-search"></i>Sch</button></th></tr>
					</thead>
					<tbody>
						<c:forEach items="${userList }" var="user" varStatus="i">
						<tr><td width="30"><button type="button" id="edit${i.index }"><i class="fas fa-edit"></i>edit</button></td>
						<td>${i.index+1 }</td>
						<td>${user.USERID }</td>
						<td>*****</td>
						<td>${user.USERNM }</td>
						<td>${user.JOBGRADE }</td>
						<td>${user.HPNUMBER }</td>
						<td>${user.HPNUMBER2 }</td>
						<td>${user.REMARK }</td>
						<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i>Del</button>
							<input type="hidden" id="delRow${i.index }" value="${user.USERID }"></td></tr>
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