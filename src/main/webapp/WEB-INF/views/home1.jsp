<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@include file="./includes/header.jsp" %>


    <!-- --------------------------- <body> --------------------------------------- -->

    <!-- content 부분 -->



    <div id="visual">
        <div class="content-container">
            <h2 class="hidden">신규 강좌목록</h2>
            <!-- <ul class="mov-button">
			<li class="prev-button">이전</li>
			<li class="next-button">다음</li>
		</ul> -->
            <ul class="banner">

				<!-- 배너 이미지  -->
                <li class="banner1">
                        <img src="/resources/images/banner-java.png" style="cursor: pointer;" />
                </li>

            </ul>



            <ul class="banner-button-list" style="color:#ffff00; font-size:20px;position:absolute; left:10px; bottom:5px; z-index: 100px; display: flex; flex-direction: row;">
                <li></li>
            </ul>

        </div>

    </div>
    	<!-- 메인 공지사항 추가 예정  -->
   <!--  <div id="notice">
        <div class="content-container">
            <span class="title">제대로된 전문가들이 만들어가는 <span style="color:yellow;font-size:15px;">IT PROFESSIONAL <span style="color:#00ffff;">NEW</span>
                    ONLINE <span style="color:#00ffff;">LECTURE</span> MARKET</span></span>
            <a class="detail-button">자세히</a>
        </div>
    </div> -->
    <!-- ----- 공지사항 줄 ------------------------------------------------------------------------------ -->
    <div id="information"> 
        <div class="content-container">
            <section class="guide">
                <h1 class="title">GitHub Repository</h1>
                <div class="margin-top">
                    <a target="_blank" href="https://github.com/kmo031/kmo031"><img src="/resources/images/customer/installInfo.png" /></a>
                </div>
            
            </section>
            <section class="course-info">
                <h1 class="title text-center">뉴렉처 하이브리드 과정 모집</h1>
                <ul class="list">
                    <li>현재 모집 과정이 없습니다.</li>
                </ul>
            </section>
            <section class="notice">
                <h1 class="title">공지사항</h1>
                <ul class="list margin-top">
				
				 <c:forEach items="${List}" var="board"> 
					<li>
                        <span class="notice-title">
                            <a href="notice/detail?id=<c:out value="${board.id }" />">
                            <c:out value="${board.title}" /></a> 
                        </span>
                        <span><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></span>
                    </li>
				
				 </c:forEach> 

                </ul>
            </section>
        </div>
    </div>
    

    <!-- ----- 커뮤니티 시작 줄 -------------------------------------------------------------------------------------------- -->



    <!-- ----- 커뮤니티 시작 줄 -------------------------------------------------------------------------------------------- -->
    <!-- <div class="margin-top">
	<div style="height: 170px; margin-top:10px;" class="content-container border">
	</div>
</div> -->

    <!-- ----- 강좌 목록 시작 줄 --------------------------------------------------------------------------------------------------------- -->
    <main id="course">
        <section class="content-container list list-horizontal list-course list-course-index">
            <h1>온라인 <span class="color-orange">단과 과정</span></h1>
            <div>
               
            </div>

            <ul>
                <li class="item-course normal event">
                    <div>
                        <a href="course/2"><img src="/resources/images/course/java.png" /></a>                         
                    </div>
                    <div>
                        <div>
                            <a href="course/2"><span class="text-strong text-ellipsis">자바 프로그래밍</span></a>
                        </div>
                        <div class="price">
                            <span class="normal deprecated">
                                <span class="text-gray">
                                    22,000
                                </span> 원
                            </span> <span class="event">


                                <span class="color-red text-strong">
                                    0
                                </span>원


                            </span>
                        </div>
                        <div class="footer text-strong">
                            <span class="writer">선생님 : newlec </span>
                            <span class="update">개설일 : 2019-09-07
                            </span>
                        </div>
                    </div>
                </li>

				
            </ul>

            <div class="more">
                <!-- <span class="border padding">단과 과정 목록 더보기</span> -->
            </div>
        </section>

        <!-- ------- 온라인 패키지 과정 ------------------------------------------------------------------------------------------------- -->

        <div class="content-container">
            <h3 class="-text- center green bold -margin- top">협력업체</h3>
            <ul class="-list- horizontal center -margin- bottom top b20">
                <li><a target="_blank" href="http://www.notepubs.com"><img src="/resources/images/notepubs.png" alt="노트펍스" /></a></li>
                <li><a target="_blank" href="http://www.namoolab.com"><img src="/resources/images/namoolab.png" alt="나무랩연구소" /></a></li>                
               
            </ul>
        </div>
    </main>
    <script>

    </script>




    <!-- ------------------- <footer> --------------------------------------- -->



    <%@ include file="./includes/footer.jsp"%>