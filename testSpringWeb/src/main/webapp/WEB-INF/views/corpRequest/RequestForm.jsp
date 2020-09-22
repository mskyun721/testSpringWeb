<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 요청 사항</title>
<link type="text/css" href="../resources/style/default.css" rel="stylesheet">
<link type="text/css" href="../resources/style/common.css" rel="stylesheet">
<link type="text/css" href="../resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="../resources/style/design.css" rel="stylesheet">
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/scheduleForm.css" rel="stylesheet" type="text/css">
<link href="../resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
 	function printData(REQDATE,CSTNM,USERNM,CSTEMPNM,APPROVAL,REQCONT,CPTDATE,COMPLET,CPTCONT) {
 		var reqdate = REQDATE.split('-');
		var cptdate = CPTDATE.split('-');
		var req = reqdate[0].substr(2,2)+"년 "+reqdate[1]+"월 "+reqdate[2]+"일";
		var cpt = cptdate[0].substr(2,2)+"년 "+cptdate[1]+"월 "+cptdate[2]+"일";
		var approval='';
		if (APPROVAL == '1') {approval = '미보고';}
		else if (APPROVAL == '2') {approval = '승인';}
		else if (APPROVAL == '3') {approval = '보류';}
		else if (APPROVAL == '4') {approval = '미승인';}
		window.opener.document.getElementById("prt_REQDATE").innerText=req;
		window.opener.document.getElementById("prt_CSTNM").innerText=CSTNM;
		window.opener.document.getElementById("prt_USERNM").innerText=USERNM;
		window.opener.document.getElementById("prt_CSTEMPNM").innerText=CSTEMPNM;
		window.opener.document.getElementById("prt_APPROVAL").innerText=approval;
		window.opener.document.getElementById("prt_REQCONT").innerText=REQCONT;
		window.opener.document.getElementById("prt_CPTDATE").innerText=cpt;
		window.opener.document.getElementById("prt_COMPLET").innerText=COMPLET;
		window.opener.document.getElementById("prt_CPTCONT").innerText=CPTCONT;
		opener.window.print();
	} 
</script>
</head>
<body>
<div class="marginRight_50 marginTop_10 floatRight"><button type="button" onclick="printData('${requestCrhDto.REQDATE}','${requestCrhDto.CSTNM }','${requestCrhDto.USERNM }',
											'${requestCrhDto.CSTEMPNM }','${requestCrhDto.APPROVAL}','${requestCrhDto.REQCONT }',
											'${requestCrhDto.CPTDATE }','${requestCrhDto.COMPLET}','${requestCrhDto.CPTCONT }');" id="printData">
											<i class="fas fa-file-powerpoint" style="font-size:15px;"></i>&nbsp;&nbsp;출력</button></div>
<div class="popUpCard">
	<h3 style="text-align: center;">업체 요청 내역</h3><br>
	

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
			<button id="searchCST" onclick="window.open('/sunsoft/corpRequest/CstcdSearch','searchCst','width=500,height=400'); return false"><i class="fas fa-object-ungroup"style="font-size:15px;"></i>&nbsp;&nbsp;조회</button>
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
						<option value="1" selected>미보고</option>
						<option value="2">승인</option>
						<option value="3">보류</option>
						<option value="4">미승인</option>
					</select>
				</c:when>
				<c:when test="${requestCrhDto.APPROVAL == '2'}">
					<select id="APPROVAL" name="APPROVAL" >
						<option value="1" >미보고</option>
						<option value="2" selected>승인</option>
						<option value="3">보류</option>
						<option value="4">미승인</option>
					</select>
				</c:when>
				<c:when test="${requestCrhDto.APPROVAL == '3'}">
					<select id="APPROVAL" name="APPROVAL" >
						<option value="1" >미보고</option>
						<option value="2">승인</option>
						<option value="3" selected>보류</option>
						<option value="4">미승인</option>
					</select>
				</c:when>
				<c:when test="${requestCrhDto.APPROVAL == '4'}">
					<select id="APPROVAL" name="APPROVAL" >
						<option value="1" >미보고</option>
						<option value="2">승인</option>
						<option value="3">보류</option>
						<option value="4" selected>미승인</option>
					</select>
				</c:when>
				<c:otherwise>
					<select id="APPROVAL" name="APPROVAL" >
						<option value="1" selected>미보고</option>
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
						<option value="Y"selected >Y</option>
						<option value="N">N</option>
					</select>
				</c:when>
				<c:when test="${requestCrhDto.COMPLET == 'N'}">
					<select id="COMPLET" name="COMPLET">
						<option value="Y" >Y</option>
						<option value="N" selected>N</option>
					</select>
				</c:when>
				<c:otherwise>
					<select id="COMPLET" name="COMPLET">
						<option value="Y">Y</option>
						<option value="N" selected>N</option>
					</select>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="formRow">
			<div class="lbWidth verticalTop"><label>완료내용</label></div>
			<textarea rows="15" cols="70" name="CPTCONT" id="CPTCONT">${requestCrhDto.CPTCONT }</textarea>
		</div>
		<div class="buttonBox">
		<button type="submit"><i class="fas fa-save" style="font-size:15px;"></i>&nbsp;&nbsp;저장</button>&nbsp;
		<button type="button" onclick="window.close"><i class="fas fa-window-close" style="font-size:15px;"></i>&nbsp;&nbsp;취소</button>
		</div>
	</form>
</div>
</div>
</body>
</html>