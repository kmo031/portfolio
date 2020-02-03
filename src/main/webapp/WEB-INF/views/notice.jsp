<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="./includes/header.jsp"%>

<div class="container">
	<div class="row">
		<!-- 공지사항  -->
		<div class="card table-responsive">
			<div class="card-header">
				<h5 class="card-title">공지사항</h5>
			</div>
			<div class="card-body table-responsive">
				<table class="table table-dark table-striped table-bordered table-hover"
					style="text-align: center;">
					<thead>
						<tr>
							<th>No</th>
							<th style="width: 50%;">제목</th>
							<th>작성자</th>
							<th style="width: 20%;">작성일</th>
							<th>조회수</th>
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
		<!-- 공지사항 End  -->
	</div>
</div>




<%@include file="./includes/footer.jsp"%>