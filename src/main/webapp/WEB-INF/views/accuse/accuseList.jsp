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
					<h2>게시판 관리</h2><br>
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
							<th>번호</th>
							<th>글번호</th>
							<th>글제목</th>
							<th>신고된 아이디</th>
							<th>신고 접수 날짜</th>
							<th>신고자</th>
							<th>신고유형</th>
							<th>접수상태</th>
						</tr>
					</thead>
					<!--Table head-->
					<!--Table body-->
					<tbody id="boardTbody">
						<c:forEach var="vo" items="${list}">
							<tr>
								<td><c:out value="${vo.accuseId}" /></td>
								<td><c:out value="${vo.accuseBrd}" /></td>
								<td><a href="/campers/boardInfo.do?bid=${vo.accuseBrd}" style="text-decoration: none; color: black;"> 
								<c:out value="${vo.accuseTitle}" /></a></td>
								<td><c:out value="${vo.accuseUserId}" /></td>
								<td><c:out value="${vo.accuseDate}" /></td>
								<td><c:out value="${vo.accuseReport}" /></td>
								<td><c:out value="${vo.accuseContent}" /></td>
								<td><c:out value="${vo.accuseState}" /></td>
							</tr>
						</c:forEach>
					</tbody>
					<!--Table body-->
				</table>
			</div>
			<br>
			<div align="right" style="padding-right: 150px">
				<form id="searchFrm" method="post">
					<select id="sch" name="sch">
						<option value="writer">작성자</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="wdate">작성일</option>
					</select> <input type="text" id="keyword" name="keyword"
						style="height: 25px">
					<button type="button" id="searchBtn"
						style="height: 25px; background-color: white; border: solid 0.5px; border-color: rgb(172, 178, 185);">검색</button>
				</form>
			</div>
			<br>
		</div>
	</div>


	<br>
	<div class="pagination" align="center">

		<c:if test="${page.prev}">
			<a href="boardList.do?type=${t}&page=${page.startPage - 1}">«</a>
		</c:if>
		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">

			<c:choose>
				<c:when test="${i == curPage}">
					<a href="boardList.do?type=${t}&page=${i}" class="active"> <c:out
							value="${i}" /></a>
				</c:when>
				<c:otherwise>
					<a href="boardList.do?type=${t}&page=${i}"> <c:out value="${i}" /></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.next}">
			<a href="boardList.do?type=${t}&page=${page.endPage + 1}">»</a>
		</c:if>

	</div>

	<script type="text/javascript">
		
		
		$('#searchBtn').on('click', function boardSearch() {
			let sch = $('#sch').val();
			let keyword = $('#keyword').val();
			console.log(sch, keyword);
			let payload = "sch=" + sch + "&keyword=" + keyword;
			url = "/campers/boardSearchList.do";
			fetch(url, {
					method: 'post',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
					},
					body: payload
				}).then(response => response.json())
				.then(json => viewHTML(json))
				.catch(error => console.error(error));
		})

		function viewHTML(datas) {
			console.log(datas);
			let out = '';
			$('#boardTbody').empty();

			for (let data of datas) {
				out = `
			<tr> 
				<td><c:out value="\${data.brdId}" /></td>
				<td><a href="/campers/boardInfo.do?bid=\${data.brdId}&bwri=\${data.brdWriter}" style="text-decoration:none; color:black;"><c:out value="\${data.brdTitle}" /></a></td>
				<td><c:out value="\${data.brdWriter}" /></td>
				<td><c:out value="\${data.brdDate}" /></td>
				<td><c:out value="\${data.brdRead}" /></td>

			</tr>
			`;
				$('#boardTbody').append(out);
			}
		}
	</script>
</body>

</html>