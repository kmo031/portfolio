<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<div class="container">
	<!-- Login Form -->
	<div class="row">
		<!-- Blog Entries Column -->
		<div class="col-md-12 my-order">
			<div class="content-section">
				<form name="frm" action="/board/modify" method="post">
					<!-- filepath : 이미지업로드 경로 -->
					<input type="hidden" name="filepath" value="/upImages/" />
					<fieldset class="form-group">
						<legend class="border-bottom mb-4">게시글 수정</legend>
						<div class="form-group">
							<label class="form-control-label">제목</label> <input
								class="form-control form-control-lg" type="text" name="title"
								value="<c:out value='${board.title }' />">
						</div>
						<div class="form-group">
							<label class="form-control-label">내용</label>
							<!-- <textarea class="form-control" rows="10" cols="50" style="background-image:url('/Blog/img/background.png');"></textarea> -->
							<textarea style="width: 100%" rows="10" name="content"
								id="textAreaContent" cols="80"></textarea>
						</div>
						<input type="hidden" name="id" value="<c:out value='${board.id}' />">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="form-group">
							<button class="btn btn-outline-info" type="submit">수정</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<!-- ./row -->
</div>
<!-- ./container -->

<!-- Naver Smart Editor 2 -->
<script type="text/javascript">
	var oEditors = [];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "textAreaContent", //textarea에서 지정한 id와 일치해야 합니다. 
			//SmartEditor2Skin.html 파일이 존재하는 경로
			sSkinURI : "/resources/editor/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,
				fOnBeforeUnload : function() {

				}
			},
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				oEditors.getById["textAreaContent"].exec("PASTE_HTML",
						[ "${board.content}" ]);
			},
			fCreator : "createSEditor2"
		});

		//저장버튼 클릭시 form 전송
		$("#save").click(
				function() {
					oEditors.getById["textAreaContent"].exec(
							"UPDATE_CONTENTS_FIELD", []);
					$("#frm").submit();
				});
	});
</script>


<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="/resources/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>







<%@include file="../includes/footer.jsp"%>