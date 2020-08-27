<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사내 일정 관리</title>
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/scheduleForm.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<div class="marginLeft_20">
	<form action="insertSchedule" class="subPageForm">
		<div class="formRow">
			<div class="lbWidth"><label for="">예정일</label></div>
			<input type="date" name="SCHDATE" id="selectedDate" value="${date }">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label for="">작성자</label></div>
			<input type="text" name="USERNM" id="USERNM" size="15" value="${sessionScope.USERNM }">
		</div>
		<div class="formRow">
			<div class="lbWidth verticalTop"><label for="">내용</label></div>
			<textarea rows="5" cols="25" name="SCHCONT"></textarea>
		</div>
		<div class="buttonBox">
			<button type="submit">저장</button>&nbsp;
			<button id="">삭제</button>&nbsp;
			<button id="">취소</button>
		</div>
	</form>
</div>
</body>
</html>