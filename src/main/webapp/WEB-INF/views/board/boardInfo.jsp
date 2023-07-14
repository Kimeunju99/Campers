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
		<div class="writeReply">
			<ul>
				<c:choose>
					<c:when test="${id != null }">
						<li><input type="text" readonly size="20"
							value="${board.brdWriter}"></li>
						<li>: <textarea rows="5" cols="170" style="resize: none"></textarea>
							<button type="button" id="addRBtn">댓글작성</button>
						</li>
					</c:when>
					<c:otherwise>
						<input type="text" readonly size="20">
						<li>: <textarea rows="5" cols="170" style="resize: none"
								readonly>로그인한 사용자만 이용할 수 있습니다.</textarea>
							<button type="button" id="addRBtn">댓글작성</button>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<ul class="reple">
			<li><div>
					<div class="header">
						<strong>user1</strong> <small>2023-06-05 15:24</small>
						<c:if test="${id = list.replyer}">
							<button class="close" style="align: right">&times;</button>
							<button class="modify" style="align: right">수정</button>
						</c:if>
						<c:if test="${id != null && id != list.replyer}">
							<button class="accuse" style="align: right">🚨</button>
						</c:if>
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
		
		$('ul').css({
		border: 'solid 0.5px',
		padding: '5px',
		margin: '20px'
		});
		
		$('ul>li').css('list-style', 'none');
		
		//댓글 리스트 보여주기
		const bid = '${board.brdId}';
		const replyUL = $('.reple');
		
		function replyFnc(bid){
		let payload = "bid=" + bid;
		url = '/campers/replyList.do';
			fetch(url, {
				method: 'post',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
				},
				body: payload
			})
			.then(Response => Response.json())
			.then(json => viewHTML(json));
		}
		
		function viewHTML(datas){
			console.log(datas);
		}
		
		
	</script>
</body>
</html>