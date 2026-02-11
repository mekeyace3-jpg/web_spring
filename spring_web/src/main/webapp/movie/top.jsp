<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
		<div class="header-top">
            <div class="header-content">
                <h1 class="logo"><a href="/movie/index.do">영화예매</a></h1>
            </div>
        </div>
        <!-- 네비게이션 메뉴 -->
        <nav class="navigation">
            <ul class="menu">
                <li><a href="#">예매</a></li>
                <li><a href="#">영화</a></li>
                <li><a href="#">고객지원</a></li>
                <li><a href="#">마이페이지</a></li>
                <cr:if test="${not empty mid}">
                <li><a href="/movie/logout.do">${mname}(${mid}) [로그아웃]</a></li>
                </cr:if>
                <cr:if test="${empty mid}">
                <li><a href="/movie/member_login.jsp">로그인</a></li>
                <li><a href="/movie/member.jsp">회원가입</a></li>
                </cr:if>
            </ul>
        </nav>