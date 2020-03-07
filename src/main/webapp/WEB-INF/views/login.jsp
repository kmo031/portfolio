<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp"%>
<style type="text/css">



.back-image {
	align-content: center;
	background-image: url('/resources/images/banner.jpg');
	background-size: cover;
	background-repeat: no-repeat;
	max-width: 100%;
	height: 100%;
	max-height: 100%;
}

.card {
	height: 370px;
	margin-top: auto;
	margin-bottom: auto;
	width: 400px;
	background-color: rgba(0, 0, 0, 0.5) !important;
}

.social_icon span {
	font-size: 60px;
	margin-left: 10px;
	color: #FFC312;
}

.social_icon span:hover {
	color: white;
	cursor: pointer;
}

.card-header h3 {
	color: white;
}

.social_icon {
	position: absolute;
	right: 20px;
	top: -45px;
}

.input-group-prepend span {
	width: 50px;
	background-color: #FFC312;
	color: black;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
}

.remember {
	color: white;
}

.remember input {
	width: 20px;
	height: 20px;
	margin-left: 15px;
	margin-right: 5px;
}

.login_btn {
	color: black;
	background-color: #FFC312;
	width: 100px;
}

.login_btn:hover {
	color: black;
	background-color: white;
}

.links {
	color: white;
}

.links a {
	margin-left: 4px;
}
</style>

<%-- <h1>Custom Login Page</h1>
<h2>
	<c:out value="${error}" />
</h2>
<h2>
	<c:out value="${logout}" />
</h2>
<h3>${logout }</h3> --%>

<div class="container back-image">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>로그인</h3>
				<h4 style="color: #f4362d;">
					<c:out value="${error}" />
				</h4>
			</div>
			<div class="card-body">
				<form method="post" action="/login">
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="username" autofocus
							placeholder="아이디" required  maxlength="30"
							oninvalid="this.setCustomValidity('아이디를 입력하여주세요.')" oninput="setCustomValidity('')">

					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" name="password"
							placeholder="패스워드" required maxlength="30"
							oninvalid="this.setCustomValidity('패스워드를 입력하여주세요.')" oninput="setCustomValidity('')">
					</div>
					<div class="row align-items-center remember">
						<input type="checkbox" name="remember-me">기억하기
					</div>
					<div class="form-group">
						<input type="submit" value="로그인" class="btn float-right login_btn">
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token }" />
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					아이디가 없으신가요?<a href="/member/signup">회원가입</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">비밀번호를 잃어버리셨나요?</a>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="./includes/footer.jsp"%>