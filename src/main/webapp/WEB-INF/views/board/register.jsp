<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>

<div class="container">
	<!-- Login Form -->
	<div class="row">
  <!-- Blog Entries Column -->
	  <div class="col-md-12 my-order">
		<div class="content-section">
			<form name="frm" action="/board/register" method="post">
				<!-- filepath : 이미지업로드 경로 -->
				<input type="hidden" name="filepath" value="/upImages/" />
				<fieldset class="form-group">
					<legend class="border-bottom mb-4">게시글 작성</legend>
					<div class="form-group">
							<label class="form-control-label">제목</label>
							<input class="form-control form-control-lg" type="text" name="title" required maxlength="50">
					</div>
					<div class="form-group">
							<label class="form-control-label">내용</label>
							<!-- <textarea class="form-control" rows="10" cols="50" style="background-image:url('/Blog/img/background.png');"></textarea> -->
					 		<textarea style="width: 100%" rows="10" name="content" id="textAreaContent" cols="80" required"></textarea>
					</div>
					<div class="form-group">
							<button class="btn btn-outline-info" id="save" type="submit" >작성</button>
					</div>		
				</fieldset>
				<input type="hidden" name="type" value="board">
				<input type="hidden" name="writer_Id" value="sangmin">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "textAreaContent", //textarea에서 지정한 id와 일치해야 합니다. 
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "/resources/editor/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});
 
 
 
</script>

  
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="/resources/editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>







<%@include file="../includes/footer.jsp"%>