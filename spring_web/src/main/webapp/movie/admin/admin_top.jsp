<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//HttpSession hs = request.getSession();
	//String admin_id = (String)hs.getAttribute("admin_id");
%>
<!-- jstl에서 출력값이 아무것도 나오지 않는다면, null로 처리하여 조정 하셔야 합니다. -->
<cr:if test="${admin_id == null || admin_id == ''}">
	<script>
		alert('올바른 접근 방식이 아닙니다.');
		location.href='./login.do';
	</script>
</cr:if>
<div class="container">
            <h1 class="brand">사이트 관리자</h1>
            <nav class="main-nav">
                <ul>
                    <li><a href="#">사이트 정보</a></li>
                    <li><a href="#">관리자 리스트</a></li>
                    <li><a href="./admin_board.do">공지사항</a></li>
                    <li><a href="#">영화 API</a></li>
                    <li><a href="#">고객리스트</a></li>
                    <li><a href="#">팝업창관리</a></li>
                    <li><a href="#">배너관리</a></li>
                    <li>
                    <a href="#">${admin_id} 님 환영합니다.</a>
                    <a href="./logout.do">[로그아웃]</a>
                    </li>
                </ul>
            </nav>
        </div>