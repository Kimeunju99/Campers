<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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

	<!-- 댓글 부분 -->
	<br>
	<div class="replyBody">
		<h2>댓글창</h2>
		<ul class="reple">
			<li><div>
					<div class="header">
						<strong>user1</strong> 
						<small>2023-06-05 15:24</small>
					</div>
					<p>Good Job!!!!!!!!!!!!</p>
				</div></li>
		</ul>
	</div>



	<script type="text/javascript">
		//if 작성해서 값는 값으면 action값을 바꿀 수 있음.

		function submit1(frm) {
			frm.action = "boardEdit.do?bid=" + ${board.brdId};
			frm.submit();
			return true;

		}

		function submit2(frm) {
			frm.action = "boardDelete.do?bid=" + ${board.brdId};
			frm.submit();
			return true;

		}

		//댓글부분
		
		//댓글 리스트 보여주기
		const bid = '${board.brdId}';
		const replyUL = $('reple');
		
	
		function replyFnc(bid){
			console.log(bid);
			fetch('/replyList.do?bid='+ bid)
			.then(function(response){
				console.log(response);
				return response.json();
			})
			.then(function(result){
				console.log(result);
			})
			.catch(function(err){
				console.error(err);
			}
		}
		
		replyFnc(bid);
	</script>
</body>
</html>