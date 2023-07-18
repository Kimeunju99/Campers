<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="js/jquery-3.7.0.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- Header-->
<div id="best-camp">
	<div id="camp-list-all">
		<c:forEach var="camp" items="${campList}">
			<div class="camp-list-items" onclick="">
				<div class="campImage" style="background-image: url(images/${camp.campImage});">

					<div id="list-slide-btn">
						<img src="images/icon/Lbutton.png" onclick="pageLefe()">
						<img src="images/icon/Rbutton.png" onclick="pageRight()">
					</div>
					<div class="campInfo">
						<div class="campInfo-text">
							<h3>${camp.campName}</h3>
							<p>${camp.campInfo}</p>
							<p>${camp.campAddr}</p>
						</div>
					</div>
					
				</div>
			</div>
		</c:forEach>
	</div>

</div>

<!-- CampVO List 받아오기 -->
<script>

	
//배너 슬라이드------------------------------------------------------

	let campIndex = 0;	//현재 슬라이드 인덱스
	let listIndex = $('#camp-list-all').children().length;	//총 item 수

	//item의 width
	let listItems = document.querySelector('.camp-list-items');
	let width = listItems.offsetWidth - 20;
	console.log("요소의 길이: " + width);

	let list = document.querySelector('#camp-list-all');

	function pageLefe(){
		console.log("왼쪽 클릭")
		campIndex--;
		campIndex = campIndex < 0 ? 0 : campIndex;
		
		list.style.marginLeft = '-' + (width * campIndex) + 'px' ;
	}
	
	function pageRight(){
		console.log("오른쪽 클릭")
		campIndex++;
		campIndex = campIndex >= listIndex ? listIndex - 1 : campIndex;
		
		list.style.marginLeft = '-' + (width * campIndex) + 'px' ;
	}

</script>



<div id="main-container">
	<div id="iconList" class="container-items">
		<h4>바로가기</h4><br>
		<div class="main-icon" onclick="location.href ='searchCamp.do'">
			<img src="images/icon/search.png" class="icon-images"> <span>캠핑장 검색</span>
		</div>
		<div class="main-icon" onclick="location.href ='searchCamp.do'">
			<!-- 링크 주소 변경 필요 -->
			<img src="images/icon/3.png" class="icon-images"> <span>캠핑장 예약</span>
		</div>
		<div class="main-icon" onclick="location.href ='searchCamp.do'">
			<!-- 링크 주소 변경 필요 -->
			<img src="images/icon/review.png" class="icon-images"> <span>캠핑장 리뷰</span>
		</div>
		<div class="main-icon" onclick="location.href ='searchCamp.do'">
			<!-- 링크 주소 변경 필요 -->
			<img src="images/icon/4.png" class="icon-images"> <span>게시판 목록</span>
		</div>
	</div>
	
	<div id="Main-boardList" class="container-items">
		<h4>Campers story</h4><br>
		<table>
			<thead>
				<tr>
					<th scope="row">글번호</th>
					<th class="th-lg"><a>제목</a></th>
					<th class="th-lg">작성자</th>
					<th class="th-lg">작성일</th>
					<th class="th-lg">조회수</th>
				</tr>
			</thead>
			<!--Table head-->
			
			<!--Table body-->
			<tbody>
				<c:forEach var="brd" items="${informList}">
					<tr>
						<td><span
							style="background-color: rgb(228, 49, 49); border-radius: 4px; color: rgb(250, 204, 204); padding: 2px; font-size: small">공지</span>
						</td>
						<td><a
							href="/campers/boardInfo.do?bid=${brd.brdId}&bwri=${brd.brdWriter}"
							style="text-decoration: none; color: red;"> <c:out
									value="${brd.brdTitle}" /></a></td>
						<td><c:out value="${brd.brdWriter}" /></td>
						<td><c:out value="${brd.brdDate}" /></td>
						<td><c:out value="${brd.brdRead}" /></td>
					<tr>
				</c:forEach>
							<c:forEach var="brd" items="${list}">
					<tr>
						<td><c:out value="${brd.brdId}" /></td>
						<td><a
							href="/campers/boardInfo.do?bid=${brd.brdId}&bwri=${brd.brdWriter}"
							style="text-decoration: none; color: black;"> <c:out
									value="${brd.brdTitle}" /></a></td>
						<td><c:out value="${brd.brdWriter}" /></td>
						<td><c:out value="${brd.brdDate}" /></td>
						<td><c:out value="${brd.brdRead}" /></td>
					<tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script type="text/javascript">
	$('table').css('width', '100%');
</script>