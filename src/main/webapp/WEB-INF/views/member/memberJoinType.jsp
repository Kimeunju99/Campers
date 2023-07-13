<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.7.0.min.js"></script>

<h3>회원 유형 선택</h3>
<div class="joinType">
	<div class="general">
		<h4>일반</h4>
		<button class="getGeneral" value="general" onclick=getUserAuth()>일반회원 가입하기</button>
	</div>
	<div class="business">
		<h4>업체</h4>
		<button class="getBusiness" value="business" onclick=getUserAuth()>비지니스 계정 가입하기</button>
	</div>
</div>

<script>
	let userAuth = ""

	$('.joinType').children().css('width','250px');
	$('.joinType').children().css('height','250px');
	$('.joinType').children().css('display','inline-block');
	$('.joinType').children().css('margin','10px');
	
	function getUserAuth(){
		userAuth = $(event.target).val();
		location.href="memberJoin.do?userAuth="+userAuth;
	}
</script>