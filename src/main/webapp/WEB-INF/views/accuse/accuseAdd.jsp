<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<h3>게시물 or 댓글 신고</h3>
	<form action="" method="get">
		<table border="1">
			<thead>
				<tr>
					<td>글 작성자: ${writer }</td>
				</tr>
				<tr>
					<td>글 번호: ${brdId } 글 제목: ${title }</td>
				</tr>
				<tr>
					<td>신고자 아이디: ${reportId }</td>
				</tr>
				<select name="content">
					<option value="1">음란물 입니다.</option>
					<option value="2">불법정보를 포함하고 있습니다.</option>
					<option value="3">청소년에게 유해한 내용입니다.</option>
					<option value="4">욕설/생명경시/혐오/차별적 표현입니다.</option>
					<option value="5">개인정보 노출 게시물입니다.</option>
					<option value="6">불쾌한 표현이 있습니다.</option>
				</select>
			</thead>
		</table>
		<button type="button" onclick="submit1(this.form);">신고하기</button>
		<button type="button" onclick="submit2(this.form);">취소</button>
	</form>
</body>

<script>
	
	function submit1(frm) {
		frm.action="accuseAdd.do"
		frm.submit();
		return true;
	}
	
	function submit2(frm) {
		location.href = document.referrer;
	}
</script>

</html>