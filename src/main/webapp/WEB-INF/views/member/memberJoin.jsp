<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/memberJoin.css"/>
<script src="js/jquery-3.7.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

<div id="join-form-div">
	<h5>회원가입</h5>
	<hr>
	<form action="memberJoinControl.do" id="form" method="post">
		<input type="text" class="inputValCheck" id="userAuth" name="userAuth" value="${userAuth}" readonly>
		<table>
			<tr>
				<td class="tdName"><span class="redtext">* </span>아이디</td>
				<td class="tdVal">
					<input type="text" class="inputValue" id="userId" name="userId" minlength="6" onkeydown=inputNotKor(this)>
					<input type="button" class="inputBtn" id="ckId" name="ckId" onclick=checkId() value="중복체크"><br>
					<span class="note" id="noteId">아이디는 최소 6자 이상으로 영문, 숫자만 사용 가능합니다.</span>
					<input type="text" class="inputValCheck" id="checkedId" value="false" disabled>
				</td>
			</tr>
			<tr>
				<td class="tdName"><span class="redtext">* </span>비밀번호</td>
				<td class="tdVal">
					<input type="password" class="inputValue" id="userPw" name="userPw" minlength="8" size="14" onchange=passwordCheck()><br>
					<span class="note" id="notePw"> 비밀번호는 최소 8자 입니다.</span>
					<input type="text" class="inputValCheck" id="checkedPw" value="false" disabled>
				</td>
			</tr>
			<tr>
				<td class="tdName">비밀번호 확인</td>
				<td class="tdVal">
					<input type="password" class="inputValue" id="userPwCk" name="userPwCk" minlength="8" size="14" onchange=samePassword()><br>
					<span class="note" id="notePassword"></span>
					<input type="text" class="inputValCheck" id="checkedPassword" value="false" disabled>
				</td>
			</tr>
			<tr>
				<c:if test="${userAuth eq 'general'}">
					<td class="tdName"><span class="redtext">* </span>이름</td>
				</c:if>
				<c:if test="${userAuth eq 'business'}">
					<td class="tdName"><span class="redtext">* </span>업체명</td>
				</c:if>			
				<td class="tdVal">
					<input type="text" class="inputValue" name="userName" id="userName" size="8">
				</td>
			</tr>
			<tr>
				<td class="tdName"><span class="redtext">* </span>이메일</td>
				<td class="tdVal">
					<input type="text" class="inputValue" id="userEmail" name="userEmail" size="10">@
					<input type="text" class="inputValue" id="userEmail2" name="userEmail2" size="10" readonly>
					<select id="selectMail" onchange=mailDomain()>
						<option value="naver.com">naver.com</option>
						<option value="gmail.com">gmail.com</option>
						<option value="daum.net">daum.net</option>
						<option value="nate.com">nate.com</option>
						<option value="etc">직접입력</option>
					</select>
					<input type="button" class="inputBtn" id="ckEmail" name="ckEmail" onclick=checkEmail() value="메일인증"><br>
					<span class="note" id="noteMail"></span>
					<input type="text" class="inputValCheck" id="checkedEmail" value="false" disabled>
				</td>
			</tr>
			<tr>
				<td class="tdName">인증번호</td>
				<td class="tdVal">
					<input type="text" class="inputValue" id="number" name="number" size="8">
					<input type="button" class="inputBtn" onclick=numberCheck() value="인증"><br>
					<span class="note" id="noteNumber"></span>
					<input type="text" class="inputValCheck" id="checkedEmailNum" value="false" disabled>
			</tr>
			<tr>
				<td class="tdName"><span class="redtext">* </span>전화번호</td>
				<td class="tdVal">
					<input type="text" class="inputValue" id="userTel1" name="userTel1" size="2" oninput=inputNumberOnly(this) maxlength="3">  - 
					<input type="text" class="inputValue" id="userTel2" name="userTel2" size="3" oninput=inputNumberOnly(this) maxlength="4">  - 
					<input type="text" class="inputValue" id="userTel3" name="userTel3" size="3" oninput=inputNumberOnly(this) maxlength="4">
				</td>
			</tr>
			<tr>
				<td class="tdName">주소</td>
				<td class="tdVal">
					<input type="text" class="inputValue" id="userAddr" name="userAddr" size="31"  placeholder="주소"><br>
					<input type="text" class="inputValue" id="userAddr2" name="userAddr2" size="10" placeholder="상세주소">
					<input type="text" class="inputValue" id="userAddr3" name="userAddr3" size="15" placeholder="참고항목">
					<input type="button" class="inputBtn" onclick="sample6_execDaumPostcode()" value="주소검색">
				</td>
			</tr>
		</table>
		<div><br><span class="redtext">* </span>는 필수 정보입니다.</div>
		<div>
			<input id="submit-btn" type="button" value="가입하기" onclick=checkField() >
			<input id="reset-btn" type="reset" value="다시작성">
		</div>
	</form>
</div>
		

