<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
select{
  width: 150px; 
  padding: .8em .5em;
  font-family: inherit;  
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  border: 1px solid #999; 
  border-radius: 0px; 
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}

#btn1{
  border: 0;
  outline: none;
  width: 50px;
  height: 50px;
  border-radius: 100px;
  font-size: 15px;
  margin: 30px;
  box-shadow: 3px 3px 3px rgb(109, 109, 109), -3px -3px 3px rgb(237, 237, 237);
  transition: 0.3s;
}
#btn2{
  border: 0;
  outline: none;
  width: 50px;
  height: 50px;
  border-radius: 100px;
  font-size: 12px;
  margin: 30px;
  box-shadow: 3px 3px 3px rgb(109, 109, 109), -3px -3px 3px rgb(237, 237, 237);
  transition: 0.3s;
}

#btn_group{
	
	background-color: rgba(0,0,0,0);
	color: skyblue;
	padding: 5px;
}
#btn_group button:hover{
	color:white;
	background-color: skyblue;
}
</style>
</head>
<body>
	
	<br>
	<h3>등록페이지</h3>
    <form action="boardAdd.do" method="post" enctype="multipart/form-data"> 
    	<table class="table">
			<tr>
    			<td><select name="type">
						<c:if test="${auth eq 'admin'}">
		            		<input type="text" value="inform">공지사항
		            	</c:if>
                    		<option value="normal">자유게시판</option>
                    	    <option value="review">방문자 리뷰</option>
               </select></td>
             </tr>	
    		<tr>
    			<td><input type="text" name="title" placeholder="제목을 입력하세요"></td>
    		</tr>
    		<tr>
    			<td><input type="text" name="writer" readonly value="${id }" ></td>
    		</tr>
    		<tr>
    			<td><textarea name="content" placeholder="내용을 입력하세요." 
    			cols="40" rows="10" style="width:50%; height:50%;"></textarea></td>
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
   
    
</body>
</html>