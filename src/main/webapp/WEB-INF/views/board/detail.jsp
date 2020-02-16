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
									<div class="detailContent">${detail.content}</div>
								</div></td>
						</tr>
					</tbody>
					<tfoot>
						<tr style="text-align: right;">
							<td colspan="4">
								<div class="detailFooter">
									<div class="detailContent">
										<form action="#" method="post">
											<input type="hidden" name="id" value="${detail.id}">
											<input type="hidden" name="type"
												value="<c:out value="${detail.type }"/>"> <input
												type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}">
											<button class="btn btn-dark" type="submit" data-oper='list'>목록</button>
											<button class="btn btn-dark" type="submit" data-oper='modify'>수정</button>
											<button class="btn btn-dark" type="submit" data-oper='remove'>삭제</button>
										</form>

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


<div class="modal fade" id="myModal">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">확인</h4>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="modal-body">처리가 완료되었습니다.</div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-dark">닫기</button>
				<!-- <button type="button" class="btn btn-dark">Save changes</button> -->
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	//모달처리
	$(document).ready(function() {
		var result = '<c:out value="${result}" />';

		checkModal(result);

		function checkModal(result) {

			if (result === '') {
				return;
			}
			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글" + parseInt(result) + "번이등록되었습니다.");
			}

			$("#myModal").modal("show");
		}
	});

	//submit처리
	$(document)
			.ready(
					function() {

						var formObj = $("form");

						$('form > button')
								.on(
										"click",
										function(e) {
											e.preventDefault();
											var operation = $(this)
													.data("oper");

											console.log(operation);

											if (operation === 'remove') {
												formObj.attr("action",
														"/board/remove");
											} else if (operation === 'modify') {
												formObj.attr("method", "get");
												formObj.attr("action",
														"/board/modify");
											} else if (operation === 'list') {//목록페이지로 이동시 원래 페이지로 이동
												self.location = "/board/<c:out value='${detail.type}' />?"+
													"PageNum=<c:out value="${cri.pageNum}" />&amount=<c:out value="${cri.amount}" />";
												return;
											}
											formObj.submit();
										});
					});
</script>




<%@include file="../includes/footer.jsp"%>
