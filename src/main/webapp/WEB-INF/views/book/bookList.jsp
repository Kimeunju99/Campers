<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>예약목록</h1>
<table id="bookList">
	<tr>
		<th>업체명</th>
		<th>예약자</th>
		<th>인원</th>
		<th>체크인</th>
		<th>체크아웃</th>
		<th>가격</th>
	</tr>
	<tr>
		<td><input type="text" name="manager" id="manager" value="" readonly></td>
		<td><input type="text" name="client" id="client" value="" readonly></td>
		<td><select name="personnel" id="personnel"></select></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" id="backBtn">뒤로가기</button></td>
	</tr>
</table>
	
	
<script type="text/javascript">
document.getElementById("backBtn").addEventListener('click', function(e){
	location.href = document.referrer;
});//뒤로가기


</script>


</body>
</html>