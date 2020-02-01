<%@ page contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>

<head>
    <title>포트폴리오 만들기</title>
    <meta charset="utf-8">
    <title>공지사항목록</title>

    <link href="/resources/css/layout.css" type="text/css" rel="stylesheet" />
    <link href="/resources/css/index.css" type="text/css" rel="stylesheet" />
</head>

<body>
    <!-- header 부분 -->

    <header id="header">
        
        <div class="content-container">
            <!-- ---------------------------<header>--------------------------------------- -->

            <h1 id="logo">
                <a href="/"> 
                    <img src="/resources/images/logo.png" alt="스프링 포트폴리오 로고" />

                </a>
            </h1>

            <section>
                <h1 class="hidden">헤더</h1>

                <nav id="main-menu">
                    <h1>메인메뉴</h1>
                    <ul>
                        <li><a href="/board">게시판</a></li>

                        <li><a href="/course">메뉴2</a></li> 
                        <li><a href="/answeris/index">메뉴3</a></li>
                    </ul>
                </nav>

                <div class="sub-menu">

				<!-- 검색 추가 예정 -->
                  <!--   <section id="search-form">
                        <h1>강좌검색 폼</h1>
                        <form action="/course">
                            <fieldset>
                                <legend>과정검색필드</legend>
                                <label>과정검색</label>
                                <input type="text" name="q" value="" />
                                <input type="submit" value="검색" />
                            </fieldset>
                        </form>
                    </section> -->

                    <nav id="acount-menu">
                        <h1 class="hidden">회원메뉴</h1>
                        <ul>
                            <li><a href="/">HOME</a></li>
                            <li><a href="/member/login">로그인</a></li>
                            <li><a href="/member/agree">회원가입</a></li>
                        </ul>
                    </nav>

                    <nav id="member-menu" class="linear-layout">
                        <h1 class="hidden">고객메뉴</h1>
                        <ul class="linear-layout">
                            <li><a href="/member/home"><img src="/resources/images/txt-mypage.png" alt="마이페이지" /></a></li>
                            <li><a href="/notice/list"><img src="/resources/images/txt-customer.png" alt="고객센터" /></a></li>
                        </ul>
                    </nav>

                </div>
            </section>

        </div>
        
    </header>