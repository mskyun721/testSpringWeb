<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNSOFT</title>
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#STDATE").change(function () {
		var stdate = $('#STDATE').val();
		var ltdate = $('#LTDATE').val();
		
		location.href="/sunsoft/corpRequest/corpRequest?STDATE="+stdate+"&LTDATE="+ltdate;
	});
	$("#LTDATE").change(function () {
		var stdate = $('#STDATE').val();
		var ltdate = $('#LTDATE').val();
		
		location.href="/sunsoft/corpRequest/corpRequest?STDATE="+stdate+"&LTDATE="+ltdate;
	});
	
});
</script>
</head>
<body>
<div id="wrap">
	<!-- header -->
	<%-- <jsp:include page="../inc/header.jsp"/> --%>
	<!-- header -->
	<!-- sidebar -->
	<jsp:include page="../inc/sidebar.jsp"/>
	<!-- sidebar -->
	<div id="content">
		
		<div id="row1">
			<div id="title">
				<h3>업체 요청 사항</h3>
			</div>
			<div class="floatLeft">
				<form>
				<div id="searchBox">
					<div class="inline floatLeft marginLeft_20" style="width: 400px;">
						<label>거래처</label>
						<input type="text" size="10" id="CSTNM" name="CSTNM" value="${CSTNM }">&nbsp;
						<button type="button" onclick="window.open('/sunsoft/corpRequest/CstcdSearch','searchCst','width=500,height=400')">조회</button>
					</div>
					<div class="inline floatLeft" style="width: 350px;">
						<div class="marginBottom_5">
							<label>승인여부</label>
							<c:choose>
								<c:when test="${APPROVAL == '1'}">
									<select id="APPROVAL" name="APPROVAL" >
										<option value="0" >--구분--</option>
										<option value="1" selected>미보고</option>
										<option value="2">승인</option>
										<option value="3">보류</option>
										<option value="4">미승인</option>
									</select>
								</c:when>
								<c:when test="${APPROVAL == '2'}">
									<select id="APPROVAL" name="APPROVAL" >
										<option value="0" >--구분--</option>
										<option value="1" >미보고</option>
										<option value="2" selected>승인</option>
										<option value="3">보류</option>
										<option value="4">미승인</option>
									</select>
								</c:when>
								<c:when test="${APPROVAL == '3'}">
									<select id="APPROVAL" name="APPROVAL" >
										<option value="0" >--구분--</option>
										<option value="1" >미보고</option>
										<option value="2">승인</option>
										<option value="3" selected>보류</option>
										<option value="4">미승인</option>
									</select>
								</c:when>
								<c:when test="${APPROVAL == '4'}">
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
						<div>
							<label>완료여부</label>
							<c:choose>
								<c:when test="${COMPLET == 'Y'}">
									<select id="COMPLET" name="COMPLET">
										<option value="0">--구분--</option>
										<option value="Y"selected >Y</option>
										<option value="N">N</option>
									</select>
								</c:when>
								<c:when test="${COMPLET == 'N'}">
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
					</div>
					<div class="floatRight marginRight_10">
					<button type="submit">검색</button><br>
					<button type="button" onclick="location.href='/sunsoft/corpRequest/corpRequest?'">취소</button>
					</div>
					<div class="inline " style="width: 350px;">
						<div class="floatRight marginRight_20">
							<input type="date" size="5" name="STDATE" id="STDATE" value=${STDATE }><br>
							<input type="date" size="5" name="LTDATE" id="LTDATE" value=${LTDATE }>
						</div>
						<div class="floatRight marginRight_10"><label class="floatRight">검색기간</label></div>
					</div>
					
				</div>
				
				</form>
				<div class="marginLeft_100">
					<table class="table1100">
						<thead>
							<tr><th width="10"><input type="button" onclick="window.open('/sunsoft/corpRequest/RequestForm','insertRequest','width=640, height=840'); return false" value="add"></th>
								<th>No.</th>
								<th>날짜</th>
								<th>거래처명</th>
								<th>담당자</th>
								<th>요청자</th>
								<th>승인여부</th>
								<th>완료여부</th>
								<th>완료날짜</th></tr>
						</thead>
						<tbody id="reqList">
							<c:forEach items="${reqList }" var="list" varStatus="i">
								<tr><td width="10"><input type="button" 
										onclick="window.open('/sunsoft/corpRequest/RequestForm?REQDATE=${list.REQDATE}&REQNO=${list.REQNO }','_blank','width=640, height=840'); return false" value="edit"></td>
									<td>${i.index+1 }</td>
									<td>${list.REQDATE }</td>
									<td>${list.CSTNM }</td>
									<td>${list.USERNM }</td>
									<td>${list.CSTEMPNM }</td>
									<td><c:if test="${list.APPROVAL == '1' }">미보고</c:if>
										<c:if test="${list.APPROVAL == '2' }">승인</c:if>
										<c:if test="${list.APPROVAL == '3' }">보류</c:if>
										<c:if test="${list.APPROVAL == '4' }">미승인</c:if></td>
									<td>${list.COMPLET }</td>
									<td>${list.CPTDATE }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>