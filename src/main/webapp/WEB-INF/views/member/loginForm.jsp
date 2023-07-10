<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<form action="loginControl.do">
		<input type="text" name="userId" id="userId" value="user01">
		<input type="password" name="userPw" id="userPw" value="user01">
		<input type="submit" value="로그인">
	</form>
		<input type="button" onclick="memberJoin.do" value="회원가입">
</div>