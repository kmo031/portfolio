<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Custom Login Page</h1>
	<h2><c:out value="${error}" /></h2>
	<h2><c:out value="${logout}" /></h2>
	<h3>${logout }</h3>
	
	<form method='post' action="/login">
	<div>
		<input name='username' value='admin'>
	</div>
	<div>
		<input type='password' name='password' value='password'>
	</div>
	<div>
		<input type="submit" value="전송">
	</div>
	<div> <input type='checkbox' name='remember-me'> 기억하기</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token }" />
	
	</form>

</body>
</html>