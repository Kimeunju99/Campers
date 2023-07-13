<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>예약하기</h1>
<form id="bookForm" action="newbooking.do">
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
			<td><select name="personnel" id="personnel"></select></td>
		</tr>
		<tr>
			<th>체크인</th>
			<td></td>
			<th>체크아웃</th>
			<td></td>
		</tr>
		<tr>
			<th>가격</th><td><!-- n박*가격 --></td>
			<td colspan="2" align="center">
				<button type="submit">예약</button>
				<button type="button">뒤로가기</button></td>
		</tr>
	</table>
</form>

<script>
//예약가능 인원 select 옵션 설정

//예약날짜 Calendar 작업

//예약버튼


//뒤로가기 버튼


</script>
</body>
</html>