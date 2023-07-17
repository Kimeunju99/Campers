<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/form.css"/>
<script src="js/jquery-3.7.0.min.js"></script>
</head>
<body>
<div id="container">
<h1>예약 상세정보</h1>
<form id="bookForm"> <!-- action="bookModify.do" -->
	<table>
		<tr>
			<th>예약번호</th>
			<td class="readonly">${book.bookId}</td>
			<th>예약일</th>
			<td class="readonly" id="bookDate">${book.bookDate}</td>
		</tr>
		<tr>
			<th>업체명</th>
			<td class="readonly" id="manager">${manager.userName}</td>
			<th>업체 전화번호</th>
			<td class="readonly" id="managerTel">${manager.userTel }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td id="addr" class="readonly">${book.bookCampId}</td>
			<th>호수</th>
			<td id="roomId">${book.bookRoomId}</td>
		</tr>
		<tr>
			<th>예약자</th>
			<td class="readonly" id="client" >${client.userName}</td>
			<th>예약자 전화번호</th>
			<td class="readonly" id="clientTel" >${client.userTel }</td>
		</tr>
		<tr>
			<th>예약인원</th>
			<td class="readonly" id="personnel" >${book.bookPersonnel}</td>
			<th>예약 현황</th>
			<td class="readonly" id="state">
				<c:if test="${book.bookState  == 'wait'}">대기</c:if>
				<c:if test="${book.bookState == 'approval'}">승인</c:if>
				<c:if test="${book.bookState == 'expire'}">만료</c:if>
				<c:if test="${book.bookState == 'cancle'}">취소</c:if>
			</td>
		</tr>
		<tr>
			<th>체크인</th>
			<td class="readonly" id="sDate">${book.bookStartDate}</td>
			<th>체크아웃</th>
			<td class="readonly" id="dDate">${book.bookEndDate}</td>
		</tr>
		<tr>
			<th>가격</th>
			<td class="readonly" id="cost">${book.bookCost}</td>
			<td colspan="2" align="right">
				<button type="button" id="stateBtn">예약취소</button>
				<button type="button" id="backBtn">뒤로가기</button>
			</td>
		</tr>
	</table>
</form>
</div>

<script>
let state = ""; //예약 상태 관리
let togleBtn = document.getElementById("stateBtn");
//뒤로가기
document.getElementById("backBtn").addEventListener('click', backF);
function backF(e){
	location.href= document.referrer;
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
	if(${book.bookState == "wait" }){ //대기 상태
		togleBtn.innerText = "예약승인";
		state = "approval";
		togleBtn.style.display = 'block';
	}else if(${book.bookState == "approval" }){ //승인 상태
		togleBtn.innerText = "예약취소";
		state = "cancle";
		togleBtn.style.display = 'block';
	}else{//취소, 만료 상태
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