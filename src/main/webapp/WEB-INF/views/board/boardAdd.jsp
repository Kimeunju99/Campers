<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

button:hover {
	color: green;
	background-color: skyblue;
}

button {
  border: 2px solid #91C3CE;
  outline: none;
  background: none;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
}

button {
  display: inline-block;
  margin: auto;
  width: 100px;
  height: 36px;
  border-radius: 30px;
  color: #008481;
  font-size: 15px;
  cursor: pointer;
  border: 2px solid #91C3CE;
  outline: none;
  background: none;
  font-family: "Open Sans", Helvetica, Arial, sans-serif;
}


#container{

	margin: 0 auto;
	width: 1500px;
	
}

input, textarea {
	height: 50px;
	border-radius: 10px;
}


#all {
	width: 100%;
	margin: 0 auto;
	text-align: center;
}

h2 {
	text-align: center;
	color: #008481;
}

input {
	width: 50%;
}

select {
	width: 50%;
	padding: .8em .5em;
	font-family: inherit;
	background:
		url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg)
		no-repeat 95% 50%;
	border: 1px solid #999;
	border-radius: 0px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	border-radius: 15px;
}

</style>
</head>
<body>
 <div id="container">
	<br>
	<div id="all">
		<h2>글쓰기</h2>
		<form action="boardAdd.do" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<td><select name="type">
							<c:if test="${auth eq 'admin'}">
								<input type="text" value="inform">공지사항
		            		</c:if>
							<option value="normal">자유게시판</option>
							<option value="review">방문자 리뷰</option>
							<option value="tip">팁 공유</option>
					</select></td>
				</tr>
		
				<tr>
					<td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
				</tr>
				<tr>
					<td><input type="text" name="writer" readonly value="${id }"></td>
				</tr>
				<tr>
					<td><textarea name="content" placeholder="내용을 입력하세요."
							cols="40" rows="10" style="width: 50%; height: 50%;"></textarea></td>
				</tr>
				<tr>
					<td>사진 업로드: <input type="file" name="img"></td>
				</tr>
			</table>
			<div id="btn_group">
				<button id="btn1" type="submit">등록</button>
				<button id="btn2" type="reset">초기화</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>