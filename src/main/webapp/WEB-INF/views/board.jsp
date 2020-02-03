<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp"%>

<div class="container" style="margin-top: 10px;">
	<div class="row">
		<!-- 게시판  -->
		<div class="col-12">
			<div class="card">
				<div class="card-header">
					<h5 class="card-title">게시판</h5>
				</div>
				<div class="card-body">
					<table class="table table-dark table-striped" style="text-align: center;">
						<thead>
							<tr>
								<th style="width: 5%">No</th>
								<th style="width: 50%;">제목</th>
								<th style="width: 15%;">작성자</th>
								<th style="width: 20%;">작성일</th>
								<th style="width: 10%;">조회수</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach items="${board}" var="board">
								<tr>
									<td><c:out value="${board.id}" /></td>
									<td><a
										href="/board/content?no=<c:out value='${board.id}'/>"><c:out
												value="${board.title}" /></a></td>
									<td><c:out value="${board.writer_Id}" /></td>
									<td><c:out value="${board.regdate}" /></td>
									<td><c:out value="${board.hit}" /></td>
								</tr>

							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 게시판 End  -->
	</div>
</div>




<%@include file="./includes/footer.jsp"%>