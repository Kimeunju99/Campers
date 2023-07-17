<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/38655e7b9d.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css" >

#container{

margin: 0 auto;
width: 1000px;

}
#likeBtn{
	background-color: white;
	border: none;
}

tr, td {
	border: 1px solid #444444;
}
.recontainer {
	position: absolute;
	top: 30%;
	left: 30%;
	display: none;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: antiquewhite;
	border-radius: 80px;
}
.remodal{
	top: 30%;
	left: 30%;
	display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  row-gap: 15px;
  padding: 50px;
  border: 1px solid antiquewhite;
  border-radius: 80px;
}

</style>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

</head>
<body>
<div id="container">
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
		
		<h3 style="text-align: left;">${board.brdTitle}<br></h3>
		<p style="text-align: left;">작성자: ${board.brdWriter}</p>
		<p style="text-align: left;">작성날짜: ${board.brdDate}</p>
		<p style="text-align: right;">조회수: ${board.brdRead}</p>
			<div style="display: inline-block; margin: 0 5px;  float: right;">
				<c:if test="${id == board.brdWriter || auth eq 'admin'}">
				<c:if test="${id == board.brdWriter}">
					<button type="button" onclick="submit1(this.form);">수정</button>
				</c:if>
					<button type="button"  onclick="submit2(this.form);">삭제</button>
				</c:if>
			</div>
			<br>
		<h3 style="padding: 2px; margin: 0.5em 0em; color: #000000; border-bottom: 8px #E68900 double; font-weight: bold;" data-ke-size="size23"></h3>
		<p data-ke-size="size16">&nbsp;</p>
		<c:if test="${board.brdImage != null }">
			<img width="250px" src="images/${board.brdImage }">
			<br><br>
		</c:if>
		<p>${board.brdContent}</p>
		<div style="border:  solid 1px; width: 120px; border-radius: 30px; color: pink; display: inline-block; margin: 0 5px;  float: left;">
			<button type="button" id="likeBtn">좋아요&nbsp;
			<i class="fa-solid fa-heart fa-beat fa-xs" style="color: #f00054;"></i></button>
			<span class="likeCount"></span></td>
		</div>
		<br>
		<div style="display: inline-block; margin: 0 5px;  float: right;">
			<c:if test="${id != null }">
				<button type="button" class="reportIn">신고</button>
			</c:if>
				<button type="button" onclick="submit3(this.form);">목록</button>
		</div>
	</form>
			<div class="recontainer">
				<div class="remodal">
				<h3>게시물 신고</h3>
					<select name="content" id="content">
						<option value="1">음란물 입니다.</option>
						<option value="2">불법정보를 포함하고 있습니다.</option>
						<option value="3">청소년에게 유해한 내용입니다.</option>
						<option value="4">욕설/생명경시/혐오/차별적 표현입니다.</option>
						<option value="5">개인정보 노출 게시물입니다.</option>
						<option value="6">불쾌한 표현이 있습니다.</option>
					</select>
					<div>
						<button id="reportBtn">확인</button>
						<button class="reportCloseBtn">닫기</button>
					</div>
				</div>
			</div>

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
						<c:if test="${id == list.replyer}">
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

</div>

	<script type="text/javascript">

		//if 작성해서 값는 값으면 action값을 바꿀 수 있음.

		function submit1(frm) {
			frm.action = "boardEditForm.do?bid=" + ${board.brdId};
			frm.submit();
			return true;

		}
		
		function submit2(frm) {
			frm.action = "boardDelete.do?bid=" + ${board.brdId} + "&type=" + "${board.brdType}";
			frm.submit();
			return true;

		}

		function submit3(frm) { 
			frm.action = "boardList.do?type="+"${board.brdType}";
			frm.submit();
			return true;	
		}
		
		
		// 게시글 신고 모달창
		const reportIn = document.querySelector('.reportIn');
		const recontainer = document.querySelector('.recontainer');
		const reportCloseBtn = document.querySelector('.reportCloseBtn');

		reportIn.addEventListener('click',()=>{
			recontainer.style.display = 'flex';
			reportIn.style.display = 'none';
		})
		
		reportCloseBtn.addEventListener('click', ()=>{
			recontainer.style.display = 'none';
			reportIn.style.display = 'flex';
		})

		

		
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
	

		$('#reportBtn').on("click",function() {
			let rcontent = document.querySelector('#content').value;
			$.ajax({
				url: "accuseAddForm.do",
				method: "POST",
				data: {
					wri: '${board.brdWriter}',
					rid: '${id}',
					title: '${board.brdTitle}',
					bid: ${board.brdId},
					content: rcontent
				},
				success: function(result) {
					if(result == "true") {
						alert('정상적으로 신고 되었습니다.');
						location.href = document.referrer
					} else {
						alert('신고 중 오류 발생했습니다.');
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
		
		$('ul').css({
		border: 'solid 0.5px',
		padding: '5px',
		margin: '20px'
		});
		
		$('ul>li').css('list-style', 'none');
		
		//댓글 리스트 보여주기
		/*const bid = '${board.brdId}';
		const replyUL = $('reple');
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
		
		replyFnc(bid);
		*/
		
		function viewHTML(datas){
			console.log(datas);
		}
		
		
		//replyFnc(bid);
		
		
		
	</script>
</body>
</html>