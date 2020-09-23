<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNSOFT</title>
<link type="text/css" href="../resources/style/default.css" rel="stylesheet">
<link type="text/css" href="../resources/style/common.css" rel="stylesheet">
<link type="text/css" href="../resources/style/layout.css" rel="stylesheet">
<link type="text/css" href="../resources/style/design.css" rel="stylesheet">
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css">
<link href="../resources/css/print.css" rel="stylesheet" type="text/css">
<link href="../resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#STDATE").change(function () {
		var cstnm = $('#CSTNM').val();
		var complet = $('#COMPLET').val();
		var approval = $('#APPROVAL').val();
		var stdate = $('#STDATE').val();
		var ltdate = $('#LTDATE').val();
		
		location.href="/sunsoft/corpRequest/corpRequest?CSTNM="+cstnm+"&APPROVAL="+approval+"&COMPLET="+complet+"&STDATE="+stdate+"&LTDATE="+ltdate;
	});
	$("#LTDATE").change(function () {
		var cstnm = $('#CSTNM').val();
		var complet = $('#COMPLET').val();
		var approval = $('#APPROVAL').val();
		var stdate = $('#STDATE').val();
		var ltdate = $('#LTDATE').val();
		
		location.href="/sunsoft/corpRequest/corpRequest?CSTNM="+cstnm+"&APPROVAL="+approval+"&COMPLET="+complet+"&STDATE="+stdate+"&LTDATE="+ltdate;
	});
	
	
	$('#APPROVAL').change(function(){
		var cstnm = $('#CSTNM').val();
		var approval = $(this).val();
		var complet = $('#COMPLET').val();
		var stdate = $('#STDATE').val();
		var ltdate = $('#LTDATE').val();
		location.href="/sunsoft/corpRequest/corpRequest?CSTNM="+cstnm+"&APPROVAL="+approval+"&COMPLET="+complet+"&STDATE="+stdate+"&LTDATE="+ltdate;
	});
	
	$('#COMPLET').change(function(){
		var cstnm = $('#CSTNM').val();
		var approval = $('#APPROVAL').val();
		var complet = $(this).val();
		var stdate = $('#STDATE').val();
		var ltdate = $('#LTDATE').val();
		location.href="/sunsoft/corpRequest/corpRequest?CSTNM="+cstnm+"&APPROVAL="+approval+"&COMPLET="+complet+"&STDATE="+stdate+"&LTDATE="+ltdate;
	});
	
	var popUpX = (window.screen.width/2)-400;
	$('#add').click(function(){
		window.open('RequestForm','_blank','width=670, height=800, left='+popUpX);
	});
	
	$('[id^=edit]').click(function(){
		var id = $(this).attr("id");
		var num = id.replace("edit","");
		var reqdate = $('#REQDATE'+num).val();
		var reqno = $('#REQNO'+num).val();
		window.open('/sunsoft/corpRequest/RequestForm?REQDATE='+reqdate+'&REQNO='+reqno,'_blank','width=670, height=800, left='+popUpX);
	});
	
	$("[id^=btnDel]").click(function () {
		var confirmResult = confirm("삭제하시겠습니까?");
		var id = $(this).attr("id");
		var num = id.replace("btnDel","");
		var reqdate = $('#REQDATE'+num).val();
		var reqno = $('#REQNO'+num).val();
		if (confirmResult) {
			$.ajax({
				url:"requestDel",
				type:"get",
				data:{REQDATE:reqdate,REQNO:reqno},
				success:function(data){
					location.reload();
				}
			});
		}
		
	});
	
});
</script>
</head>
<body>
<!-- header -->
<div class="printNone"><jsp:include page="../public/header.jsp"/></div>
<!-- header -->
<div class="row printNone">
	<div>
		<div class="card">
			<h3><i class="fas fa-caret-right"></i>업체 요청 사항</h3>
			<hr />
			<div >
				<form>
					<div class="searchBox" style="display: flex;">
						<div style="display: inline;position: static;height: 100%;">
							<label>사업장</label>
							<input type="text" size="10" id="CSTNM" name="CSTNM" value="${CSTNM }">&nbsp;
							<button type="button" onclick="window.open('/sunsoft/corpRequest/CstcdSearch','searchCst','width=640,height=855')"><i class="fas fa-object-ungroup"style="font-size:15px;"></i>&nbsp;&nbsp;조회</button>
						</div>
						
						<div style="display: inline; position: relative; left: 10em;">
								<label>승인여부</label>
								<c:choose>
									<c:when test="${APPROVAL == '1'}">
										<select id="APPROVAL" name="APPROVAL"class="comboSize" id="APPROVAL">
											<option value="0" >전체</option>
											<option value="1" selected>미보고</option>
											<option value="2">승인</option>
											<option value="3">보류</option>
											<option value="4">미승인</option>
										</select>
									</c:when>
									<c:when test="${APPROVAL == '2'}">
										<select id="APPROVAL" name="APPROVAL" class="comboSize" id="APPROVAL">
											<option value="0" >전체</option>
											<option value="1" >미보고</option>
											<option value="2" selected>승인</option>
											<option value="3">보류</option>
											<option value="4">미승인</option>
										</select>
									</c:when>
									<c:when test="${APPROVAL == '3'}">
										<select id="APPROVAL" name="APPROVAL" class="comboSize" id="APPROVAL">
											<option value="0" >전체</option>
											<option value="1" >미보고</option>
											<option value="2">승인</option>
											<option value="3" selected>보류</option>
											<option value="4">미승인</option>
										</select>
									</c:when>
									<c:when test="${APPROVAL == '4'}">
										<select id="APPROVAL" name="APPROVAL" class="comboSize" id="APPROVAL">
											<option value="0" >전체</option>
											<option value="1" >미보고</option>
											<option value="2">승인</option>
											<option value="3">보류</option>
											<option value="4" selected>미승인</option>
										</select>
									</c:when>
									<c:otherwise>
										<select id="APPROVAL" name="APPROVAL" class="comboSize" id="APPROVAL">
											<option value="0" selected>전체</option>
											<option value="1">미보고</option>
											<option value="2">승인</option>
											<option value="3">보류</option>
											<option value="4">미승인</option>
										</select>
									</c:otherwise>
								</c:choose><br>
								<label>완료여부</label>
								<c:choose>
									<c:when test="${COMPLET == 'Y'}">
										<select id="COMPLET" name="COMPLET" class="comboSize" id="COMPLET">
											<option value="0">전체</option>
											<option value="Y"selected >Y</option>
											<option value="N">N</option>
										</select>
									</c:when>
									<c:when test="${COMPLET == 'N'}">
										<select id="COMPLET" name="COMPLET" class="comboSize" id="COMPLET">
											<option value="0">전체</option>
											<option value="Y" >Y</option>
											<option value="N" selected>N</option>
										</select>
									</c:when>
									<c:otherwise>
										<select id="COMPLET" name="COMPLET" class="comboSize" id="COMPLET">
											<option value="0" selected>전체</option>
											<option value="Y">Y</option>
											<option value="N">N</option>
										</select>
									</c:otherwise>
								</c:choose>
							</div>
						<div style="position: relative;left: 20em;">
							<div style="display: flex;">
								<div><label>요청일</label></div>
								<div style="display: inline; position: relative;left: 1em;">
									<input type="date" size="5" name="STDATE" id="STDATE" value=${STDATE }><br>
									<input type="date" size="5" name="LTDATE" id="LTDATE" value=${LTDATE }>
								</div>
							</div>
						</div>
					</div><!-- searchBox end -->
				</form>
			</div><!-- form end -->
			<div>
				<table class="table100">
					<thead>
						<tr><th style="width: 5%"><button type="button" id="add" style="background-color: #1467b3;color: white;"><i class="fas fa-plus-square"></i>&nbsp;&nbsp;add</button></th>
							<th style="width: 5%">No.</th>
							<th style="width: 15%">날짜</th>
							<th style="width: 20%">거래처명</th>
							<th style="width: 10%">담당자</th>
							<th style="width: 10%">요청자</th>
							<th style="width: 10%">승인여부</th>
							<th style="width: 5%">완료여부</th>
							<th style="width: 15%">완료날짜</th>
							<th style="width: 5%"></th></tr>
					</thead>
					<tbody id="reqList">
						<c:forEach items="${reqList }" var="list" varStatus="i">
							<tr><td width="10"><button type="button" id="edit${i.index }"><i class="fas fa-edit"></i>edit</button></td>
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
								<td><button type="button" id="btnDel${i.index }"><i class="fas fa-trash-alt" style="font-size:15px;"></i>Del</button></td>
							</tr>
							<input type="hidden" id="REQDATE${i.index }" value="${list.REQDATE }">
							<input type="hidden" id="REQNO${i.index }" value="${list.REQNO }">
						</c:forEach>
					</tbody>
				</table>
			</div><!-- table end -->
		</div><!-- row end -->
	</div>
