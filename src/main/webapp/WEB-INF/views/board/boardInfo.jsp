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
<link href="css/boardInfo.css" rel="stylesheet" />

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
		<div style="border: 2px solid #91C3CE; width: 140px; border-radius: 30px; color: #008481; display: inline-block; margin: 0 5px;  float: left;">
			<button type="button" id="likeBtn">좋아요&nbsp;
			<i class="fa-solid fa-heart fa-beat fa-xs" style="color: #f00054;"></i></button>
			<span class="likeCount"></span>
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
	<div class="container mt-5 mb-5">
		<div class="d-flex justify-content-center row">
			<div class="d-flex flex-column">
					<div class="coment-bottom bg-white p-2 px-4 pb-3" style="border-radius: 10px;">
	<p id="ti">Comment</p>
						<div class="d-flex flex-row add-comment-section mt-4 mb-4">
							<c:choose>
								<c:when test="${id != null}">
									<input type="hidden" id="replyer" readonly size="20" value="${id}">
									<textarea class="form-control mr-3 ml-2" rows="3" cols="170" id="reply" style="resize: none" placeholder="내용을 입력해주세요."></textarea>
									<button id="addRBtn" type="button" style="margin: 5px">작성</button>
								</c:when>
								<c:otherwise>
									<textarea rows="3" cols="170" style="resize: none" readonly>로그인한 사용자만 이용할 수 있습니다.</textarea>
									<button id="addRBtn" type="button" style="padding:5px; margin:5px" disabled>작성</button>
								</c:otherwise>
							</c:choose>
						</div>
						<ul class="reple">
						
						</ul>
					</div>
			</div>
		</div>
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
		})
		
		reportCloseBtn.addEventListener('click', ()=>{
			recontainer.style.display = 'none';
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
		function searchList(){
			let li = $('.liReply');
			Array.from(li).forEach(function(tag){
				let rid = tag.dataset.rid
				fetch('/campers/getReply.do?rid='+rid)
				.then(response => response.json())
				.then(function(result){
				})
				.catch(function(err){
					console.error(err);
				})
			})
				
			
		}
		
		
		$('#addRBtn').on('click', function(){
			let reply = $('#reply').val();
			let replyer = $('#replyer').val();
			let bid = ${board.brdId};
			if(reply === null){
				alert('내용이 비어있습니다.');
			}else{
				
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
				$('#reply').val('');
			})
			.catch(err => console.error(err))
			}
		})
		
		
		
			
		function makeList(reply={}){
			let id = '${id}';
			let str = '';
			str += `
		        <li class="liReply" data-rid=\${reply.replyId}>
		            <div>
		                <div class="header">
		                    <strong>\${reply.replyer}</strong>
		                    <small>\${reply.replyDate}</small>
		                    `;
		    if(reply.replyModify == 'modify'){
		    str += `
		    	<small style="color: grey; font-size: 8px">수정됨</small>
		    	`;
		    }
		    str += `
		                </div>`;
		     
		    if (id == reply.replyer) { // 댓글 작성자인 경우
		        str += `
		                <button type="button" class="closeBtn" onclick="closeFnc(this)">&times;</button>
		                <button type="button" class="modifyBtn" onclick="modifyFnc(this)">수정</button>`;
		    }		    	
		    
		    str += `
		                <p class="content">\${reply.reply}</p>
		                </div>
						</div>
		    `;
			
			return str;
		}
		
		bid = '${board.brdId}';
		const replyUL = $('.reple');
		
		function replyFnc(bid){
			
			fetch('/campers/replyList.do?bid='+ bid)
				.then(function(response){
					return response.json(); 
				})
			.then(function(result){ 
				console.log(result); 
			
				$('.reple').empty();
				for(let reply of result.list){
			   	 	replyUL.append(makeList(reply)); 
				}
				searchList()
			})
			.catch(function(err){ 
				console.error(err); 
			});
		}
		replyFnc(bid); 
		
		function modifyFnc(e){
			let reply = $(e).next('.content').text();
			let rid = $(e).closest('.liReply').data('rid');
			$(e).next('.content').empty();
			let textarea = $('<textarea />').text(reply);
			let btnModi = $('<button />').text('확인').addClass('complete');
			
			$('.reple li[data-rid="'+rid+'"]').append(textarea);
			$('.modifyBtn').replaceWith(btnModi);
			
			$('button.complete').on('click', function(){
				let modiReply = textarea.val();
				reply = modiReply;
				fetch('/campers/replyModify.do', {
				method: 'post',
				headers: {
						'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8;' 
				},
				body: 'rid=' + rid + '&reply=' + reply
				})
				.then(response => response.json())
				.then(result => {
					console.log(result.reply);
					let targetLI = $('.reple li[data-rid="'+rid+'"]');
					targetLI.append(reply);
			        textarea.remove();
			        btnModi.remove();
					alert('수정되었습니다.');
					
			})
			.catch(err=>console.error(err));
			
		
			});
		}
		
		
		function closeFnc(e){
			let rid = $(e).closest('.liReply').data('rid');
			let check = confirm('정말로 삭제하시겠습니까?');
			if(check){
				
			fetch('/campers/replyRemove.do', {
				method: 'post',
				headers: {
					'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8;' 
				},
				body: 'rid=' + rid
			})
			.then(response => response.json())
			.then(result => { 
				alert('성공적으로 삭제되었습니다.');
				replyFnc(bid); 
			})
			.catch(err => console.error(err))
			}else{
				
			}
			
		}
	
	</script>
</body>
</html>