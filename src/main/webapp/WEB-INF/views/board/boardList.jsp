<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/boardList.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
 
<link href="css/pagination.css" rel="stylesheet" />

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
					<input type="hidden" name="type" value="${param.type}">
				</div>

				<div align="right" style="padding-right: 150px;">
					<c:if test="${id != null && logUser.userActivation != '비활성화' }">
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
							<tr	style="background-color: rgb(247, 244, 222); border: solid 1px white;">
								<td><span style="background-color: rgb(228, 49, 49); border-radius: 4px; color: rgb(250, 204, 204); padding: 2px; font-size: small">공지</span>
									</td>
								<td><a href="boardInfo.do?bid=${brd.brdId}" style="text-decoration: none; color: black;"> <c:out
											value="${brd.brdTitle}" /></a></td>
								<td><c:out value="${brd.brdWriter}" /></td>
								<td><c:out value="${brd.brdDate}" /></td>
								<td><c:out value="${brd.brdRead}" /></td>
								
							<tr>
						</c:forEach>
					</tbody>
					<tbody id="boardTbody">
						<c:forEach var="vo" items="${board}">
							<tr>
								<td>
									<c:out value="${vo.brdId}" />
								</td>
								<td><a href="/campers/boardInfo.do?bid=${vo.brdId}&bwri=${vo.brdWriter}" style="text-decoration: none; color: black;">
									<c:out value="${vo.brdTitle}" /></a></td>
								<td><c:out value="${vo.userName}" /></td>
								<td><c:out value="${vo.brdDate}" /></td>
								<td><c:out value="${vo.brdRead}" /></td>
								
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
					<button type="button" id="searchBtn">검색</button>
				</form>
			</div>
			<br>
		</div>
	

<div id="app" class="container" align="center">  
	<ul class="page">
		<c:if test="${page.prev}">
	    <li class="page__btn"><span class="material-icons"><a href="boardList.do?type=${t}&page=${page.startPage - 1}">«</a></span></li>		
		</c:if>
		<c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
			<c:choose>
				<c:when test="${i == curPage}">
					<li class="page__numbers active"><span>
					<a id="act" href="boardList.do?type=${t}&page=${i}"><c:out value="${i}" /></a></span>
					</li>
				</c:when>
				<c:otherwise>
					<li class="page__numbers"><a href="boardList.do?type=${t}&page=${i}" style="text-decoration: none;"> <c:out value="${i}" /></a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	    <c:if test="${page.next}">
	    <li class="page__btn"><span class="material-icons"><a href="boardList.do?type=${t}&page=${page.endPage + 1}">»</a></span></li>
	    </c:if>
  </ul>
</div>
</div>

	<script type="text/javascript">
		$('#addBtn').click(function () {
			$(location).attr("href", "boardAddForm.do")
		})


		const urlParams = new URL(location.href).searchParams;
		const type = urlParams.get('type');
		if(type == 'inform'){
			let h2 = $('<h2 id=type/>').addClass('py-3 font-bold font-up blue-text').text('공지');
			$('.col-md-12').append(h2);
		}else if(type == 'tip'){
			let h2 = $('<h2 id=type/>').addClass('py-3 font-bold font-up blue-text').text('팁 공유');
			$('.col-md-12').append(h2);
		}else if(type == 'review'){
			let h2 = $('<h2 id=type/>').addClass('py-3 font-bold font-up blue-text').text('리뷰');
			$('.col-md-12').append(h2);
		}else if(type == 'normal'){
			let h2 = $('<h2 id=type/>').addClass('py-3 font-bold font-up blue-text').text('자유게시판');
			$('.col-md-12').append(h2);
		}
		
		
		$('#searchBtn').on('click', function boardSearch() {
			let sch = $('#sch').val();
			let type = urlParams.get('type');
			let keyword = $('#keyword').val();
			console.log(sch, keyword);
			let payload = "sch=" + sch + "&keyword=" + keyword + "&type=" + type;
			url = "/campers/boardSearchList.do";
			fetch(url, {
					method: 'post',
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8;'
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
				<td><c:out value="\${data.userName}" /></td>
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