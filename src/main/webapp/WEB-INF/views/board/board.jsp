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
							<th style="width: 25%;">제목</th>
							<th>작성자</th>
							<th style="width: 20%;">작성일</th>
							<th>조회수</th>
						</tr>

					</thead>
					<tbody>
						<c:forEach items="${board}" var="board">
							<tr>
								<td><c:out value="${board.id}" /></td>
								<td><a class="move" href="<c:out value='${board.id}'/>"><c:out
											value="${board.title}" /></a>
											<span>[<c:out
											value="${board.replyCnt}" />]</span>
											</td>
								<td><c:out value="${board.writer_Id}" /></td>
								<td><c:out value="${board.regdate}" /></td>
								<td><c:out value="${board.hit}" /></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">
								<div class="detailFooter">
									<div>
										<ul class="pagination justify-content-center ">
											<c:if test="${pageMaker.prev}">
												<li class="page-item"><a class="page-link"
													href="${pageMaker.startPage -1 }">이전</a></li>
											</c:if>
											<c:forEach var="num" begin="${pageMaker.startPage}"
												end="${pageMaker.endPage}">
												<li class="page-item ${pageMaker.cri.pageNum == num ? "active" : "" }"  >
													<a class="page-link" href="${num }"><c:out
															value="${num }" /></a>
												</li>
											</c:forEach>
											<c:if test="${pageMaker.next}">
												<li class="page-item"><a class="page-link"
													href="${pageMaker.endPage +1 }">다음</a></li>
											</c:if>
										</ul>
									</div>

									<!-- 검색 부분  -->
									<div class="detailSearch">
										<form action="/board/board" class="col-md-12"
											style="text-align: center;" id="searchForm" method="get">
											<select name="type">
												<option value=""
													<c:out value="${pageMaker.cri.type == null? 'selected' :''}"/>>--</option>
												<option value="T"
													<c:out value="${pageMaker.cri.type eq 'T'? 'selected' :''}"/>>제목</option>
												<option value="C"
													<c:out value="${pageMaker.cri.type eq 'C'? 'selected' :''}"/>>내용</option>
												<option value="W"
													<c:out value="${pageMaker.cri.type eq 'W'? 'selected' :''}"/>>작성자</option>
											</select> <input type="text" placeholder="검색어를 입력해주세요" name="keyword"
												value="<c:out value="${pageMaker.cri.keyword}"/>"> <input
												type="hidden" name="pageNum"
												value="<c:out value='${pageMaker.cri.pageNum}' />">
											<input type="hidden" name="amount"
												value="<c:out value='${pageMaker.cri.amount}' />">
											<button type="submit">
												<i class="fa fa-search"></i>
											</button>
										</form>
									</div>
									<!-- 검색 End  -->
									<div class="detailContent" style="text-align: right;">
										<a class="btn btn-dark" href="/board/register">글쓰기</a>
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
	<!-- row End  -->
</div>

<!-- 페이지 번호 폼  -->
<form id="actionForm" action="/board/board" method="get">
	<input type="hidden" name="pageNum"
		value="<c:out value='${pageMaker.cri.pageNum}' />">
	<input
		type="hidden" name="amount"
		value="<c:out value='${pageMaker.cri.amount}' />">
	<input type="hidden" name="type"
		value="<c:out value='${pageMaker.cri.type}' />">
	<input type="hidden" name="keyword"
		value="<c:out value='${pageMaker.cri.keyword}' />">
</form>


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
				<!-- <button type="button" class="btn btn-dark">Save change</button> -->
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	//모달처리
	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}" />';

						checkModal(result);

						function checkModal(result) {

							if (result === '') {
								return;
							}

							$("#myModal").modal("show");
						}

						//페이지 a태그 클릭시 동작멈추고 from으로 전송
						var actionForm = $("#actionForm");

						$(".page-item a").on(
								"click",
								function(e) {
									e.preventDefault();

									console.log('click');

									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

						//게시글 상세보기시 id값 전달
						$(".move")
								.on(
										"click",
										function(e) {

											e.preventDefault();

											//actionForm.append("<input type='hidden' name='id' value='" + $(this).attr('href') +"'>");
											actionForm
													.append("<input type='hidden' name='id' value='"
															+ $(this).attr(
																	"href")
															+ "'>");

											console.log($(this).attr("href"));
											actionForm.attr("action",
													"/board/detail");
											actionForm.submit();
										});

						//검색어 관련 스크립트
						var searchForm = $("#searchForm");

						$("#searchForm button").on(
								"click",
								function(e) {

									if (!searchForm.find("option:selected")
											.val()) {
										alert("검색 종류를 선택하세요");
										return false;
									}
									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}

									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();

									searchForm.submit();
								});
					});
</script>


<%@include file="../includes/footer.jsp"%>