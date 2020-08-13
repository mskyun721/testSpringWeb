<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="sidebar">
	<div id="logo">
		<a href="/sunsoft"><img alt="logo" src="http://www.sunsoft.kr/images/sunsoft_logo.png"></a>
	</div>
	<div class="clear"></div>
	<div id="session">
		<c:if test="${USERID != '' }">${USERID }</c:if>
	</div>
	<div id="leftMenu">
		<nav>
		<ul>
			<!-- <li><a href="weeklyBoard.jsp" onclick="window.open(this.href,'_blank','width=500, height=500'); return false">주간 업무일지</a></li> -->
			<li><a href="/sunsoft/addUser">사용자 관리</a></li>
			<li><a href="/sunsoft/corpManage">거래처 관리</a></li>
			<li><a href="/sunsoft/weeklyBoard/weeklyBoard">주간 업무일지</a></li>
			<li><a href="/sunsoft/weeklyBoard/weeklyBoardList">주간 업무일지조회</a></li>
			<li><a href="/sunsoft/corpRequest/corpRequest">업체 요청 사항</a></li>
			<li><a href="/sunsoft/corpRequest/corpRequestList">업체 요청 조회</a></li>
			
		</ul>
	</nav>
	</div>
	
</div>