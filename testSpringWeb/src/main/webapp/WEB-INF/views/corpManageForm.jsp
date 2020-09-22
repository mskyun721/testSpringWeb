<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 등록</title>
<link type="text/css" href="resources/style/default.css" rel="stylesheet">
<link type="text/css" href="resources/style/common.css" rel="stylesheet">
<link type="text/css" href="resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="resources/style/design.css" rel="stylesheet">
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/table.css" rel="stylesheet" type="text/css">
<link href="resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="popUpCard">
<div>
	<h3 style="text-align: center;">사업장 등록</h3><br>
</div>
	<form action="insertCst" method="post" class="subPageForm">
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="CSTCD">거래처코드</label></div>
				<input type="text" size="10" name="CSTCD" required="required" value="${OneCST.CSTCD }">
			</div>
			<div class="floatLeft marginLeft_50">
				<div class="lbWidth"><label for="CSTNM">거래처</label></div>
				<input type="text" size="10" name="CSTNM" required="required" value="${OneCST.CSTNM }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="CSTCEO">대표자</label></div>
				<input type="text" size="10" name="CSTCEO" value="${OneCST.CSTCEO }">
			</div>
			<div class="floatLeft marginLeft_50">
				<div class="lbWidth"><label for="CSTEMPNM">담당자</label></div>
				<input type="text" size="10" name="CSTEMPNM" value="${OneCST.CSTEMPNM }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="BIZNO">사업자번호</label></div>
				<input type="text" size="10" name="BIZNO" value="${OneCST.BIZNO }">
			</div>
			<div class="floatLeft marginLeft_50">
				<div class="lbWidth"><label for="CSTTYPE">타입</label></div>
				<input type="text" size="10" name="CSTTYPE" value="${OneCST.CSTTYPE }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="CSTKIND">업태</label></div>
				<input type="text" size="10" name="CSTKIND" value="${OneCST.CSTKIND }">
			</div>
			<div class="floatLeft marginLeft_50">
				<div class="lbWidth"><label for="CSTITEM">업종</label></div>
				<input type="text" size="10" name="CSTITEM" value="${OneCST.CSTITEM }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="TELNO">전화번호</label></div>
				<input type="text" size="10" name="TELNO" value="${OneCST.TELNO }">
			</div>
			<div class="floatLeft marginLeft_50">
				<div class="lbWidth"><label for="FAXNO">팩스번호</label></div>
				<input type="text" size="10" name="FAXNO" value="${OneCST.FAXNO }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="lbWidth"><label for="ZIPNO">우편번호</label></div>
			<input type="text" size="5" name="ZIPNO" value="${OneCST.ZIPNO }">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label for="ADDR1">주소</label></div>
			<input type="text" size="30" name="ADDR1" value="${OneCST.ADDR1 }"><br>
			<div class="lbWidth"><label></label></div>
			<input type="text" size="30" name="ADDR2" value="${OneCST.ADDR2 }">
		</div>
		<div class="formRow">
			<div class="lbWidth verticalTop"><label for="REMARK">비고</label></div>
			<textarea rows="5" cols="60" name="REMARK">${OneCST.REMARK }</textarea>
		</div>
		<div class="buttonBox">
		<button type="submit" id=""><i class="fas fa-save" style="font-size:15px;"></i>&nbsp;저장</button>&nbsp;
		<button type="button" onclick="window.close();"><i class="fas fa-window-close" style="font-size:15px;"></i>&nbsp;취소</button>&nbsp;
		</div>
	</form>
</div>
</body>
</html>