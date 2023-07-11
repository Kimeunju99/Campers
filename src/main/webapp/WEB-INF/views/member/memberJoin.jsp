<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.7.0.min.js"></script>

<div class="joinForm">
	<h4>회원가입</h4>
	<div>
		<form action="">
			<table>
				<tr>
					<td class="tdName"><span class="redtext">* </span>아이디</td>
					<td class="tdValue"><input type="text" id="userId" name="userId"></td>
					<td class="tdButton"><input type="button" id="ckId" name="ckId" onclick=checkId() value="중복체크"></td>
					<td class="tdDisplayNone"><input type="text" id="checkedId" value="false" disabled></td>
				</tr>
				<tr>
					<td class="tdName"><span class="redtext">* </span>비밀번호</td>
					<td class="tdValue"><input type="password" id="userPw" name="userPw" minlength="8"></td>
					<td class="tdDisplayNone"></td>
				</tr>
				<tr>
					<td class="tdName">비밀번호 확인</td>
					<td class="tdValue"><input type="password" id="userPwCk" name="userPwCk" minlength="8"></td>
					<td class="tdDisplayNone"><input type="text" id="checkedPassword" value="false" disabled></td>
				</tr>
				<tr>
					<td class="tdName"><span class="redtext">* </span>이름</td>
					<td class="tdValue"><input type="text" name="userName" id="userName"></td>
					<td class="tdDisplayNone"></td>
				</tr>
				<tr>
					<td class="tdName"><span class="redtext">* </span>이메일</td>
					<td class="tdValue"><input type="email" id="userEmail" name="userEmail"></td>
					<td class="tdButton"><input type="button" id="ckEmail" name="ckEmail" onclick=checkEmail() value="메일인증"></td>
					<td class="tdDisplayNone"><input type="text" id="checkedEmail" value="false" disabled></td>
				</tr>
				<tr>
					<td class="tdName"><span class="redtext"> </span>인증번호</td>
					<td class="tdValue"><input type="text" id="number" name="number"></td>
					<td class="tdButton"><input type="button" onclick=numberCheck() value="인증"></td>
				</tr>
				<tr>
					<td class="tdName"><span class="redtext">* </span>전화번호</td>
					<td class="tdValue"><input type="text" id="userTel" name="userTel" placeholder="010-0000-0000"></td>
					<td class="tdDisplayNone"></td>
				</tr>
				<tr>
					<td class="tdName">주소</td>
					<td class="tdValue"><input type="text" id="userAddr" name="userAddr"></td>
					<td class="tdDisplayNone"></td>
				</tr>
			</table>
		</div>
		<div><span class="redtext">* </span>는 필수 정보입니다.</div>
		
		<div>
			<input type="submit" value="가입하기">
	        <input type="reset" value="다시작성">
		</div>

<script>
	$('.redtext').css('color','red');
	$('.tdName').css('width','120px');

	$('.tdDisplayNone').css('display','none');

	$('#userId').change(idType);
	
	function idType(){
		console.log($('#userId').val());
	}
	
	function checkId(){	// 아이디 중복체크
		let id = $('#userId').val();
		if (id == ""){
			alert("아이디를 입력하지 않았습니다.");
			return false;
		}
		$.post(
			"userIdCheck.do",
			{ userId: id },
			function(data){
				if (data == "success"){
					$('#checkedId').val("false");
				} else {
					$('#checkedId').val("true");
				}
			}
				)
	} // end of checkId()
	
	$('#userPwCk').change(checkPassword);
	
	function checkPassword(){	// 비밀번호-비밀번호 확인 일치하는지 체크
		let pw1 = $('#userPw').val();
		let pw2 = $('#userPwCk').val();
		if(pw1 == pw2){
			$('#checkedPassword').val("true");
			$('tbody').children().eq(2).append("<td>비밀번호가 일치합니다.</td>");
		} else if(pw1 != pw2){
			$('#checkedPassword').val("false");
			$('tbody').children().eq(2).append("<td>비밀번호가 일치하지 않습니다. </td>")
		}
	}
	
	function checkEmail(){	// 인증메일 발송
		let email = $('#userEmail').val()
		$.post(
			"mailCertification.do",
			{ userEmail: email },
			function(data){
				let num = data.toString();
				$('#checkedEmail').val(num);
			}
		)
	}	//end of checkEmail()
	
	function numberCheck(){	// 이메일 인증번호 확인
		if( $('#checkedEmail').val() != $('#number').val() ){
			alert("인증번호가 일치하지 않습니다.");			 
		} else {
			$('#checkedEmail').val("true");
			$('tbody').children().eq(5).children().eq(2).append("<span>인증완료 </span>")
		}
	} // end of numberCheck()

</script>