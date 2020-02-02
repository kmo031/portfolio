<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp"%>

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
				<!-- 게시판  -->
				<div class="col-8">
					<div class="card">
						<div class="card-header">
							<h5 class="card-title">게시판</h5>
						</div>
						<div class="card-body">
							<c:forEach items="${List}" var="board">
								<ul>
									<li><span><a href="#"><c:out
													value="${board.title }" /></a></span> <span><fmt:formatDate
												pattern="yyyy-MM-dd" value="${board.regdate}" /></span></li>
								</ul>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 게시판 End  -->
				<!-- 공지사항  -->
				<div class="col-4">
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
				</div>
				<!-- 공지사항 End  -->
			</div>
		</div>
		<!-- 테이블정보 컨터이너 End  -->

	</div>
	<!-- 점보트론 End  -->

	<hr />

<%@include file="./includes/footer.jsp"%>