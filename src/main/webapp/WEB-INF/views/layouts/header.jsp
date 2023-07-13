<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="main.do">Campers</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="#">판매</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">캠핑장</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="searchCamp.do">검색</a></li>
                        <li><a class="dropdown-item" href="blog-post.html">예약</a></li>
                        <li><a class="dropdown-item" href="blog-post.html">리뷰</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">커뮤니티</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="blog-home.html">공지사항</a></li>
                        <li><a class="dropdown-item" href="boardList.do">자유게시판</a></li>
                        <li><a class="dropdown-item" href="blog-post.html">팁공유</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">

				<c:if test="${empty id}">
                	<li class="nav-item"><a class="nav-link" href="loginForm.do">로그인</a></li>
				</c:if>
				<c:if test="${not empty id}">

                	<li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">${name} 님</a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                        <li><a class="dropdown-item" href="mypage.do">마이페이지</a></li>
                        <c:if test="${auth eq 'admin'}">
                        	<li><a class="dropdown-item" href="#">회원 관리</a></li>
                        	<li><a class="dropdown-item" href="#">게시판 관리</a></li>
						</c:if>
                        <li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
                    </ul>
                </li>
				</c:if>
                </li>
            </ul>
        </div>
    </div>
</nav>