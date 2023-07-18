<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>캠핑장 정보 수정</h3>
	<form>
		<table>
			<tr>
				<th>아이디</th>
				<td><input readonly name = "id" value="${user.userId}"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name = "email" value="${user.userEmail }"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input readonly name = "name" value="${user.userName}"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input name = "tel" value="${user.userTel }"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input name = "addr" value="${user.userAddr }"></td>
			</tr>
			<tr>
				<th>권한</th>
				<td><input name = "auth" value="${user.userAuth }"></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
				<input type="submit" value="저장">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>