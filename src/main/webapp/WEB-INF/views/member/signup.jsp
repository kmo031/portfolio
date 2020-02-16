<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../includes/header.jsp"%>


<div class="container">
	<div class="row">
		<div class="card col-md-12" style="padding: 0px;">
			<div class="card-header">
				<h5 class="card-title">회원가입</h5>
			</div>
			<div class="card-body">
				<form action="/member/register" class="was-validated" method="post">

					<div class="form-group">
						<label for="uname">이름:</label> <input type="text"
							class="form-control" id="uname" placeholder="이름" name="userName"
							required maxlength="25">
						<div class="valid-feedback">유효</div>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>

					<div class="form-group">
						<label for="uname">아이디:</label> <input type="text"
							class="form-control" id="userId" placeholder="Id" name="userId"
							required maxlength="25">
						<div class="valid-feedback">유효</div>
						<div class="invalid-feedback">아이디를 입력해주세요.</div>
					</div>
					<div class="form-group">
						<label for="pwd">패스워드:</label> <input type="password"
							class="form-control" id="pwd" placeholder="password" name="userPw"
							required maxlength="25">
						<div class="valid-feedback">유효</div>
						<div class="invalid-feedback">비밀번호를 입력하여주세요.</div>
					</div>
					<div class="form-group">
						<label for="pwd-re">패스워드:</label> <input type="password"
							class="form-control" id="pwd-re" placeholder="password"
							name="pswd-re" required maxlength="25">
						<div class="valid-feedback">유효</div>
						<div class="invalid-feedback">비밀번호를 재입력하여주세요.</div>
					</div>
					<div class="form-group">
						<label for="pwd">연락처:</label> <input type="text"
							class="form-control" id="pwd" placeholder="연락처" name="phone"
							required maxlength="11">
						<div class="valid-feedback">유효</div>
						<div class="invalid-feedback">연락처를 입력하여주세요.</div>
					</div>
					<div class="form-group form-check">
						<label class="form-check-label"> <input
							class="form-check-input" type="checkbox" required>
							가입에 동의 하십니까?.
							<div class="valid-feedback">동의</div>
							<div class="invalid-feedback">계속하시려면 체크하여주세요</div>
						</label>
					</div>
					<button type="submit" class="btn btn-primary">가입</button>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}">
				</form>
			</div>
		</div>
	</div>
</div>

<script>

	//csrf토큰 
	$(document).ready(function() {
	
		$(document).ajaxSend(function(e, xhr, option) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
	
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
	
	});

	//id 중복체크
	$("#userId").blur(function(){
		var userId = $("#userId").val();
		if(userId != ""){
		 	$.ajax({
				url : '/member/idcheck?userId='+userId,
				type : 'get',
				dataType : "json",
				
				success : function(data) {
					if(data == 1){
						 $("#userId").attr('style', 'background-color : #f90707e3 !important');
						 $("#userId").val("");
						 alert("이미 존재하는 아이디 입니다.");
					}else{
						 $("#userId").attr('style', 'background-color :#82ae46 !important');
					}
				}
			}); //ajax end */
		}
	});
	//password 확인
	$("#pwd-re").blur(function(){
		var user_pw = $("#pwd").val();
		var user_pwre = $("#pwd-re").val();
		if(user_pwre != ""){
			if(user_pw == user_pwre){
				$("#pwd").attr('style', 'background-color :#82ae46 !important');
				$("#pwd-re").attr('style', 'background-color :#82ae46 !important');
			}else{
				$("#pwd").attr('style', 'background-color :#f90707e3 !important');
				$("#pwd-re").attr('style', 'background-color :#f90707e3 !important');
				$("#pwd").val("");
				$("#pwd-re").val("");
				alert("비밀번호가 일치하지 않습니다.")
			}
		}
	});

</script>






<%@include file="../includes/footer.jsp"%>