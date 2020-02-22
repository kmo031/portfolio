<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- footer 시작  -->
<footer style="background-color: #000000; color: #ffffff">
	<div class="container">
		<br>
		<div class="row">

			<div class="col-sm-4">
				<h4>대표자 소개</h4>
				<p>저는 공부를 하고있습니다.</p>
			</div>

			<div class="col-sm-12" style="text-align: center;">
				<h5>Copyright &copy; 2020 정상민(Sangmin Jung)</h5>
			</div>
		</div>
	</div>
</footer>

<!-- 부트스트랩 JS 추가  이위치에 jquery도 추가 하고싶은데 안되는 이유 찾아봐야함 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script>
	$(document).ready(
			function() {
				$('input').keyup(
						function() {
							if ($(this).val().length > $(this)
									.attr('maxlength')) {
								alert('입력 제한 길이를 초과하였습니다.');
								$(this).val(
										$(this).val().substr(0,
												$(this).attr('maxlength')));
							}
						});
			});
</script>


</body>


</html>