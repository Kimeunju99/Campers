<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.7.0.min.js"></script>

<h3>회원 유형 선택</h3>
<div class="joinType">
	<div class="general" onclick=getUserAuth()>
		<img src="images/icon/Gjoin.png">									<!-- 이미지 소스 넣기 -->
		<h3>일반 회원 가입</h3>
	</div>
	<div class="business" onclick=getUserAuth()>
		<img src="images/icon/Bjoin.png">									<!-- 이미지 소스 넣기 -->
		<h3>업체 회원 가입</h3>
	</div>
</div>

<script>
	let userAuth = ""
	
	function getUserAuth(){
		userAuth = $(event.target).val();
		location.href="memberJoin.do?userAuth="+userAuth;
	}
</script>