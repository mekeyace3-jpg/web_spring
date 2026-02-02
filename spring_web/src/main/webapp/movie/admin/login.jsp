<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인 - 영화예매</title>
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="./css/login.css">
</head>
<body>
    <!-- 헤더 -->
    <header class="login-header">
        <div class="login-header-content">
            <div class="login-logo">영화예매</div>
            <div class="login-subtitle">관리자 로그인</div>
        </div>
    </header>

    <!-- 메인 콘텐츠 -->
    <main>
        <div class="login-container">
            <h1 class="login-title">관리자 로그인</h1>
            <p class="login-desc">관리자 계정으로 로그인 해주세요</p>

            <form id="frm">
                <div class="form-group">
                    <label for="admin-id">관리자 아이디</label>
                    <input type="text" name="mid" placeholder="아이디를 입력하세요">
                </div>

                <div class="form-group">
                    <label for="admin-password">비밀번호</label>
                    <input type="password" name="mpw" placeholder="비밀번호를 입력하세요">
                </div>

                <button type="submit" class="login-button">로그인</button>
                <button type="button" class="signup-button" onclick="location.href='./newadmin.do';">신규관리자 등록</button>
            </form>

            <div class="divider">
                <span class="divider-text">또는</span>
            </div>

            <div class="login-links">
                <a href="#">관리자 가이드</a> | 
                <a href="#">기술 지원</a>
            </div>
        </div>
    </main>
    <!-- 푸터 -->
    <footer>
       <cr:import url="./footer.jsp"/>
    </footer>
</body>
<script type="module">
import {admin_login} from "./js/allpage.js?v=6";

//이벤트 핸들링 함수는 js 파일 안에 적용시 오류가 발생할 수 있음 오류발생 원인(addEventListener)
document.querySelector("#frm").addEventListener("submit",function(z){
	z.preventDefault();
	
});

</script>


</html>
