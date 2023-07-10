<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<!-- ----------------김은주: MYPAGE ----------------------- -->
<!-- link= mypage.do -> MypageForm.class -->
<div>
	<!-- 개인 정보창 -->
	<div id="userInfo" class="userInfo">
		<p><!--${memberName}-->님</p>
		<p id="mdfInfo">정보 수정하기</p>
		<hr>
		<ul>
			<li>TEL&nbsp;&nbsp;<!--유저값--><li>
			<li>E-MAIL&nbsp;&nbsp;<!--유저값--><li>
			<li>ADDRESS&nbsp;&nbsp;<!--유저값--><li>
			<li><input type="button" name="logout" id="logout" value="로그아웃"><li>
		</ul>
	</div>
	
	<div id="userAction" class="userAction">
		<h2>MY PAGE</h2>
		<!-- 요약창: 예약n건 | 작성 게시글 n개 | 좋아요 n개 | 댓글 n개 -->
		<div class="summery">
			<ul class="summery">
				<li class="summery"><b>대기예약</b><br>개</li> <!-- 현재 대기된 예약 건수-->
				<li class="summery"><b>승인예약</b><br>개</li> <!-- 현재 승인된 예약 건수-->
				<li class="summery"><b>게시글</b><br>개</li> <!-- 내가 쓴 게시글 수-->
				<li class="summery"><b>댓글</b><br>개</li> <!-- 내가 쓴 댓글 수-->
				<li class="summery"><b>찜</b><br>개</li> <!-- 내가 누른 좋아요(캠핑장) 수-->
			</ul>
		</div>
		
		<!-- 예약 리스트 -->
		<div class="bookList">
			<h3>예약 목록</h3>
			<ul class="bookList"></ul>
		</div>
		
		<!-- 내 게시글 모아보기 -->
		<div class="boardList">
			<h3>내 게시글</h3>
			<ul class="boardList"></ul>
		</div>
		
		<!-- 좋아요(게시글) 모아보기 -->
		<div class="likeList">
			<h3>좋아요 한 게시물</h3>
			<ul class="likeList"></ul>
		</div>
	</div>
</div>


<!-- 모달창 -->
<div>
<p>정보 수정하기</p>
<hr>
<ul>
	<li>TEL&nbsp;&nbsp;<input type="text" ><li>
	<li>E-MAIL&nbsp;&nbsp;<li>
	<li>ADDRESS&nbsp;&nbsp;<li>
	<li><input type="button" name="logout" id="logout" value="로그아웃"><li>
</ul>
</div>

</body>
</html>