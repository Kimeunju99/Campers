<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>캠핑장 등록 화면.</h2>
<form action = "addCamp.do" method="post" enctype="multipart/form-data">
	<table border = "1" class = "table">
		<tr>
			<th>사업자 이름</th>
			<td align="center"><input type = "text" name = "cowner"></td>
		</tr>	
		<tr>
			<th>캠핑장 이름</th>
			<td align="center"><input type = "text" name = "cname"></td>
		</tr>
		<tr>
			<th>캠핑장 주소</th>
			<td align="center"><input type = "text" name = "caddr"></td>
		</tr>
		<tr>
			<th>캠핑장 위치</th>
			<td align="center"><input type = "text" name = "clocation"></td>
		</tr>
		<tr>
			<th>캠핑장 정보</th>
			<td align="center"><input type = "text" name = "cinfo"></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td align="center"><input type = "file" name = "img" ></td>
		</tr>
		<tr>
			<th>방 갯수</th>
			<td align="center"><input type = "text" name = "ccnt" ></td>
		</tr>
		<tr>
			<th>방 번호</th>
			<td align="center"><input type = "text" name = "rid"></td>
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
			<input type = "submit"	value = "등록" >
			<input type = "reset" 	value = "초기화">
			</td>
		</tr>
	</table>
</form>
</body>
<script>
</script>
</html>