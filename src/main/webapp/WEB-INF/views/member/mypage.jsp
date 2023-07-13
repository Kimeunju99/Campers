<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
<style>
li{
 list-style-type: none;
}
li.summery{
 float: left;
 margin: 15px;
}
.line{
	 border: 1px solid #444444;
}
</style>
</head>
<body>
<!-- ----------------김은주: MYPAGE ----------------------- -->
<!-- link= mypage.do -> MypageForm.class -->
<div>
	<!-- 개인 정보창 -->
	<div id="userInfo" class="userInfo">
		<p id="infoName"><c:out value="${logUser.userName }" />님</p>
		<p id="mdfInfo">정보 수정하기</p>
		<hr>
		<table id="infoTbl">
		<tr>	
			<th>아이디</th>
			<td>${logUser.userId }</td>
		</tr>
		<tr>	
			<th>전화번호</th>
			<td id="infoTel">${logUser.userTel }</td>
		</tr>
		<tr>
			<th>E-MAIL</th>
			<td id="infoEmail">${logUser.userEmail }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td id="infoAddr">${logUser.userAddr }</td>
		</tr>
		<tr>
		<td colspan="2" align="center">
			<input type="button" name="logoutBtn" id="logoutBtn" value="로그아웃">
		</td>
	</tr>
		</table>
	</div>
	
	<div id="userAction" class="userAction">
		<h2>MY PAGE</h2>
		<!-- 요약창: 예약n건 | 작성 게시글 n개 | 좋아요 n개 | 댓글 n개 -->
		<div class="summery">
			<ul class="summery">
				<li class="summery"><b>대기예약</b><br>${waitCtn }개</li> <!-- 현재 대기된 예약 건수-->
				<li class="summery"><b>승인예약</b><br>${apprCtn }개</li> <!-- 현재 승인된 예약 건수-->
				<li class="summery"><b>게시글</b><br>${boardCnt }개</li> <!-- 내가 쓴 게시글 수-->
				<li class="summery"><b>댓글</b><br>${replyCnt }개</li> <!-- 내가 쓴 댓글 수-->
				<li class="summery"><b>찜</b><br>개</li> <!-- 내가 누른 좋아요(캠핑장) 수-->
			</ul>
		</div>
		
		<!-- 예약 리스트 -->
		<div class="bookList">
			<h3><a href="/campers/bookList.do">예약 목록</a></h3>
			<table class="bookList" border="1">
				<c:choose >
					<c:when test="${logUser.userAuth == 'general' }">
						<thead align="center"><tr>
							<th>업체명</th><th>호실</th>
							<th>예약일</th><th>체크인</th>
							<th>가격</th><th>예약상태</th>
						</tr></thead>
						<tbody align="center"><c:forEach items="${bookList }" var="book" begin="0" end="4">
							<tr onclick="location.href='/campers/selectBook.do?book=${book.bookId}'">
								<td>${book.bookManager }</td><td>${book.bookRoomId }</td>
								<td>${book.bookDate }</td><td>${book.bookStartDate }</td>
								<td>${book.bookCost }</td>
								<c:if test="${book.bookState  == 'wait'}"><td>대기</td></c:if>
								<c:if test="${book.bookState == 'approval'}"><td>승인</td></c:if>
								<c:if test="${book.bookState == 'expire'}"><td>만료</td></c:if>
								<c:if test="${book.bookState == 'cancle'}"><td>취소</td></c:if>
							</tr>
						</c:forEach></tbody>
					</c:when>
					<c:when test="${logUser.userAuth == 'business' }">
						<thead align="center"><tr>
							<th>예약자</th><th>호실</th>
							<th>예약일</th><th>체크인</th>
							<th>가격</th><th>예약상태</th>
						</tr></thead>
						<tbody align="center"><c:forEach items="${bookList }" var="book" begin="0" end="4">
							<tr onclick="location.href='/campers/selectBook.do?book=${book.bookId}'">
								<td>${book.bookClient }</td><td>${book.bookRoomId }</td>
								<td>${book.bookDate }</td><td>${book.bookStartDate }</td>
								<td>${book.bookCost }</td>
								<c:if test="${book.bookState  == 'wait'}"><td>대기</td></c:if>
								<c:if test="${book.bookState == 'approval'}"><td>승인</td></c:if>
								<c:if test="${book.bookState == 'expire'}"><td>만료</td></c:if>
								<c:if test="${book.bookState == 'cancle'}"><td>취소</td></c:if>
							</tr>
						</c:forEach></tbody>
					</c:when>
				</c:choose>
			</table>
		</div>
		
		<!-- 내 게시글 모아보기 -->
		<div class="boardList">
			<h3>내 게시글</h3>
			<ul class="boardList"></ul>
			<table border="1">
			<thead>
				<tr style="background-color: rgb(240, 232, 232); border: solid 1px white;" class="line">
					<th class="line">글번호</th>
					<th class="line">제목</th>
					<th class="line">날짜</th>
					<th class="line">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${list }" begin="0" end="4">	
				<tr class="line">
					<td class="line">${list.brdId }</td>
					<td class="line"><a href="boardInfo.do?bid=${list.brdId }">${list.brdTitle }</a></td>
					<td class="line">${list.brdDate }</td>
					<td class="line">${list.brdRead }</td>
				</tr>
			</c:forEach>
			</tbody>
			</table>
		</div>
		
		<!-- 좋아요(게시글) 모아보기 
		<div class="likeList">
			<h3>좋아요 한 게시물</h3>
			<ul class="likeList"></ul>
		</div>
		-->
	</div>
