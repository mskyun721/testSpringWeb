<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 요청 사항</title>
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/scheduleForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function search() {
		window.open('/sunsoft/corpRequest/CstcdSearch','searchCst','width=400,height=400');
	}
</script>
</head>
<body>
<div>
	<div class="marginLeft_30 floatLeft"><h3>업체 요청 내역</h3></div>
	<div class="marginRight_50 marginTop_10 floatRight"><button>출력</button></div>
</div>
<div class="clear"></div>
<div class="marginLeft_20">
	<form action="/sunsoft/corpRequest/requestInsert" method="get" class="subPageForm">
		<div class="formRow">
			<div class="lbWidth"><label for="">날짜</label></div>
			<c:choose>
				<c:when test="${requestCrhDto.REQDATE == null }">
				<input type="date" name="REQDATE" id="REQDATE" value="${date }">
				</c:when>
				<c:otherwise>
				<input type="date" name="REQDATE" id="REQDATE" value="${requestCrhDto.REQDATE }">
				</c:otherwise>
			</c:choose>
			
			<input type="hidden" name="REQNO" id="REQNO" value="${requestCrhDto.REQNO }">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label for="">거래처</label></div>
			<input type="text" size="5" name="CSTCD" id="CSTCD" value="${requestCrhDto.CSTCD }">
			<input type="text" size="10" name="CSTNM" id="CSTNM" value="${requestCrhDto.CSTNM }">
			<button id="searchCST" onclick="search();">검색</button>
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>담당자</label></div>
			<c:choose>
				<c:when test="${requestCrhDto.REQDATE == null }">
				<input type="text" size="5" name="USERNM" id="USERNM" value="${sessionScope.USERNM }">
				</c:when>
				<c:otherwise>
				<input type="text" size="5" name="USERNM" id="USERNM" value="${requestCrhDto.USERNM }">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>요청자</label></div>
			<input type="text" size="5" name="CSTEMPNM" id="CSTEMPNM" value="${requestCrhDto.CSTEMPNM }">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>승인여부</label></div>
			<c:choose>
				<c:when test="${requestCrhDto.APPROVAL == '1'}">
					<select id="APPROVAL" name="APPROVAL" >
						<option value="0" >--구분--</option>
						<option value="1" selected>미보고</option>
						<option value="2">승인</option>
						<option value="3">보류</option>
						<option value="4">미승인</option>
					</select>
				</c:when>
				<c:when test="${requestCrhDto.APPROVAL == '2'}">
					<select id="APPROVAL" name="APPROVAL" >
						<option value="0" >--구분--</option>
						<option value="1" >미보고</option>
						<option value="2" selected>승인</option>
						<option value="3">보류</option>
						<option value="4">미승인</option>
					</select>
				</c:when>
				<c:when test="${requestCrhDto.APPROVAL == '3'}">
					<select id="APPROVAL" name="APPROVAL" >
						<option value="0" >--구분--</option>
						<option value="1" >미보고</option>
						<option value="2">승인</option>
						<option value="3" selected>보류</option>
						<option value="4">미승인</option>
					</select>
				</c:when>
				<c:when test="${requestCrhDto.APPROVAL == '4'}">
					<select id="APPROVAL" name="APPROVAL" >
						<option value="0" >--구분--</option>
						<option value="1" >미보고</option>
						<option value="2">승인</option>
						<option value="3">보류</option>
						<option value="4" selected>미승인</option>
					</select>
				</c:when>
				<c:otherwise>
					<select id="APPROVAL" name="APPROVAL" >
						<option value="0" selected>--구분--</option>
						<option value="1">미보고</option>
						<option value="2">승인</option>
						<option value="3">보류</option>
						<option value="4">미승인</option>
					</select>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="formRow">
			<div class="lbWidth verticalTop"><label>요청내용</label></div>
			<textarea rows="15" cols="70" id="REQCONT" name="REQCONT">${requestCrhDto.REQCONT }</textarea>
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>완료날짜</label></div>
			<input type="date" name="CPTDATE" id="CPTDATE" value="${requestCrhDto.CPTDATE }">
		</div>
		<div class="formRow">
			<div class="lbWidth"><label>완료여부</label></div>
			<c:choose>
				<c:when test="${requestCrhDto.COMPLET == 'Y'}">
					<select id="COMPLET" name="COMPLET">
						<option value="0">--구분--</option>
						<option value="Y"selected >Y</option>
						<option value="N">N</option>
					</select>
				</c:when>
				<c:when test="${requestCrhDto.COMPLET == 'N'}">
					<select id="COMPLET" name="COMPLET">
						<option value="0">--구분--</option>
						<option value="Y" >Y</option>
						<option value="N" selected>N</option>
					</select>
				</c:when>
				<c:otherwise>
					<select id="COMPLET" name="COMPLET">
						<option value="0" selected>--구분--</option>
						<option value="Y">Y</option>
						<option value="N">N</option>
					</select>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="formRow">
			<div class="lbWidth verticalTop"><label>완료내용</label></div>
			<textarea rows="15" cols="70" name="CPTCONT" id="CPTCONT">${requestCrhDto.CPTCONT }</textarea>
		</div>
		<div class="buttonBox">
		<button type="submit">저장</button>&nbsp;
		<button id="">삭제</button>&nbsp;
		<button id="" onclick="window.close">취소</button>&nbsp;
		</div>
	</form>
</div>
</body>
</html>