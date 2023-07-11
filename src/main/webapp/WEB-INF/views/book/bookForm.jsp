<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>예약 정보 보기</h1>
<form id="bookForm"> <!-- action="bookModify.do" -->
	<table>
		<tr>
			<th>업체명</th>
			<td><input type="text" name="manager" id="manager" value="" readonly></td>
			<th>주소</th>
			<td><input type="text" name="addr" id="addr" value="" readonly></td>
		</tr>
		<tr>
			<th>예약자</th>
			<td><input type="text" name="client" id="client" value="" readonly></td>
			<th>인원</th>
			<td><input type="text" name="personnel" id="personnel" value="" readonly></td>
		</tr>
		<tr>
			<th>체크인</th>
			<td><input type="date" name="sDate" id="sDate" value="" readonly></td>
			<th>체크아웃</th>
			<td><input type="date" name="dDate" id="dDate" value="" readonly></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="cost" id="cost" value="" readonly></td>
			<td colspan="2" align="center">
				<button type="button" id="modBtn">예약취소</button>
				<button type="button" id="backBtn">뒤로가기</button></td>
		</tr>
	</table>
</form>

<script>
//뒤로가기
document.getElementById("backBtn").addEventListener('click', function(e){
	location.href = 'bookList.do';
});

//예약취소
document.getElementById("modBtn").addEventListener('click', function(e){
	
});

</script>
</body>
</html>