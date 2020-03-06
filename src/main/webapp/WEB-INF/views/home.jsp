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


	<!-- 테이블 정보 컨테이너  -->
	<div class="container">
		<div class="row">
			<!-- 게시판  -->
			<div class="card col-md-6" style="padding: 0px;">
				<div class="card-header">
					<h5 class="card-title">게시판</h5>
				</div>
				<div class="card-body"> 
					<c:forEach items="${Board}" var="board" begin="0" end="4">
						<ul>
							<li><span><a href="/board/detail?board=board
							&id=<c:out value='${board.id}'/>"><c:out
											value="${board.title }" /></a></span></li>
						</ul>
					</c:forEach>
				</div>
			</div>
			<!-- 게시판 End  -->
			<!-- 공지사항  -->

			<div class="card col-md-6" style="padding: 0px;" >
				<div class="card-header">
					<h5 class="card-title">공지사항</h5>
				</div>
				<div class="card-body">
					<c:forEach items="${Notice}" var="notice" begin="0" end="4">
						<ul>
							<li><span><a href="/board/detail?board=notice
							&id=<c:out value='${notice.id}'/>"><c:out
							value="${notice.title }" /></a></span></li>
						</ul>
					</c:forEach>
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