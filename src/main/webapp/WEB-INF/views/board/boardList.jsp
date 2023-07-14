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
				<div class="col-md-12" align="left" style="padding-left: 100px; padding-top: 15px; padding-bottom: 0;">

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
								<td><span
										style="background-color: rgb(228, 49, 49); border-radius: 4px; 
										color: rgb(250, 204, 204); padding: 2px; font-size: small">공지</span>
								</td>
								<td><a href="/campers/boardInfo.do?bid=${brd.brdId}&bwri=${brd.brdWriter}"
										style="text-decoration: none; color: red;">
										<c:out value="${brd.brdTitle}" /></a></td>
								<td>
									<c:out value="${brd.brdWriter}" />
								</td>
								<td>
									<c:out value="${brd.brdDate}" />
								</td>
								<td>
									<c:out value="${brd.brdRead}" />
								</td>
							<tr>
						</c:forEach>
					</tbody>
					<tbody id="boardTbody">
						<c:forEach var="vo" items="${board}">
							<tr>
								<td>
									<c:out value="${vo.brdId}" />
								</td>
								<td><a href="/campers/boardInfo.do?bid=${vo.brdId}&bwri=${vo.brdWriter}"
										style="text-decoration: none; color: black;">
										<c:out value="${vo.brdTitle}" /></a></td>
								<td>
									<c:out value="${vo.userName}" />
								</td>
								<td>
									<c:out value="${vo.brdDate}" />
								</td>
								<td>
									<c:out value="${vo.brdRead}" />
								</td>

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
					</select> <input type="text" id="keyword" name="keyword" style="height: 25px">
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
					<a href="boardList.do?type=${t}&page=${i}" class="active">
						<c:out value="${i}" /></a>
				</c:when>
				<c:otherwise>
					<a href="boardList.do?type=${t}&page=${i}">
						<c:out value="${i}" /></a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${page.next}">
			<a href="boardList.do?type=${t}&page=${page.endPage + 1}">»</a>
		</c:if>

	</div>

	<script type="text/javascript">
		$('#addBtn').click(function () {
			$(location).attr("href", "boardAddForm.do")
		})


		const urlParams = new URL(location.href).searchParams;
		const type = urlParams.get('type');
		if(type == 'inform'){
			let h2 = $('<h2 />').addClass('py-3 font-bold font-up blue-text').text('공지');
			$('.col-md-12').append(h2);
		}else if(type == 'tip'){
			let h2 = $('<h2 />').addClass('py-3 font-bold font-up blue-text').text('팁 공유');
			$('.col-md-12').append(h2);
		}else if(type == 'review'){
			let h2 = $('<h2 />').addClass('py-3 font-bold font-up blue-text').text('리뷰');
			$('.col-md-12').append(h2);
		}else {
			let h2 = $('<h2 />').addClass('py-3 font-bold font-up blue-text').text('자유게시판');
			$('.col-md-12').append(h2);
		}
		
		
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
				}).then(Response => Response.json())
				.then(json => viewHTML(json));
		})

		function viewHTML(datas) {
			console.log(datas);
			let t = '';
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