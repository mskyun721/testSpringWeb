<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 등록</title>
<link href="resources/css/default.css" rel="stylesheet" type="text/css">
<link href="resources/css/table.css" rel="stylesheet" type="text/css">
<link href="resources/font/fontawesome/css/all.min.css" rel="stylesheet" type="text/css">
</head>
<body>
<div>
	<div class="marginLeft_30 floatLeft"><h3>사용자 등록</h3></div>
</div>
<div class="clear"></div>
<div class="marginLeft_20">
	<form action="insertUser" method="post" class="subPageForm">
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="USERID">ID</label></div>
				<input type="text" size="10" name="USERID" required="required" value="${oneUser.USERID }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="floatLeft">
					<div class="lbWidth"><label for="USERPW">Password</label></div>
					<input type="text" size="10" name="USERPW" required="required" value="${oneUser.USERPW }">
				</div>
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="USERNM">이름</label></div>
				<input type="text" size="10" name="USERNM" value="${oneUser.USERNM }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="JOBGRADE">직급</label></div>
				<input type="text" size="10" name="JOBGRADE" value="${oneUser.JOBGRADE }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="USERTYPE">타입</label></div>
				<input type="text" size="10" name="USERTYPE" value="${oneUser.USERTYPE }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="VIEWTYPE">조회권한</label></div>
				<c:choose>
					<c:when test="${oneUser.VIEWTYPE == 'N' }">
						<select id="VIEWTYPE" name="VIEWTYPE">
							<option value="N" selected>N</option>
							<option value="Y">Y</option>
						</select>
					</c:when>
					<c:when test="${oneUser.VIEWTYPE == 'Y' }">
						<select id="VIEWTYPE" name="VIEWTYPE">
							<option value="N" >N</option>
							<option value="Y" selected>Y</option>
						</select>
					</c:when>
					<c:otherwise>
						<select id="VIEWTYPE" name="VIEWTYPE">
							<option value="N" selected>N</option>
							<option value="Y" >Y</option>
						</select>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="HPNUMBER">전화번호</label></div>
				<input type="text" size="10" name="HPNUMBER" value="${oneUser.HPNUMBER }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="HPNUMBER2">비상연락망</label></div>
				<input type="text" size="10" name="HPNUMBER2" value="${oneUser.HPNUMBER2 }">
			</div>
		</div>
		<div class="clear"></div>
		<div class="formRow">
			<div class="floatLeft width200">
				<div class="lbWidth"><label for="REMARK">비고</label></div>
				<input type="text" size="10" name="REMARK" value="${oneUser.REMARK }">
			</div>
		</div>
		<div class="clear"></div>
		<br>
		<div class="buttonBox">
		<button type="submit"><i class="fas fa-save" style="font-size:15px;"></i>&nbsp;&nbsp;저장</button>&nbsp;
		<button type="button" onclick="window.close; return false;"><i class="fas fa-window-close" style="font-size:15px;"></i>&nbsp;&nbsp;취소</button>
		</div>
	</form>
</div>
</body>
</html>