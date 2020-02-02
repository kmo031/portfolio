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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript">
	$(function() {
		stickyFooter();

		$(window).scroll(stickyFooter).resize(stickyFooter);
	});

	function stickyFooter() {
		document_height = $(document).height(); // 문서 전체 높이
		document_scrollTop = $(document).scrollTop(); // 문서 전체 높이 중 스크롤 위치
		window_height = $(window).height(); // 창 높이
		footer_height = $("footer").height();

		gap = document_height - footer_height - window_height;
		bottom = document_scrollTop - gap;

		if (document_scrollTop > gap) {
			$("footer").css("bottom", bottom + "px");
		} else {
			$("footer").css("bottom", "0");
		}
	}
</script> -->
</body>


</html>