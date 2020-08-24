<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="sidebar" class="printNone">
	<div id="logo">
		<a href="/sunsoft/index"><img alt="logo" src="http://www.sunsoft.kr/images/sunsoft_logo.png"></a>
	</div>
	<div class="clear"></div>
	<div id="session">
		<span>${sessionScope.USERNM }&nbsp;${sessionScope.JOBGRADE }</span>
	</div>
	<div id="leftMenu">
		<div class="dropMenu">
			<input type="checkbox" class="dropCheck" id="dropCheck1">
			<label for="dropCheck1" class="clickDrop">기초코드관리</label>
			<div class="dropDiv">
				<a href="/sunsoft/addUser">사용자 관리</a>
				<a href="/sunsoft/corpManage">거래처 관리</a>
			</div>
		</div>
		<div class="dropMenu">
			<input type="checkbox" class="dropCheck" id="dropCheck2">
			<label for="dropCheck2" class="clickDrop">주간업무</label>
			<div class="dropDiv">
				<a href="/sunsoft/weeklyBoard/weeklyBoard">주간 업무일지</a>
				<a href="/sunsoft/weeklyBoard/weeklyBoardList">주간 업무일지조회</a>
			</div>
		</div>
		<div class="dropMenu">
			<input type="checkbox" class="dropCheck" id="dropCheck3">
			<label for="dropCheck3" class="clickDrop">업체요청</label>
			<div class="dropDiv">
				<a href="/sunsoft/corpRequest/corpRequest">업체 요청 사항</a>
				<a href="/sunsoft/corpRequest/corpRequestList">업체 요청 조회</a>
			</div>
		</div>
	</div>
</div>