</div>

		<div class="webNone">
			<div class="marginLeft_100 marginTop_50"><h1>업체요청사항</h1></div><br>
			<table class="marginLeft approTable">
				<tr><td rowspan="2" style="width: 10%;">결<br>재</td>
					<td style="width: 18%;">담당자</td>
					<td style="width: 18%;">과장</td>
					<td style="width: 18%;">차장</td>
					<td style="width: 18%;">차장</td>
					<td style="width: 18%;">사장</td></tr>
				<tr><td height="50"></td>
					<td height="50"></td>
					<td height="50"></td>
					<td height="50"></td>
					<td height="50"></td></tr>
			</table>
			<div class="hiddenBlock"></div>
			<div>
				<table class="print_table">
					<tr height="20"><td width="100" rowspan="2"><b>요청일</b></td>
						<td id="prt_REQDATE" width="200" rowspan="2" ></td>
						<td width="100"><b>거래처</b></td>
						<td id="prt_CSTNM"></td>
						<td width="100"><b>요청자</b></td>
						<td id=prt_CSTEMPNM></td></tr>
					<tr><td width="100"><b>담당자</b></td>
						<td id="prt_USERNM"></td>
						<td width="100"><b>승인여부</b></td>
						<td id="prt_APPROVAL"></td></tr>
					<tr height="400"><td><pre><b>요 청</b><br><br><b>사 항</b></pre></td>
						<td colspan="5" class="dataPre"><pre class="dataPre" id="prt_REQCONT"></pre></td></tr>
					<tr height="40"><td width="100"><b>완료일</b></td>
						<td colspan="2" id="prt_CPTDATE"></td>
						<td width="100"><b>완료여부</b></td>
						<td colspan="2" id="prt_COMPLET"></td></tr>
					<tr height="400"><td><pre><b>완 료</b><br><br><b>내 용</b></pre></td>
						<td colspan="5" class="dataPre"><pre class="dataPre" id="prt_CPTCONT"></pre></td></tr>
				</table>
			</div>
			
		</div><!-- print webNone end -->
<!-- footer -->
<div class="printNone"><jsp:include page="../public/footer.jsp"/></div>
<!-- footer -->
</body>
</html>