</div>


<!-- 모달창 -->
<div class="modifyWindow" style ="display:none;">
	<p>정보수정</p>
	<hr>
	<form name="modifyForm" id="modifyForm">
		<table>
			<tr>
				<th>이름</th>
				<td><input id="userName" name="userName" type="text" value="${logUser.userName }"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input id="userTel" name="userTel" type="text" value="${logUser.userTel }"></td>
			</tr>
			<tr>
				<th>E-MAIL</th>
				<td><input id="userEmail" name="userEmail" type="text" value="${logUser.userEmail }"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input id="userAddr" name="userAddr" type="text" value="${logUser.userAddr }"></td>
			</tr>
			<tr>
				<th>현재 비밀번호</th>
				<td><input id="userPw" name="userPw" type="password" placeholder="현재 비밀번호"></td>
			</tr>
			<tr>
				<th>새 비밀번호</th>
				<td><input id="userNewPw1" name="userNewPw1" type="password" placeholder="새 비밀번호"></td>
			</tr>
			<tr>
				<th>새 비밀번호 확인</th>
				<td><input id="userNewPw2" name="userNewPw2" type="password" placeholder="새 비밀번호 확인">
				</td>
			</tr>
			<tr>
				<td colspan="2"><p id="checkPw" style ="color:red;">비밀번호가 일치하지 않습니다.</p></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" name="saveBtn" id="saveBtn">저장</button>
					<button type="button" class="closeBtn">취소</button>
				</td>
			</tr>
		</table>
	</form>
</div>


<script>
let md = document.querySelector('.modifyWindow');
let pw = document.getElementById("userPw");
let npw1 = document.getElementById("userNewPw1");
let npw2 = document.getElementById("userNewPw2");

	document.getElementById("logoutBtn").addEventListener('click', logoutF);//로그아웃
	function logoutF(){	document.location.href='logout.do';	};
	
	document.getElementById("mdfInfo").addEventListener('click', function(e){
		md.style.display = 'block';
		document.querySelector('#checkPw').style.visibility='hidden';
	});//모달창 열기
	
	document.getElementById("saveBtn").addEventListener('click', function(e){
		if(pw.value != ""){
			if(npw1.value == npw2.value){
				$.ajax({
					url: "memberModify.do",
					method: 'post',
					data: $('form[name="modifyForm"]').serialize(),
					success: function(result){
						if(result == "내 정보 업데이트에 성공했습니다."){
							document.querySelector('.modifyWindow').style.display = 'none';
							console.log(document.getElementById("infoName").innerText);
							console.log(document.getElementById("infoTel").innerText);
							document.getElementById("infoName").innerText = document.getElementById("userName").value + "님"
							document.getElementById("infoTel").innerText = document.getElementById("userTel").value
							document.getElementById("infoAddr").innerText = document.getElementById("userAddr").value
							document.getElementById("infoEmail").innerText = document.getElementById("userEmail").value
						}
						alert(result);
					},
					error: function(err){	console.log(err);	}	
				});
			}else{
				document.querySelector('#checkPw').style.visibility='visible';
				npw1.value = "";
				npw2.value = "";
				npw1.focus();
			}	
		}else{
			alert('비밀번호는 필수값입니다.');
			pw.focus();
		}
		
	});//사용자 정보 수정
	
	document.querySelector("button.closeBtn").addEventListener('click', function(e){
		pw.value = "";
		npw1.value = "";
		npw2.value = "";
		md.style.display = 'none';
	});//모달창 닫기

</script>
</body>
</html>