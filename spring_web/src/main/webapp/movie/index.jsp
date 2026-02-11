<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><!-- jsp : taglib 파일단위로 인식  , .jspf : 전체인식 -->
<%@ include file="./all.jspf" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화예매 - 최고의 영화 예매 서비스</title>
    <link rel="stylesheet" href="/movie/css/index.css?v=1">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <!-- 헤더 -->
    <header>
    <%@ include file="./top.jsp" %>   
    </header>

    <!-- 메인 컨텐츠 -->
    <main class="container">
        <!-- 배너 -->
        <cr:import url="./banner.jsp"/>

        <!-- 신작영화 TOP10 -->
		<cr:import url="./toplist.jsp"/>        
        <!-- 공지사항 및 광고배너 영역 -->
        <div class="notice-ad-wrapper">
            <!-- 공지사항 -->
            <cr:import url="./main_notice.jsp"/>

            <!-- 광고배너 -->
            <cr:import url="./ad.jsp"/>
        </div>
    </main>

    <!-- 푸터 -->
    <footer>
        <cr:import url="./footer.jsp"/>
    </footer>

    <script src="/movie/js/main.js?v=1"></script>
</body>
</html>
