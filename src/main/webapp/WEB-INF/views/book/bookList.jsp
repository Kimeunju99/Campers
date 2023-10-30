<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/myActList.css"/>
<script src="js/jquery-3.7.0.min.js"></script>
</head>
<body>
<!-- 예약 리스트: 사용자=>userId=client / 사업자=>userId=>manager / 관리자=>모든예약정보를 볼 수 있으나 예약상태 변경 불가 -->
<div id="container">
<div class="bookList">
	<h1>예약목록</h1>
	<table id="bookTable">
		<thead align="center"><tr>
			<th>예약일시</th><th>업체명</th><th>호실</th><th>가격</th><th>예약자명</th><th>날짜</th><th>예약상태</th>
		</tr></thead>
		<tbody align="center" id="bookTdoby"></tbody>
	</table>
	<button type="button" id="backBtn">뒤로가기</button>
</div>
</div>
	
<script type="text/javascript">
document.getElementById("backBtn").addEventListener('click', function(e){
	location.href = document.referrer;
});//뒤로가기

let tbody = document.getElementById("bookTdoby");
initRow(); //행 초기화
function initRow(){ //유저 권한 정보에 따른 행 출력
	tbody.innerHTML = "";
	$.ajax({
		url: "bookListControl.do",
		method: 'get',
		success: function(result){
			console.log(result); //json: list<BookVO>
			let list = JSON.parse(result)
			for(let data of list){
				let txt = '<tr onclick="location.href=\'/campers/selectBook.do?book='+data.bookId+'\'">'
						+'<td>' + dateParse(data.bookDate) +'</td><td>'+data.bookManager+'</td><td>'+data.bookRoomId  +
						'</td><td>'+data.bookCost+'</td><td>'+data.bookClient +'</td><td>'
						+ dateParse(data.bookStartDate) + ' ~ ' + dateParse(data.bookEndDate)+'</td>'
						
						if(data.bookState == 'wait')
							txt +='<td>대기</td>'
						if(data.bookState == 'approval')
							txt +='<td>승인</td>'
						if(data.bookState == 'expire')
							txt +='<td>만료</td>'
						if(data.bookState == 'cancle')
							txt +='<td>취소</td>'
							
				txt += '</tr>';
				tbody.innerHTML += txt;
			}//for
			
		}, //success
		error: function(err){	console.log(err);	}
	});
}

function dateParse(dateP){
	let date = new Date(dateP);
	let dateStr = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
	return dateStr;
}
</script>
</body>
</html>