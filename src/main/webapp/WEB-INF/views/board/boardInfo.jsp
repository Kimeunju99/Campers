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
	<form action="" name="myFrm" method="post">
		<h3>${board.brdType}</h3>
		<h2 align="left">제목: ${board.brdTitle}</h2>
		<table border="1" width="400">
			<tbody>
				<tr width="450" height="50" align="left">
					<td>작성자: ${board.brdWriter}</td>
				</tr>
				<tr width="450" height="450" align="left">
					<td>${board.brdContent}</td>
				</tr>
				
			</tbody>
		</table>
		<br>
		<c:if test="${id != null }">
			<button type="button" onclick="submit1(this.form);">수정</button>
			<button type="button" onclick="submit2(this.form);">삭제</button>
		</c:if>
	</form>
	<script>
	//if 작성해서 값는 값으면 action값을 바꿀 수 있음.
	
	function submit1(frm) { 
			frm.action = "boardEdit.do?bid="+${board.brdId};
			frm.submit();
			return true;
			
		}
	
		function submit2(frm) { 
			frm.action = "boardDelete.do?bid="+${board.brdId};
			frm.submit();
			return true;
			
		}
	</script>
</body>
</html>