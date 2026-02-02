<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>  
  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 회원가입 - 영화예매</title>
    <link rel="stylesheet" href="./css/newadmin.css">
</head>
<body>
    <!-- 헤더 -->
    <header class="signup-header">
        <div class="signup-header-content">
            <div class="signup-logo">영화예매</div>
            <div class="signup-subtitle">관리자 회원가입</div>
        </div>
    </header>

    <!-- 메인 콘텐츠 -->
    <main class="signup-main">
        <div class="signup-container">
            <h1 class="signup-title">관리자 회원가입</h1>
            <p class="signup-desc">아래 정보를 입력하여 관리자 계정을 등록해주세요</p>

            <form class="signup-form" id="frm">
            <!-- 아이디 중복확인이 되었을 경우 0에서 1로 변경됨 -->
            <input type="hidden" id="idck" value="0">
                <!-- 사원명 -->
                <div class="form-group">
                    <label class="form-label">사원명</label>
                    <input type="text" name="mname" class="form-input" placeholder="사원명을 입력하세요" required>
                </div>

                <!-- 사원아이디 -->
                <div class="form-group">
                    <label class="form-label">사원아이디</label>
                    <div class="input-with-button">
                        <input type="text" name="mid" id="mid" class="form-input" placeholder="사원아이디를 입력하세요" required>
                        <button type="button" class="check-button" id="idcheck">중복확인</button>
                    </div>
                </div>

                <!-- 사원패스워드 -->
                <div class="form-group">
                    <label class="form-label">사원패스워드</label>
                    <input type="password" name="mpw" class="form-input" placeholder="비밀번호를 입력하세요" required>
                    <p class="form-hint">영문, 숫자, 특수문자를 포함하여 8자 이상 입력해주세요</p>
                </div>

                <!-- 비밀번호 확인 -->
                <div class="form-group">
                    <label class="form-label">비밀번호 확인</label>
                    <input type="password" id="mpw2" class="form-input" placeholder="비밀번호를 다시 입력하세요" required>
                </div>

                <!-- 사원이메일주소 -->
                <div class="form-group">
                    <label class="form-label">사원이메일주소</label>
                    <input type="email" name="memail" class="form-input" placeholder="이메일 주소를 입력하세요" required>
                </div>

                <!-- 휴대폰번호 -->
                <div class="form-group">
                    <label class="form-label">휴대폰번호</label>
                    <input type="tel" name="mtel" class="form-input" placeholder="휴대폰번호를 입력하세요 (예: 010-1234-5678)" required>
                </div>

                <!-- 사번 -->
                <div class="form-group">
                    <label class="form-label">사번</label>
                    <input type="text" name="mno" class="form-input" placeholder="사번을 입력하세요" required>
                </div>

                <!-- 가입 버튼 -->
                <button type="submit" class="submit-button">회원가입</button>
                <button type="reset" class="reset-button">초기화</button>
            </form>

            <div class="signup-footer-links">
                <a href="login.do">로그인으로 돌아가기</a>
            </div>
        </div>
    </main>
    <!-- 푸터 -->
    <footer class="signup-footer">
        <cr:import url="./footer.jsp"/>
    </footer>
</body>
<!--  
type="module" : ES7 이상의 version을 사용할 경우 적용하는 type 방식  
import 를 이용하여 export 파일 로드하는 방식 {클래스명을 입력}
--> 
<script type="module">
import {admin_new} from "./js/index.js?v=4";
</script>
</html>
