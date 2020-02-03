<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">
<title>코딩스터디</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/custom.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">

</head>
<body>

	<!-- nav시작  -->

	<header>
		<nav class="navbar navbar-expand-md fixed-top">
			<div class="container-fluid">

				<!-- Brand -->
				<a class="navbar-brand" href="/">코딩스터디</a>
				<!-- Toggler/collapsibe Button -->
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#collapsibleNavbar">
					<span class="navbar-toggler-icon"></span>
				</button>

				<!-- Navbar links -->
				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav ">
						<li class="nav-item"><a class="nav-link" href="/board/notice">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="/board/normal">게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="/board/skill">사용
								툴 및 기술</a></li>
						<li class="nav-item"><a class="nav-link" href="#">채팅</a></li>
						<!-- Dropdown -->
						<!-- <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> Dropdown link </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Link 1</a> <a
								class="dropdown-item" href="#">Link 2</a> <a
								class="dropdown-item" href="#">Link 3</a>
						</div></li> -->


					</ul>

					<!-- 로그인 드롭다운  -->
					<ul class="nav navbar-nav ml-auto">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">
								로그인 </a>
							<div class="dropdown-menu dropdown-menu-right ">
								<a class="dropdown-item" href="/customLogin">로그인</a> <a
									class="dropdown-item" href="#">회원가입</a>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>