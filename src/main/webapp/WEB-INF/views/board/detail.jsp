<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../includes/header.jsp"%>


<div class="container">
	<div class="row">
		<!-- 게시판  -->
		<div class="card table-responsive">
			<div class="card-header">
				<h5 class="card-title">게시글</h5>
			</div>
			<div class="card-body">
				<table class="table table-dark table-striped col-md-12 ">
					<thead class="thead-dark">
						<tr>
							<th style="text-align: center;"><strong>작성자 : </strong> <c:out
									value="${detail.writer_Id}" /></th>
							<th style="width: 40%; text-align: center"><strong><c:out
										value="${detail.title}" /></strong></th>
							<th style="width: 20%; text-align: right;"><c:out
									value="${detail.regdate}" /></th>
							<th style="text-align: right;"><strong>조회 : </strong> <c:out
									value="${detail.hit}" /></th>
						</tr>
					</thead>
					<tbody>
						<tr height="100%">
							<td colspan="4"><div class="detailBody">
									<div class="detailContent">
										${detail.content}
									</div>
								</div></td>
						</tr>
					</tbody>
					<tfoot>
						<tr style="text-align: right;">
							<td colspan="4">
								<div class="detailFooter">
									<div class="detailContent">
										<a class="btn btn-dark"
											href="/board/<c:out value="${detail.type }"/>">목록</a> <a
											class="btn btn-dark"
											href="/board/modify?id=<c:out value="${detail.id }"/>">수정</a> <a
											class="btn btn-dark"
											href="/board/<c:out value="${detail.type }"/>">삭제</a>
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
