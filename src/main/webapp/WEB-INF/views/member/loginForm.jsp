<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="js/jquery-3.7.0.min.js"></script>


<div class="cont">
	<div class="form sign-in">
		<form action="loginControl.do" id="loginForm" name="loginForm">
			<h2>CAMPERS 회원님 반갑습니다!</h2>
			<label>
			  <span>아이디</span>
			  <input type="text" id="userId" name="userId" class="input-linetype" value="user01">
			</label>
			<label>
			  <span>비밀번호</span>
			  <input type="password" id="userPw" name="userPw" class="input-linetype" value="user01">
			</label>
			<p class="forgot-pass" onclick=find()>아이디/비밀번호를 잊으셨나요?</p><br>
			<button type="button" class="fb-btn" onclick="location.href ='memberJoinType.do'">회원가입</button>
			<button type="submit" class="submit">로그인</button>
			<p>${message }</p>
		</form>

		<div id="findInfo" name="findInfo" style="display: none;">
			<hr><br>
			<button class="simple-btn" id="searchId" name="searchId" onclick=searchId()>아이디 찾기</button>
			<button class="simple-btn" id="searchPw" name="searchPw" onclick=searchPw()>비밀번호 찾기</button>
			<br><br>
			<form action="" id="findMember" name="findMember">
				<label>
				  <span>이름</span>
 				  <input type="text" id="userName" name="userName" class="input-linetype">
				</label>

				<div class="formInputId" style="display: none;">
					<label>
						<span>아이디</span>
						<input type="text" id="memberId" name="memberId" class="input-linetype">
					</label>
				</div>
				
				<label>
					<span>아이디</span>
					<input type="email" id="userEmail" name="userEmail" class="input-linetype">
				</label>
				<br><br>
				<p id="findMsg"></p>
				
				<input type="button" id="search" value="getId" onclick=findMemberIdPw()>
				<br><br>
			</form>
		</div>
		
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