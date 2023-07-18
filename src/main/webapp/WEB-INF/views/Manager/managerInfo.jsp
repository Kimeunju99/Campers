<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 화면</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,
td {
  padding: 6px 15px;
}
th {
  background: #42444e;
  color: #fff;
  text-align: left;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
}
</style>
</head>
<body>
	<h2>회원 정보</h2>
	<form name="myfrm" action="" method="post">
		<input type="hidden" name="uid" value="${user.userId}">
		<table class="table">
			<tbody>
				<tr>
					<td align="center" >아이디</td>
					<td><input type="text" name="userId" value="${user.userId }"
						readonly></td>
				</tr>
				<tr>
					<td align="center">이메일</td>
					<td><input type="text" name="userEmail"
						value="${user.userEmail }"></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input type="text" name="userName"
						value="${user.userName }"></td>
				</tr>
				<tr>
					<td align="center">전화번호</td>
					<td><input type="text" name="userTel" value="${user.userTel}"></td>
				</tr>
				<tr>
					<td align="center">주소</td>
					<td><input type="text" name="userAddr"
						value="${user.userAddr}"></td>
				</tr>
				<tr>
					<td align="center" >권한</td>
					<td><input type="text" name="userAuth"
						value="${user.userAuth }"></td>
				</tr>
				<tr>
					<td align="center">계정상태</td>
					<td><select name="accuse">
							<option value="활성화">활성화</option>
							<option value="비활성화">비활성화</option>
							<option value="정지">정지</option>
					</select></td>
				</tr>
				<tr>
					<td align="center">정지기간</td>
					<td><select name="result">
							<option value="반려">반려</option>
							<option value="1개월정지">1개월정지</option>
							<option value="2개월정지">2개월정지</option>
							<option value="영구정지">영구정지</option>
					</select></td>
				</tr>
			</tbody>
		</table>
		<button class="btn btn-primary" type="button"
			onclick="submit1(this.form);">수정</button>
		<button class="btn btn-warning" type="button"
			onclick="submit2(this.form);">삭제</button>
	</form>
</body>
<script>
	function submit1(frm) {
		frm.action = "managerModifyInfo.do";
		frm.submit();
		return true;
	}

	function submit2(frm) {
		frm.action = "managerDelete.do?id=" + '${user.userId}';
		frm.submit();
		return true;
	}
</script>
</html>