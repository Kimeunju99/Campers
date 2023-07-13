<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="js/jquery-3.7.0.min.js"></script>

<div>
	<div>
		<form action="loginControl.do" id="loginForm" name="loginForm">
			<h4>로그인</h4>
			<p>아이디</p>
			<input type="text" id="userId" name="userId" value="user01">
			<br>
			<p>비밀번호</p>
			<input type="password" id="userPw" name="userPw" value="user01">
			<br><br>
			<input type="submit" value="로그인">
			<p>${message }</p>
			<br><br>
		</form>
	</div>
	<div>
		<input type="button" onclick=location.href="memberJoinType.do" value="회원가입">
		<input type="button" onclick=find() value="아이디/비밀번호 찾기">
		<br><br>
	</div>
	<hr>
	<div id="findInfo" name="findInfo" style="display: none;">
		<button id="searchId" name="searchId" onclick=searchId()>아이디 찾기</button>
		<button id="searchPw" name="searchPw" onclick=searchPw()>비밀번호 찾기</button>
		<br><br>
		<form action="" id="findMember" name="findMember">
			<p>이름</p>
			<input type="text" id="userName" name="userName">
			<br>
			<div class="formInputId" style="display: none;">
				<p>아이디</p>
				<input type="text" id="memberId" name="memberId">
				<br>
			</div>
			<p>이메일</p>
			<input type="email" id="userEmail" name="userEmail">
			<br><br>
			<p id="findMsg"></p>
			
			<input type="button" id="search" value="getId" onclick=findMemberIdPw()>
		</form>
	</div>
	
</div>

<script type="text/javascript">
	$('p').css('display', 'inline-block');
	
	function searchId(){
		$('#findMsg').text("");
		$('.formInputId').css('display', 'none');
		$('#search').val("getId");
	}

	function searchPw(){
		$('#findMsg').text("");
		$('.formInputId').css('display', 'block');
		$('#search').val("getPassword");
	}
	
	function find(){
		$('#findInfo').css('display', 'block');
	}

	function findMemberIdPw() {
		let name = document.getElementById('userName').value;
		let email = document.getElementById('userEmail').value;
		let id = document.getElementById('memberId').value;
		$('#findMsg').text("조회중입니다.")
		
		if($('#search').val() == "getId"){	// id 찾기
			$.ajax({
				url : "findMemberId.do",
				method : "POST",
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
				},
				data : {
					userName : name,
					userEmail : email
				},
				success : function(result){
					let memberInfo = JSON.parse(result);
					if (memberInfo == null){
						$('#findMsg').text("일치하는 정보가 없습니다.");
					} else {
						$('#findMsg').text("찾으시는 아이디는 [ " + memberInfo.userId + " ] 입니다.");
					}
				},
				error : function(e){
					console.log(e);
					$('#findMsg').text("요청하는중 오류가 발생했습니다.");
				}
			});
		} else if ($('#search').val() == "getPassword"){	// 비밀번호 찾기

			$.ajax({
				url : "resetMemberPassword.do",
				method : "POST",
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
				},
				data : {
					userName : name,
					userEmail : email,
					userId : id
				},
				success : function(result){
					console.log(result);
					if(result == 'success'){
						$('#findMsg').text("임시 비밀번호가 메일로 발송되었습니다.");
					}
				},
				error : function(e){
					console.log(e);
					$('#findMsg').text("요청하는중 오류가 발생했습니다.");
				}
			});
		}
		
	}	// end of findMemberIdPw
</script>