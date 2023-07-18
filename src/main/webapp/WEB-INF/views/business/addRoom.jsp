<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>방 등록 화면</h2>
<form action = "addRoom.do" method="post" enctype="multipart/form-data">
	<table border = "1" class = "table">
		<tr>
			<th>방 번호</th>
			<td><input type = "text" name = "rid"></td>
		</tr>	
		<tr>
			<th>방 이름</th>
			<td align="center"><input type = "text" name = "rname"></td>
		</tr>
		<tr>
			<th>평일 가격</th>
			<td align="center"><input type = "text" name = "rweekday"></td>
		</tr>
		<tr>
			<th>주말 가격</th>
			<td align="center"><input type = "text" name = "rweekend"></td>
		</tr>
		<tr>
			<th>수용 인원</th>
			<td align="center"><input type = "text" name = "rpersonnel"></td>
		</tr>
		<tr>
			<td colspan = "2" align="center">
			<input type = "submit"	value = "등록">
			<input type = "reset" 	value = "초기화">
			</td>
		</tr>
	</table>
	<button type="submit">등록</button>
	<button type="reset">초기화</button>
</form>
</body>
</html>