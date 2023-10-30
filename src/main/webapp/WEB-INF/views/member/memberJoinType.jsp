<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/memberJoin.css"/>
<script src="js/jquery-3.7.0.min.js"></script>
</head>
<body>

<h3 style="margin-top: 30px">회원가입 유형을 선택하세요</h3>
<div class="joinType" style="margin-top: 80px">
	<div class="general" onclick=getUserAuthGeneral()>
		<img src="images/icon/Gjoin.png">									<!-- 이미지 소스 넣기 -->
		<h3>일반 회원 가입</h3>
	</div>
	<div class="business" onclick=getUserAuthBusiness()>
		<img src="images/icon/Bjoin.png">									<!-- 이미지 소스 넣기 -->
		<h3>업체 회원 가입</h3>
		<input type="hidden" value="business" >
	</div>
</div>

<script>
	let userAuth = ""
	
	function getUserAuthGeneral(){
		location.href="memberJoin.do?userAuth=general";
	}
	
	function getUserAuthBusiness(){
		location.href="memberJoin.do?userAuth=business";
	}
</script>
</body>
</html>