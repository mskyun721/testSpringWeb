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
	<form action="" class="subPageForm">
		<div class="formRow">
			<div class="lbWidth"><label for="">예정일</label></div>
			<input type="date" name="" id="selectedDate" value="${date }">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label for="">작성자</label></div>
			<input type="text" name="" id="" size="15" value="">
		</div>
		<div class="formRow">
			<div class="lbWidth verticalTop"><label for="">내용</label></div>
			<textarea rows="5" cols="25"></textarea>
		</div>
		<div class="buttonBox">
			<button id="">저장</button>&nbsp;
			<button id="">삭제</button>&nbsp;
			<button id="">취소</button>
		</div>
	</form>
</div>
</body>
</html>