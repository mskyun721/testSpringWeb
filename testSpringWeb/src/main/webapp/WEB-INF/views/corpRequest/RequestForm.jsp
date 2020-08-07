<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 요청 사항</title>
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/scheduleForm.css" rel="stylesheet" type="text/css">
</head>
<body>
<div>
	<div class="marginLeft_30 floatLeft"><h3>업체 요청 내역</h3></div>
	<div class="marginRight_50 marginTop_10 floatRight"><button>출력</button></div>
</div>
<div class="clear"></div>
<div class="marginLeft_20">
	<form action="" class="subPageForm">
		<div class="formRow">
			<div class="lbWidth"><label for="">날짜</label></div>
			<input type="date" name="" id="" class="">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label for="">거래처</label></div>
			<input type="text" name="" id="" size="5">
			<input type="text" size="10">
			<button>검색</button>
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>담당자</label></div>
			<input type="text" size="5" class="">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>요청자</label></div>
			<input type="text" size="5" class="">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>승인여부</label></div>
			<select>
				<option>미보고</option>
				<option>승인</option>
				<option>보류</option>
				<option>미승인</option>
			</select>
		</div>
		<div class="formRow">
			<div class="lbWidth verticalTop"><label>요청내용</label></div>
			<textarea rows="15" cols="70"></textarea>
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>완료날짜</label></div>
			<input type="date">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>완료여부</label></div>
			<select>
				<option>Y</option>
				<option>N</option>
			</select>
		</div>
		<div class="formRow">
			<div class="lbWidth verticalTop"><label>완료내용</label></div>
			<textarea rows="15" cols="70"></textarea>
		</div>
		<div class="buttonBox">
		<button id="">저장</button>&nbsp;
		<button id="">삭제</button>&nbsp;
		<button id="">취소</button>&nbsp;
		</div>
	</form>
</div>
</body>
</html>