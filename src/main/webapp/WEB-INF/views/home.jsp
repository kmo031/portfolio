<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewprot" content="width=divice-width, initial-scale=1">
<title>코딩스터디</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/custom.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<!-- nav시작  -->
	<nav class="navbar navbar-expand-md">
		<div class="container-fluid">

			<!-- Brand -->
			<a class="navbar-brand" href="#">코딩스터디</a>
			<!-- Toggler/collapsibe Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar links -->
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ">
					<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
					<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">사용 툴 및 기술</a></li>
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

	<!-- 점보트론 시작  -->
	<div class="container">
		<div class="jumbotron">
			<h1 class="text-center">코딩 스터디를 소개합니다</h1>
			<p class="text-center">프로그래밍을 공부하는 사람들의 질문 및 정보를 공유하는 사이트입니다.</p>
			<!-- <p class="text-center">
				<a class="btn btn-primary btn-lg" href="#" role="button">강의들으러가기</a>
			</p> -->
		</div>


		<!-- <div class="row">
			<div class="col-md-4">
				<h4>코딩부스터의 특징</h4>
				<p>코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징</p>
				<p>
					<a class="btn btn-dark" data-target="#modal1" data-toggle="modal">자세히보기</a>
				</p>
			</div>
			<div class="col-md-4">
				<h4>코딩부스터의 특징</h4>
				<p>코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징</p>
				<p>
					<a class="btn btn-dark" data-target="#modal2" data-toggle="modal">자세히보기</a>
				</p>
			</div>
			<div class="col-md-4">
				<h4>코딩부스터의 특징</h4>
				<p>코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징코딩 부스터의 특징</p>
				<p>
					<a class="btn btn-dark" data-target="#modal3" data-toggle="modal">자세히보기</a>
				</p>
			</div>
		</div> -->

		<!-- 테이블 정보 컨테이너  -->
		<div class="container">
			<div class="row">
				<div class="col-6">

					<!-- 공지사항  -->
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">공지사항</h5>
						</div>
						<div class="card-body">
							<ul>
								<li>테스트</li>
							</ul>
						</div>
					</div>
					<!-- 공지사항 End  -->
				</div>
				<div class="col-6">
					<!-- 게시판  -->
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">게시판</h5>
						</div>
						<div class="card-body">
							<c:forEach items="${List}" var="board">
								<ul>
									<li><span><a href="#"><c:out value="${board.title }" /></a></span>
										<span><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></span>
									</li>		
								</ul>
							</c:forEach>
						</div>
					</div>
					<!-- 게시판 End  -->
				</div>

			</div>
		</div>
		<!-- 테이블정보 컨터이너 End  -->

	</div>
	<!-- 점보트론 End  -->

	<hr />

	<!-- footer 시작  -->
	<footer style="background-color: #000000; color: #ffffff">
		<div class="container">
			<br>
			<div class="row">

				<div class="col-sm-4">
					<h4>대표자 소개</h4>
					<p>저는 공부를 하고있습니다.</p>
				</div>

				<div class="col-sm-12" style="text-align: center;">
					<h5>Copyright &copy; 2020 정상민(Sangmin Jung)</h5>
				</div>
			</div>
		</div>
	</footer>

</body>


</html>