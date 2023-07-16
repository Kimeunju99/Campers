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

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
					<td>제목: ${board.brdTitle}</td>
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
					<td><input type="button" value="♥" id="likeBtn">&nbsp;<span
						class="likeCount"></span></td>
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
		<c:if test="${id != null }">
			<button type="button" onclick="submit4(this.form);">신고</button>
		</c:if>
		<button type="button" onclick="submit3(this.form);">목록</button>
	</form>


	<!-- 댓글 부분 -->
	<br>
	<div class="replyBody">
		<h2>댓글창</h2>
		<div class="writeReply">
			<ul>
				<c:choose>
					<c:when test="${id != null }">
						<li><input type="text" id="replyer" readonly size="20"
							value="${id}"></li>
						<li>: <textarea rows="5" cols="170" id="reply"
								style="resize: none"></textarea>
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

		</ul>
	</div>



	<script type="text/javascript">
		//if 작성해서 값는 값으면 action값을 바꿀 수 있음.

		function submit1(frm) {
			frm.action = "boardEditForm.do?bid=" + ${board.brdId};
			frm.submit();
			return true;

		}
		
		function submit2(frm) {
			frm.action = "boardDelete.do?bid=" + ${board.brdId};
			frm.submit();
			return true;

		}

	
		function submit3(frm) { 
			frm.action = "boardList.do?type="+"${board.brdType}";
			frm.submit();
			return true;	
		}
		
		function submit4(frm) { 
			frm.action = "accuseAddForm.do?wri="+"${board.brdWriter}"+"&rid="+"${id}"+"&bno="+"${board.brdId}"+"&title="+"${board.brdTitle}";
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


		//댓글부분
		$('#addRBtn').on('click', function(){
			let reply = $('#reply').val();
			let replyer = $('#replyer').val();
			let bid = ${board.brdId};
			console.log(reply, replyer, bid);
			fetch('/campers/replyAdd.do',{
				method: 'post',
				headers:{
					'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8;' 	
				},
				body: 'reply=' + reply + '&replyer=' + replyer + '&bid=' + bid
			})
			.then(response => response.json())
			.then(result => {
				replyFnc(bid); 
			})
			.catch(err => console.error(err))
		})
		
			
		function makeList(reply={}){
			let id = '${id}';
			let str = '';
			str += `
		        <li data-rno=\${reply.replyId}>
		            <div>
		                <div class="header">
		                    <strong>\${reply.replyer}</strong>
		                    <small>\${reply.replyDate}</small>
		                </div>`;
		     
		    if (id == reply.replyer) { // 댓글 작성자인 경우
		        str += `
		                <button class="close" style="align: right">&times;</button>
		                <button class="modify" style="align: right">수정</button>`;
		    } else if (id != null) { // 로그인한 사용자이지만 댓글 작성자가 아닌 경우
		        str += `
		                <button class="accuse" style="align: right">신고</button>`;
		    }
		    
		    str += `
		                <p>\${reply.reply}</p>
		            </div>
		        </li>
		    `;
			
			return str;
		}
		
		const bid = '${board.brdId}';
		const replyUL = $('.reple');
		
		function replyFnc(bid){
			
			fetch('/campers/replyList.do?bid='+ bid)
				.then(function(response){
					console.log(response);
					return response.json(); 
				})
			.then(function(result){ 
			console.log(result); 
			
			$('.reple').empty();
			for(let reply of result.list){
			    replyUL.append(makeList(reply)); 
			}
		})
			.catch(function(err){ 
			console.error(err); 
			});
		}
	replyFnc(bid); 
		
	$('ul').css({
		border: 'solid 0.5px',
		padding: '5px',
		margin: '20px'
		});
		
		replyUL.css('list-style', 'none');
		
		
	
	</script>
</body>
</html>