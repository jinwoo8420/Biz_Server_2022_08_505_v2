<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<style>
form.w3-container {
	width: 50%;
	margin: 10px auto;
}
</style>

<form:form class="w3-container">
	<fieldset>
		<legend>회원가입</legend>

		<label class="w3-text-blue">USER NAME</label>
		<input name="username" class="w3-input w3-border" />

		<label class="w3-text-blue">PASSWORD</label>
		<input name="password" type="password" class="w3-input w3-border" />

		<label class="w3-text-blue">RE_PASSWORD</label>
		<input name="re_password" type="password" class="w3-input w3-border" />

		<label class="w3-text-blue">EMAIL</label>
		<input name="email" type="email" class="w3-input w3-border" />

		<label class="w3-text-blue">NAME</label>
		<input name="realname" class="w3-input w3-border" />

		<label class="w3-text-blue">NICKNAME</label>
		<input name="nickname" class="w3-input w3-border" />

		<button class="w3-button w3-blue w3-right">JOIN</button>
	</fieldset>
</form:form>