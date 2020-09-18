<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title></title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="user-scalable=yes, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width">
	<meta name="title" content="">
	<meta name="author" content="">
	<meta name="keywords" content="">
	<meta name="subject" content="">
	<meta name="Description" content="">
	<meta name="classification" content="">
	
	<!-- 카카오톡 링크 보낼 때 뜨는 이미지와 텍스트 설정 -->
	<meta property="og:type" content="website">
	<meta property="og:title" content=""> <!-- 제목에 뜰 내용(굵은글씨) -->
	<meta property="og:url" content="">	<!-- 링크걸릴주소 -->
	<meta property="og:description" content=""> <!-- 제목아래쪽에 한줄 나오는 짧은 소개글 -->
	<meta property="og:image" content=""> <!-- 썸네일이미지 경로 -->
	
	<link type="text/css" href="resources/style/default.css" rel="stylesheet">
	<link type="text/css" href="resources/style/common.css" rel="stylesheet">
	<link type="text/css" href="resources/style/layout.css" rel="stylesheet">
	<link type="text/css" href="resources/style/design.css" rel="stylesheet">
	<link href="resources/font/fontawesome/css/all.css" rel="stylesheet" type="text/css">
    
	<script src="resources/script/jquery.1.12.0.min.js"></script>
	<script src="resources/script/script.js"></script>

</head>
<body>
<script>
	$(function(){

		$('.btn_menu').click(function(){
			if( $(this).hasClass('on') ){
				$('nav.btm').slideUp(200);
				$(this).removeClass('on');
			}else{
				$('nav.btm').slideDown(200);
				$(this).addClass('on');
			}
		});

		$(window).resize(function(){
			var winW = $(window).width();
			if( winW > 991 ){
				$('nav.btm').show();
			}
		});
	});
</script>

<!-- header -->
<jsp:include page="public/header.jsp"/>
<!-- header -->
<div class="row">
  <div>
    <div class="card">
      <h3><i class="fas fa-caret-right"></i> 매장별 검침등록</h3>
      <hr />
      <p>Some text about me in culpa qui officia deserunt mollit anim..</p>
      </div>
   </div>
  </div>

<div class="footer">
  <address>Footer</address>
</div>

</body>
</html>