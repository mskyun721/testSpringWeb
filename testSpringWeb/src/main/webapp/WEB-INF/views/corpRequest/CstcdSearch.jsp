<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 검색</title>
<link href="../resources/css/default.css" rel="stylesheet" type="text/css">
<link href="../resources/css/table.css" rel="stylesheet" type="text/css">
</head>
<body>
<div>
	<div class="marginLeft_30 floatLeft"><h3>거래처 검색</h3></div>
</div>
<div class="clear"></div>
<div class="marginLeft_20">
	<input type="text" size="20"><button>검색</button>
</div>
<div>
	<table class="table450 marginLeft_20">
		<thead><tr>
			<th>No.</th>
			<th>거래처코드</th>
			<th>거래처</th>
			<th>구분</th>
			<th>담당자</th>
			<th>업태</th>
			<th>업종</th>
			<th>전화번호</th>
			</tr></thead>
		<tbody>
		<c:forEach items="corpList" var="list" varStatus="i">
			<tr><td>${i.index }</td>
				<td>${list.CSTCD }</td>
				<td>${list.CSTNM }</td>
				<td>${list.CSTTYPE }</td>
				<td>${list.CSTEMPNM }</td>
				<td>${list.CSTKIND }</td>
				<td>${list.CSTITEM }</td>
				<td>${list.TELNO }</td></tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>