<script>
	function checkField(){	// 필수 필드값 확인
		if($('#checkedId').val() == "false"){
			alert("아이디 중복체크를 하지 않았습니다.")
			$('#userId').focus();
			return false;
		}
		if($('#checkedPw').val() == "false"){
			alert("비밀번호 조건에 맞지 않습니다.")
			$('#userPw').focus();
			return false;
		}
		if($('#checkedPassword ').val() == "false"){
			alert("비밀번호가 일치하지 않습니다.")
			$('#userPwCk').focus();
			return false;
		}
		if($('#userName').val() == ""){
			alert("이름을 입력하세요.")
			$('#userName').focus();
			return false;
		}
		if($('#checkedEmailNum ').val() == "false"){
			alert("이메일 인증을 해주세요.")
			$('#userEmail').focus();
			return false;
		}
		if($('#userTel1').val()=="" || $('#userTel2').val()=="" || $('#userTel3').val()==""){
			alert("전화번호를 입력하세요.")
			$('#userTel1').focus();
			return false;
		}
		
		console.log($('#userAuth').val());
		$('#form').submit();
	}
	
	
	function inputNotKor(el) {	// 한글 입력 방지
		el.value = el.value.replace(/[^a-zA-Z0-9]/g, '');
	}
	
	
	function chkCharCode(event, type){	// 아이디에 한글 입력 X
		console.log($('#userId').val());
		let regExp = /[^0-9a-zA-Z]/g;
		let ele = event.target;
		if (regExp.test(ele.value)) {
		  ele.value = ele.value.replace(regExp, '');
		}
	};
	
	function checkId(){	// 아이디 중복체크
		let id = $('#userId').val();
		if (id == ""){
			alert("아이디를 입력하지 않았습니다.");
			$('#noteId').text("아이디는 최소 6자 이상으로 영문, 숫자만 사용 가능합니다.").css('color', 'dimgray');
			$('#checkedId').val("false");
			return false;
		}
		console.log(id.length)
		if (id.length < 6){
			alert("아이디는 최소 6자 이상입니다.");
			$('#noteId').text("아이디는 최소 6자 이상으로 영문, 숫자만 사용 가능합니다.").css('color', 'dimgray');
			$('#checkedId').val("false");
			return false;
		}
		$.post(
			"userIdCheck.do",
			{ userId: id },
			function(data){
				if (data == "success"){
					$('#checkedId').val("false");
					$('#noteId').text("\t\t 이미 사용중인 아이디입니다.").css('color','red');
				} else {
					$('#checkedId').val("true");
					$('#noteId').text("\t\t 사용 가능한 아이디입니다.").css('color', 'blue');
				}
			}
				)
	} // end of checkId()
	
	// 비밀번호 8자 이상
	function passwordCheck(){
		if($('#userPw').val().length < 8){
			$('#checkedPw').val("false");
		}
		if($('#userPw').val().length > 7){
			$('#checkedPw').val("true");
		}
	}

	
	function samePassword(){	// 비밀번호-비밀번호 확인 일치하는지 체크
		let pw1 = $('#userPw').val();
		let pw2 = $('#userPwCk').val();
		if(pw1 == pw2){
			$('#checkedPassword').val("true");
			$('#notePassword').text("비밀번호가 일치합니다.").css('color', 'blue');
		} else if(pw1 != pw2){
			$('#checkedPassword').val("false");
			$('#notePassword').text("비밀번호가 일치하지 않습니다.").css('color','red')
		}
	}
	
	function mailDomain(){	// 도메인입력
		if($('#selectMail').val() != "etx"){
			$('#userEmail2').val($('#selectMail').val());
			$('#userEmail2').attr("readonly", true);
		}
		if( $('#selectMail').val() == "etc"){
			$('#userEmail2').val("");
			$('#userEmail2').removeAttr("readonly");
		}
	}
	
	function checkEmail(){	// 인증메일 발송
		let str1 = $('#userEmail').val();
		let str2 = $('#userEmail2').val();
		let email = str1 + "@" + str2;
		console.log(email)
		$.post(
			"mailCertification.do",
			{ userEmail: email },
			function(data){
				let num = data.toString();
				$('#checkedEmail').val(num);
				if($('#checkedEmailNum').val != "false"){
					$('#noteMail').text("인증 메일이 발송되었습니다.");
				}
			}
		)
	}	//end of checkEmail()
	
	function numberCheck(){	// 이메일 인증번호 확인
		if( $('#checkedEmail').val() != $('#number').val() ){
			alert("인증번호가 일치하지 않습니다.");			 
		} else {
			$('#checkedEmailNum').val("true");
			$('#noteNumber').text("인증완료").css('color', 'blue');
		}
	} // end of numberCheck()
	
	function inputNumberOnly(el) {	// 전화번호 숫자만 가능
	    el.value = el.value.replace(/[^0-9]/g, '');
	  }
	
    function sample6_execDaumPostcode() {	//주소검색 - 다음 api
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }// 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("userAddr3").value = extraAddr;
                } else {
                    document.getElementById("userAddr3").value = '';
                }
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("userAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("userAddr2").focus();
            }
        }).open();
    }

</script>
</body>
</html>