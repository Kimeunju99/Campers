<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 화면</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form name="myfrm" action="" method="post">
		<input type="hidden" name="uid" value="${user.userId}">
		<table class="table">
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="userId" value="${user.userId }" readonly></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="userEmail" value="${user.userEmail }"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="userName" value="${user.userName }"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="userTel" value="${user.userTel}"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="userAddr" value="${user.userAddr}"></td>
				</tr>
				<tr>
					<td>권한</td>
					<td><input type="text" name="userAuth" value="${user.userAuth }"></td>
				</tr>
			</tbody>
		</table>
			<button class="btn btn-primary" type="button" onclick="submit1(this.form);">수정</button>
			<button class="btn btn-warning" type="button" onclick="submit2(this.form);">삭제</button>
	</form>
</body>
<script>

	function submit1(frm) {
		frm.action = "managerModifyInfo.do";
		frm.submit();
		return true;
	}
	
	function submit2(frm) {
		frm.action = "managerDelete.do?id="+'${user.userId}';
		frm.submit();
		return true;
	}
</script>
</html>