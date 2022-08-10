<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>

<style>
form.w3-container {
	width: 50%;
	margin: 10px auto;
}
</style>

</head>

<body>
	<form:form class="w3-container">
		<fieldset class="w3-padding-32">
			<legend class="w3-text-blue w3-center">로그인</legend>

			<c:if test="${error=='LOGIN_NEED'}">
				<div class="w3-text-red">* 로그인 필요</div>
			</c:if>

			<label class="w3-text-blue">USER NAME</label>
			<input name="username" class="w3-input w3-border" />

			<label class="w3-text-blue">PASSWORD</label>
			<input name="password" type="password" class="w3-input w3-border" />

			<button class="w3-button w3-blue w3-right">LOGIN</button>
		</fieldset>
	</form:form>
</body>

</html>