<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>등록 페이지</h3>
    <form action="boardAdd.do"> 
        <p>제목 : <input type="text" name="title"></p>
		<p>작성자: <input type="text" name="writer" ></p> <!-- 작성자는 session 로그인 자료로 받기 -->
		<p>내용: <textarea name="content"></textarea></p>
        <p>글 유형  <select name="type">
                    <option  value="inform">공지사항</option>
                    <option  value="normal">자유게시판</option>
                    <option  value="review">방문자 리뷰</option>
                </select></p>
                <button type="submit">등록</button>
                <button type="reset">초기화</button>
        </form>
       
       
</body>
</html>