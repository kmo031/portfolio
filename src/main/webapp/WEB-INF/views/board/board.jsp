<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<div class="container">
	<div class="row">
		<!-- 게시판  -->
		<div class="card table-responsive">
			<div class="card-header">
				<h5 class="card-title">게시판</h5>
			</div>
			<div class="card-body ">
				<table class="table table-dark table-striped table-hover"
					style="text-align: center;">
					<thead>
						<tr>
							<!-- <th style="width: 7%">No</th>
								<th style="width: 55%;">제목</th> 
								<th style="width: 10%;">작성자</th>
								<th style="width: 18%;">작성일</th>
								<th style="width: 10%;">조회수</th> -->
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
								<td><a href="/board/detail?id=<c:out value='${board.id}'/>"><c:out
											value="${board.title}" /></a></td>
								<td><c:out value="${board.writer_Id}" /></td>
								<td><c:out value="${board.regdate}" /></td>
								<td><c:out value="${board.hit}" /></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr style="text-align: right;">
							<td colspan="5">
								<div class="detailFooter">
									<div class="detailPage" style="text-align: center;">
										페이지
									</div>
									<div class="detailSearch">
										<form action="/action_page.php" class="col-md-12"
											style="text-align: center;">
											<input type="text" placeholder="검색어를 입력해주세요" name="search">
											<button type="submit">
												<i class="fa fa-search"></i>
											</button>
										</form>
									</div>
									<div class="detailContent">
										<a class="btn btn-dark"
											href="/board/register">글쓰기</a>
									</div>
								</div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		<!-- 게시판 End  -->
	</div>
</div>




<%@include file="../includes/footer.jsp"%>