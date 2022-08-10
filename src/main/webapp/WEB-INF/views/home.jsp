<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html {
	width: 100vw;
	height: 100vh;
}

body {
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
}

header {
	padding: 2rem;
	color: white;
	background-color: green;
	display: flex;
	justify-content: center;
	align-items: center;
}

nav {
	background-color: blue;
	color: white;
}

nav ul {
	list-style: none;
	display: flex;
}

nav li {
	padding: 16px 12px;
}

nav a {
	text-decoration: none;
	color: inherit;
	margin: 5px 0;
	padding: 0 12px;
	border-bottom: 3px solid transparents;
	transition: 0.3s;
	border-bottom: 3px solid transparents;
}

nav a:hover {
	border-bottom: 3px solid #ddd;
}

nav li:nth-of-type(4) {
	margin-left: auto;
}

nav li:nth-of-type(1) {
	margin-left: 20px;
}

nav li:last-of-type {
	margin-right: 20px;
}

section.main {
	flex: 1;
}

article.welcome {
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	display: flex;
}
</style>

</head>
<body>
	<header>
		<h1>Hello</h1>
	</header>

	<nav>
		<ul>
			<li><a href="${rootPath}/">HOME</a></li>
			<li><a href="${rootPath}/todo">TODO</a></li>
			<li><a href="${rootPath}/about">ABOUT</a></li>

			<sec:authorize access="isAnonymous()">
				<li><a href="${rootPath}/user/login">LOGIN</a></li>
				<li><a href="${rootPath}/user/join">JOIN</a></li>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
				<li><a href="${rootPath}/logout">LOGOUT</a></li>
				<li><a href="${rootPath}/user/mypage">MYPAGE</a></li>
			</sec:authorize>
		</ul>
	</nav>

	<section class="main">
		<c:choose>
			<c:when test="${LAYOUT=='JOIN'}">
				<%@ include file="/WEB-INF/views/user/join.jsp"%>
			</c:when>
			
			<c:when test="${LAYOUT=='LOGIN'}">
				<%@ include file="/WEB-INF/views/user/login.jsp"%>
			</c:when>
			
			<c:otherwise>
				<article class="welcome">
					<h1>TODO LIST App 2022</h1>
					<p>TODO LIST를 사용 시 회원가입 / 로그인 필요</p>
				</article>
			</c:otherwise>

		</c:choose>
	</section>

	<form:form class="logout" action="${rootPath}/logout">
	</form:form>

</body>
</html>