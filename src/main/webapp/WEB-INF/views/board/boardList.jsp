<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/boardList.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>

	<!-- 게시판 본문 -->
	<div class="card">
		<div class="card-body">
			<!-- Grid row -->
			<div class="row">
				<!-- Grid column -->
				<div class="col-md-12" align="left"
					style="padding-left: 100px; padding-top: 15px; padding-bottom: 0;">
					<h2 class="py-3 font-bold font-up blue-text">자유게시판</h2>
				</div>

				<div align="right" style="padding-right: 150px;">
					<c:if test="${id != null }">
					<button type="button" id="addBtn" value="write"
						style="background-color: white; border: solid 0.5px; border-color: rgb(172, 178, 185);">글쓰기</button>
					</c:if>
				</div>
				<br> <br>
				<!-- Grid column -->
			</div>
			<!-- Grid row -->
			<!--Table-->
			<div style="padding-right: 150px; padding-left: 150px;">
				<table class="table table-hover table-responsive mb-0">
					<!--Table head-->
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
						<c:forEach var="brd" items="${info}">
						<tr style="background-color: rgb(240, 232, 232); border: solid 1px white;">
							<td><span style="background-color: rgb(228, 49, 49); border-radius: 4px; color: rgb(250, 204, 204); padding: 2px; font-size: small">공지</span></td>
							<td><a href="boardInfo.do?bid=${vo.brdId}&bwri=${vo.brdWriter}" style="text-decoration:none; color:red;"><c:out value="${brd.brdTitle}" /></a></td>
							<td><c:out value="${brd.brdWriter}" /></td>
							<td><c:out value="${brd.brdDate}" /></td>
							<td><c:out value="${brd.brdRead}" /></td>
						<tr>
						</c:forEach>
					</tbody>
					<tbody>
						<c:forEach var="vo" items="${board}">
							<tr>
								<td><c:out value="${vo.brdId}" /></td>
<<<<<<< HEAD
								<td><a href="boardInfo.do?bid=${vo.brdId}&bwri=${vo.brdWriter}&title=${vo.brdTitle}"><c:out value="${vo.brdTitle}" /></a></td>
=======
								<td><a href="boardInfo.do?bid=${vo.brdId}&bwri=${vo.brdWriter}" style="text-decoration:none; color:black;"><c:out value="${vo.brdTitle}" /></a></td>
>>>>>>> branch 'develop' of https://github.com/Kimeunju99/Campers.git
								<td><c:out value="${vo.brdWriter}" /></td>
								<td><c:out value="${vo.brdDate}" /></td>
								<td><c:out value="${vo.brdRead}" /></td>

							</tr>
						</c:forEach>
					</tbody>
					<!--Table body-->
				</table>
			</div>
				<br><div align="right" style="padding-right: 150px">
					<form id="searchFrm" method="post">
						<select id="search" name="search">
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="wdate">작성일</option>
						</select> <input type="text" id="keyword" name="keyword" style="height:25px">
						<button type="button" id="searchBtn" onclick="boardSearch()"
							style="height:25px; background-color: white; border: solid 0.5px; border-color: rgb(172, 178, 185);">검색</button>
					</form>
				</div>
				<br>
		</div>
	</div>

	<script>
<<<<<<< HEAD
		$('#addBtn').click(function(){
			$(location).attr("href", "boardAddForm.do")
=======
		$('#addBtn').click(function() {
			$(location).attr("href", "boardAdd.do")
>>>>>>> branch 'develop' of https://github.com/Kimeunju99/Campers.git
		})
	</script>
</body>
</html>