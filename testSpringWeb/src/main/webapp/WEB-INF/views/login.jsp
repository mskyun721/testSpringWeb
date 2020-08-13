<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/table.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="center">
	<div id="login">
		<form method="post" action="loginCheck">
			<div class="formRow">
				<div class="lbWidth"><label for="">아이디</label></div>
				<input type="text" name="USERID" id="" class="" size="10">
			</div>
			<div class="formRow">
				<div class="lbWidth"><label for="">비밀번호</label></div>
				<input type="password" name="USERPW" id="" class="" size="10">
			</div>
			<button type="submit" >로그인</button>
		</form>
	</div>
	<div id="blank"></div>
</div>

</body>
</html>