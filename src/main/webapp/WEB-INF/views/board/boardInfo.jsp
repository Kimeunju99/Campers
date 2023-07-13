<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr, td {
    border: 1px solid #444444;
  }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<br>
	<c:choose>
	<c:when test="${board.brdType == 'normal' }">
		<h2>자유게시판</h2>
	</c:when>
	<c:when test="${board.brdType == 'review' }">
		<h2>리뷰게시판</h2>
	</c:when>
	<c:when test="${board.brdType == 'tip' }">
		<h2>팁/정보공유 게시판</h2>
	</c:when>
	<c:when test="${board.brdType == 'inform' }">
		<h2>공지사항</h2>
	</c:when>
	</c:choose>
	<hr>
	<form action="" name="myFrm" method="post">
		<c:if test="${board.brdImage != null }">
		<img width="250px" src="images/${board.brdImage }">
		</c:if>
		<table border="1" width="600">
			<tbody>
				<tr border="1" width="450" height="50" align="left">
					<td>제목:  ${board.brdTitle}</td>
					<td>작성자: ${board.brdWriter}</td>
				</tr>
				<tr width="70" height="70" align="left">
					<td border="1">내용: ${board.brdContent}</td>
				</tr>
				<tr width="70" height="70" align="left">
					<td>작성날짜: ${board.brdDate}</td>
				</tr>
				<tr width="70" height="70" align="left">
					<td>조회수: ${board.brdRead}</td>
				</tr>
				<tr width="70" height="70" align="left">
					<th>좋아요</th>
					<td><input type="button" value="♥" id="likeBtn">&nbsp;<span class="likeCount"></span></td>
						
				</tr>
			</tbody>
		</table>
		<br>
		<c:if test="${id == board.brdWriter || auth eq 'admin'}">
			<c:if test="${id == board.brdWriter}">
				<button type="button" onclick="submit1(this.form);">수정</button>
			</c:if>
			<button type="button" onclick="submit2(this.form);">삭제</button>
		</c:if>
			<button type="button" onclick="submit3(this.form);">목록</button>
	</form>
	
	<script>
	
		
		
		function submit1(frm) { 
			frm.action = "boardEditForm.do?bid="+${board.brdId};
			frm.submit();
			return true;	
		}
	
		function submit2(frm) { 
			frm.action = "boardDelete.do?bid="+${board.brdId};
			frm.submit();
			return true;	
		}
		
		function submit3(frm) { 
			frm.action = "boardList.do";
			frm.submit();
			return true;	
		}
		
		$('#likeBtn').on("click",function() {
			$.ajax({
				url: "boardLike.do",
				method: "POST",
				data: {
					bid: ${board.brdId}
				},
				success: function(result) {
					if(result =="true"){
						recCount();						
					}else{
						alert('로그인 후 사용하세요.');
					}
				},
				
			})
		})
		
		//let t = document.getElementById('btn');
		//t.addEventListener('click', function (e) {
		//	alert('로그인 후 사용하세요.');
		//});
		


	function recCount() {
		$.ajax({
			url: "boardLikeCount.do",
			type: "POST",
			data: {
				bid:${board.brdId}
			},
			success: function(count) {
				$(".likeCount").text(count);
			},
		})
	};
	recCount();
		
	</script>
</body>
</html>