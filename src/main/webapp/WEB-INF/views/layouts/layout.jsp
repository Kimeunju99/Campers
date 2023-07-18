<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title" /></title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="images/icon/1_icon.png" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link href="css/stylesLogin.css" rel="stylesheet" />
</head>

<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<div align="center">
			<!-- header -->
			<tiles:insertAttribute name="header" />

			<!-- body-contents -->
			<tiles:insertAttribute name="body" />
	</main>
	<!-- footer -->
	<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>