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
<link href="../resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
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
		<div id="row1" class="printNone">
			<div id="title">
				<h3>업체 요청 사항</h3>
			</div>
			<div class="floatLeft">
				<form>
					<div id="searchBox">
						<div class="inline floatLeft marginLeft_20" style="width: 400px;">
							<label>거래처</label>
							<input type="text" size="10" id="CSTNM" name="CSTNM" value="${CSTNM }">&nbsp;
							<button type="button" onclick="window.open('/sunsoft/corpRequest/CstcdSearch','searchCst','width=500,height=400')"><i class="fas fa-object-ungroup"style="font-size:15px;"></i>&nbsp;&nbsp;조회</button>
						</div>
						<div class="inline floatLeft" style="width: 350px;">
							<div class="marginBottom_5">
								<label>승인여부</label>
								<c:choose>
									<c:when test="${APPROVAL == '1'}">
										<select id="APPROVAL" name="APPROVAL"class="comboSize">
											<option value="0" >전체</option>
											<option value="1" selected>미보고</option>
											<option value="2">승인</option>
											<option value="3">보류</option>
											<option value="4">미승인</option>
										</select>
									</c:when>
									<c:when test="${APPROVAL == '2'}">
										<select id="APPROVAL" name="APPROVAL" class="comboSize">
											<option value="0" >전체</option>
											<option value="1" >미보고</option>
											<option value="2" selected>승인</option>
											<option value="3">보류</option>
											<option value="4">미승인</option>
										</select>
									</c:when>
									<c:when test="${APPROVAL == '3'}">
										<select id="APPROVAL" name="APPROVAL" class="comboSize">
											<option value="0" >전체</option>
											<option value="1" >미보고</option>
											<option value="2">승인</option>
											<option value="3" selected>보류</option>
											<option value="4">미승인</option>
										</select>
									</c:when>
									<c:when test="${APPROVAL == '4'}">
										<select id="APPROVAL" name="APPROVAL" class="comboSize">
											<option value="0" >전체</option>
											<option value="1" >미보고</option>
											<option value="2">승인</option>
											<option value="3">보류</option>
											<option value="4" selected>미승인</option>
										</select>
									</c:when>
									<c:otherwise>
										<select id="APPROVAL" name="APPROVAL" class="comboSize">
											<option value="0" selected>전체</option>
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
										<select id="COMPLET" name="COMPLET" class="comboSize">
											<option value="0">전체</option>
											<option value="Y"selected >Y</option>
											<option value="N">N</option>
										</select>
									</c:when>
									<c:when test="${COMPLET == 'N'}">
										<select id="COMPLET" name="COMPLET" class="comboSize">
											<option value="0">전체</option>
											<option value="Y" >Y</option>
											<option value="N" selected>N</option>
										</select>
									</c:when>
									<c:otherwise>
										<select id="COMPLET" name="COMPLET" class="comboSize">
											<option value="0" selected>전체</option>
											<option value="Y">Y</option>
											<option value="N">N</option>
										</select>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="floatRight marginRight_10">
						<button type="submit"><i class="fas fa-search"></i>&nbsp;&nbsp;검색</button><br>
						<button type="button" onclick="location.href='/sunsoft/corpRequest/corpRequest?'"><i class="fas fa-window-close" style="font-size:15px;"></i>&nbsp;&nbsp;취소</button>
						</div>
						<div class="inline " style="width: 350px;">
							<div class="floatRight marginRight_20">
								<input type="date" size="5" name="STDATE" id="STDATE" value=${STDATE }><br>
								<input type="date" size="5" name="LTDATE" id="LTDATE" value=${LTDATE }>
							</div>
							<div class="floatRight marginRight_10"><label class="floatRight">검색기간</label></div>
						</div>
					</div><!-- searchBox end -->
				</form>
			</div><!-- form end -->
			<div class="marginLeft_100">
				<table class="table1100">
					<thead>
						<tr><th width="30"><button type="button" onclick="window.open('/sunsoft/corpRequest/RequestForm','insertRequest','width=640, height=840'); return false"><i class="fas fa-plus-square"></i>&nbsp;&nbsp;add</button></th>
							<th>No.</th>
							<th>날짜</th>
							<th>거래처명</th>
							<th>담당자</th>
							<th>요청자</th>
							<th>승인여부</th>
							<th>완료여부</th>
							<th>완료날짜</th>
							<th width="30"></th></tr>
					</thead>
					<tbody id="reqList">
						<c:forEach items="${reqList }" var="list" varStatus="i">
							<tr><td width="10"><button type="button" 
									onclick="window.open('/sunsoft/corpRequest/RequestForm?REQDATE=${list.REQDATE}&REQNO=${list.REQNO }','_blank','width=640, height=840'); return false"><i class="fas fa-edit"></i>edit</button></td>
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
								<td><button type="button" onclick="location.href='requestDel?REQDATE=${list.REQDATE}&REQNO=${list.REQNO}'"><i class="fas fa-trash-alt" style="font-size:15px;"></i>Del</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div><!-- table end -->
		</div><!-- row end -->
		<div class="webNone">
			<div class="marginLeft_100"><h1>업체요청사항</h1></div>
			<table class="marginLeft approTable">
				<tr><td rowspan="2">결재</td>
					<td width="100">담당자</td>
					<td width="100">과장</td>
					<td width="100">차장</td>
					<td width="100">차장</td>
					<td width="100">사장</td></tr>
				<tr><td height="50"></td>
					<td height="50"></td>
					<td height="50"></td>
					<td height="50"></td>
					<td height="50"></td></tr>
			</table>
			<div class="hiddenBlock"></div>
			<div>
				<table class="print_table">
					<tr height="20"><td width="100" rowspan="2">요청일</td>
						<td id="prt_REQDATE" width="200" rowspan="2" ></td>
						<td width="100">거래처</td>
						<td id="prt_CSTNM"></td>
						<td width="100">요청자</td>
						<td id=prt_CSTEMPNM></td></tr>
					<tr><td width="100">담당자</td>
						<td id="prt_USERNM"></td>
						<td width="100">승인여부</td>
						<td id="prt_APPROVAL"></td></tr>
					<tr height="400"><td><pre>요 청<br><br>사 항</pre></td>
						<td colspan="5" class="dataPre"><pre class="dataPre" id="prt_REQCONT"></pre></td></tr>
					<tr height="40"><td width="100">완료일</td>
						<td colspan="2" id="prt_CPTDATE"></td>
						<td width="100">완료여부</td>
						<td colspan="2" id="prt_COMPLET"></td></tr>
					<tr height="400"><td><pre>완 료<br><br>내 용</pre></td>
						<td colspan="5" class="dataPre"><pre class="dataPre" id="prt_CPTCONT"></pre></td></tr>
				</table>
			</div>
		</div><!-- print webNone end -->
	</div><!-- content end -->
</div>
</body>
</html>