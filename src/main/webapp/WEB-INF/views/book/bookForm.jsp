<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
</head>
<body>
<h1>예약 상세정보</h1>
<form id="bookForm"> <!-- action="bookModify.do" -->
	<table border="1">
		<tr>
			<th>예약번호</th>
			<td colspan="2"><input type="text" name="bookId" id="bookId" value="${book.bookId}" readonly></td>
			<th>예약일</th>
			<td colspan="2"><input type="date" name="bookDate" id="bookDate" value="${book.bookDate}" readonly></td>
		</tr>
		<tr>
			<th>업체명</th>
			<td><input type="text" name="manager" id="manager" value="${book.bookManager}" readonly></td>
			<th>업체번호</th>
			<td><input type="text" name="managerTel" id="managerTel" value="업체전화번호" readonly></td>
			<th>예약 현황</th>
			<td><input type="text" name="state" id="state" readonly
			value=<c:if test="${book.bookState  == 'wait'}">대기</c:if>
				<c:if test="${book.bookState == 'approval'}">승인</c:if>
				<c:if test="${book.bookState == 'expire'}">만료</c:if>
				<c:if test="${book.bookState == 'cancle'}">취소</c:if>>
				</td>
		</tr>
		<tr>
			<th>주소</th>
			<td colspan="5"><textarea cols="80%" rows="1" style="resize: none;" 
			name="addr" id="addr" readonly>${book.bookCampId}</textarea></td>
		</tr>
		<tr>
			<th>예약자</th>
			<td><input type="text"  name="client" id="client" readonly value="${book.bookClient}"></td>
			<th>예약자 번호</th>
			<td><input type="text"  name="clientTel" id="clientTel" readonly value="예약자전화번호"></td>
			<th>예약인원</th>
			<td><input type="text"  name="personnel" id="personnel" readonly value="${book.bookPersonnel}"></td>
		</tr>
		<tr>
			<th>호수</th>
			<td><textarea style="resize: none;" rows="1" name="roomId" id="roomId" readonly>${book.bookRoomId}</textarea></td>
			<th>체크인</th>
			<td><input type="date" name="sDate" id="sDate" value="${book.bookStartDate}" readonly></td>
			<th>체크아웃</th>
			<td><input type="date" name="dDate" id="dDate" value="${book.bookEndDate}" readonly></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><textarea style="resize: none;" rows="1"  name="cost" id="cost" readonly>${book.bookCost}</textarea></td>
			<td colspan="4" align="center">
				<button type="button" id="stateBtn">예약취소</button>
				<button type="button" id="backBtn">HOME</button>
			</td>
		</tr>
	</table>
</form>

<script>
let state = ""; //예약 상태 관리
let togleBtn = document.getElementById("stateBtn");

//뒤로가기
document.getElementById("backBtn").addEventListener('click', backF);

function backF(e){
	location.href="/campers/main.do";
}

//예약 상태 버튼 display
if(${logUser.userId == book.bookClient}){ //유저가 클라이언트
	if(${book.bookState == 'cancle' || book.bookState == 'expire'}){ //예약 취소, 만료임
		togleBtn.style.display = 'none';
	}else{
		togleBtn.innerText = "예약취소";
		state = "cancle";
		togleBtn.style.display = 'block';
	}
}else if(${logUser.userId == book.bookManager }){//유저가 매니저
	togleBtn.style.display = 'block';
	if(${book.bookState == "wait" }){
		togleBtn.innerText = "예약승인";
		state = "approval";
		togleBtn.style.display = 'block';
	}else if(${book.bookState == "approval" }){
		togleBtn.innerText = "예약취소";
		state = "cancle";
		togleBtn.style.display = 'block';
	}else{
		togleBtn.style.display = 'none';
	}
}else{ //유저가 관리자
	togleBtn.style.display = 'none';
}

//예약 상태 변화
togleBtn.addEventListener('click', function(e){
	let bookId = ${book.bookId};
	console.log("bookId: ", bookId);
	$.ajax({
		url: "bookStateUpdate.do",
		method: 'post',
		headers : {
			'Content-Type' : 'application/x-www-form-urlencoded; charset=UTF-8'
		},
		data : {
			book : bookId,
			state : state,
		},
		success: function(result){
			alert(result);
		},
		error: function(err){	console.log(err);	}	
	});
});

</script>
</body>
</html>