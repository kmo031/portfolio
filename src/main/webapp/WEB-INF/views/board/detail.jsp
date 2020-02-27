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
		<!-- 댓글  -->
		<div class="card col-md-12" style="padding: 0px;">
			<div class="card-header">댓글</div>
			<div class="card-body">
				<ul class="chat list-group">
					<li class="left clearfix" data-rno='12'>
						<div>
							<p>입력된내용이없습니다.</p>
						</div>
					</li>
				</ul>
				<div class="card-footer ">
					<div class="cmtPage"></div>
					<div class="cmtWriteForm">
						<table class="replyTable" cellspacing="0" cellpadding="0">
							<tbody>
								<tr>
									<td class="cmtContentTd ">
										<div class="cmtContent textLogin ">
											<textarea id="cmtComment" name="COMMENT"
												class="form-control cmtText" maxlength='300' rows="3" cols="120"
												tabindex="1" ></textarea>
										</div>
									</td>
									<td class="cmtBttnTd" style="vertical-align: bottom; display: table-cell;">
										<div class="cmtSubmit">
											<input type="button" id="btnCmt" class="cmtSubmit" value="전송"
												tabindex="2" alt="코멘트 등록">
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- End 댓글  -->
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

<%-- <div class="userInfo">

	<input type="hidden" id="replyUser" value="<sec:authentication property="principal.membe.userName"/>">
	
	
</div> --%>

<script type="text/javascript" src="/resources/js/reply.js"></script>


<script type="text/javascript">
	//시큐리티 csrf토큰생성
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

	//Ajax spring security header....
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});

	//게시글가져오기
	$(document)
			.ready(
					function() {

						var idValue = '<c:out value="${detail.id}"/>';
						var replyUL = $(".chat");
						
						var replyer = null;
						
						//로그인되어있을경우 유저이름 가져오기
						<sec:authorize access="isAuthenticated()">
							replyer = "<sec:authentication property='principal.username'/>";  
						</sec:authorize>

						showList(1);

						function showList(page) {
							
							console.log("show List " + page);
							
							
							//댓글가져오기 
							replyService
									.getList(
											{
												id : idValue,
												page : page || 1
											},
											function(replyCnt, list) {
												
												if(page == -1){
													pageNum = Math.ceil(replyCnt/10.0);
													showList(pageNum);
													return;
												}
												
												var str = "";

												if (list == null
														|| list.length == 0) {
													replyUL.html("");

													return;
												}
												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class='list-group-item' data-rno='"+list[i].rno+"'>";
													str += "<div><div class='header'><strong class='primary-font'>"
															+ list[i].replyer
															+ "</strong>";
													str += "<small class='text-right'>"
															+replyService.displayTime(list[i].replyDate)
															+ "</small></div>";
													
						
													str += "<p class='cmtText'>" + list[i].reply + "</p></div>" ; 
												
													//권한이 있을경우 삭제 수정 뜨도록		
													<sec:authorize access="isAuthenticated()"> 
														if(replyer === list[i].replyer){
															str += " <button id='btnCmtRemove'>삭제</button ><button id='btnCmtUpdate'>수정</button></li>";
														}
													</sec:authorize>
													
													str += "</li>";

												}
												
												replyUL.html(str);
												showReplyPage(replyCnt);
											}); //End Function
							

						}// End ShowList
						
				//댓글 페이지 처리
						//페이지 출력
						var pageNum = 1;
						var replyPage = $(".cmtPage");
						
						function showReplyPage(replyCnt){
							var endNum = Math.ceil(pageNum / 5.0) * 5;
							var startNum = endNum - 4;
							var prev = startNum != 1;
							var next = false;
							
							if(endNum * 10 >= replyCnt){
								endNum = Math.ceil(replyCnt/10.0);
							}
							
							if(endNum * 10 < replyCnt){
								next = true;
							}
							
							var str = "<ul class='pagination justify-content-center'>";
							
							if(prev){
								str += "<li class='page-item'><a class='page-link' href='"
								+ (startNum -1) +"'>이전</a></li>";
							}
							
							for(var i = startNum ; i <= endNum; i++){
								var active = pageNum == i? "active" : "";
								
								str += "<li class='page-item" + active + " '> <a class='page-link' href ='"
								+ i + "'>" + i + "</a></li>";
								
							}
							if(next){
								str += "<li class='page-item'><a class='page-link' href='"
								+(endNum + 1 ) + "'>다음</a></li>";
							}						
							str += "</ul></div>";
							
							replyPage.html(str);
							
						}
						
						//댓글 페이지 이동 처리 
						replyPage.on("click", "li a", function(e){
							
							e.preventDefault();
							console.log("page click");
							
							var targetPageNum = $(this).attr("href");
							
							pageNum = targetPageNum;
							
							showList(pageNum);
						});
						
						
						//댓글 입력
						$("#btnCmt").on("click",function(e){
							var replyTBL =$(".replyTable");
							
							var inputReply = replyTBL.find("textarea[name='COMMENT']");
							
							if(inputReply.val().length === 00 || inputReply.val().trim() === ""){
								inputReply.focus();
								alert("댓글을 입력하여주세요");
								return;
							} 
							
							var reply = {
									reply : inputReply.val(),
									replyer : replyer,
									id : idValue
							};
							replyService.add(reply,function(result){
								alert(result);
								inputReply.val("");
								showList(1);
							});
							
						});//End 댓글입력
						
						
						//댓글 삭제 버튼입력시 동적으로 생성된 버튼이라 이렇게 사용하여야함
						$(document).on("click","#btnCmtRemove",function(){ 
							var rno = $(this).parents("li").attr('data-rno')
							
							
							 replyService.remove(rno,function(result){
								alert(result);
								
								showList(pageNum);
							
							});
						});//End 댓글 삭제
						
						//댓글 업데이트 버튼입력시 동적으로 생성된 버튼이라 이렇게 사용하여야함
						$(document).on("click","#btnCmtUpdate",function(){ 
							
							var replyTBL =$(this).prevAll("div").children(".cmtText");
							
							replyTBL.html("<input type='text' maxlength='300'> <button id='btnCmtUpdateOK'>수정완료</button>");
							//console.log("길이"+replyText.length);
						});//End 댓글 업데이트 
						
						
						
						//댓글 업데이트
						$(document).on("click","#btnCmtUpdateOK",function(){ 
							
							var rno = $(this).parents("li").attr('data-rno')
							
							var reply = {
									 rno : rno,
									 id : idValue,
									 reply : $(this).prev().val()
							};
							replyService.update(reply,function(result){
								alert(result);
								
								showList(pageNum);
							});
							
						});//End 댓글 업데이트
						
						
						
						$(function(){
							  var cmtStatus = $('.cmtText, .cmtSubmit');
							  cmtStatus.focus(function(){
								  
								<sec:authorize access="isAnonymous()">
									self.location = "/login";
									return;
								</sec:authorize>
							  });
							});
						
						
					});//End ready
	
	
	
</script>

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

	//목록,업데이트,삭제 submit처리
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
											} else if (operation === 'list') {//목록페이지로 이동시 원래 페이지로 이동 파라미터 전달
												self.location = "/board/<c:out value='${detail.type}' />?"
														+ "PageNum=<c:out value="${cri.pageNum}" />&amount=<c:out value="${cri.amount}" />"
														+ "&type=<c:out value="${cri.type}" />&keyword=<c:out value="${cri.keyword}" />";
												return;
											}
											formObj.submit();
										});
					});
</script>




<%@include file="../includes/footer.jsp"%>
