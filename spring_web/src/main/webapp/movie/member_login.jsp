<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./all.jspf" %>
<cr:if test="${not empty mid}">
<script>
location.href='./index.do';
</script>
</cr:if>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 - 영화예매</title>
    <link rel="stylesheet" href="/movie/css/index.css?v=1">
    <link rel="stylesheet" href="/movie/css/member_login.css?v=1">
</head>
<body>
    <!-- 헤더 -->
    <header>
         <%@ include file="./top.jsp" %> 
    </header>

    <!-- 메인 컨텐츠 -->
    <main class="login-container">
        <div class="login-form-wrapper">
            <h1>로그인</h1>
            
            <form id="frm" method="post" action="/movie/loginok.do" class="login-form">
                <!-- 아이디 -->
                <div class="form-group">
                    <label>아이디</label>
                    <input type="text" name="mid" class="form-input" placeholder="아이디를 입력하세요" required>
                </div>

                <!-- 패스워드 -->
                <div class="form-group">
                    <label>패스워드</label>
                    <input type="password" autocomplete="none" name="mpass" class="form-input" placeholder="패스워드를 입력하세요" required>
                </div>

                <!-- 로그인 버튼 -->
                <button type="submit" class="btn-login">로그인</button>

                <!-- 아이디찾기, 패스워드찾기 -->
                <div class="link-group">
                    <a href="/movie/findid.do" class="login-link">아이디 찾기</a>
                    <span class="divider">|</span>
                    <a href="/movie/findpass.do" class="login-link">패스워드 찾기</a>
                </div>

                <!-- 카카오 로그인 -->
                <div style="cursor: pointer;" class="kakao-login-wrapper" id="kakao_login" onclick="loginWithKakao()">
                <img src="/movie/kakao_login.png">
                </div>
            </form>
        </div>
    </main>
	<form id="kakao">
	<input type="hidden" name="mid" value="">
	<input type="hidden" name="mname" value="">
	<input type="hidden" name="memail" value="">
	<input type="hidden" name="mpass" value="">
	</form>
    <!-- 푸터 -->
    <footer>
        <cr:import url="./footer.jsp"/>
    </footer>
</body>
<!-- v1 : 팝업창, v2 : Kakao URL로 변경 후 => redirect URL -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/v1/kakao.js"></script>
<script>
  Kakao.init('c251f073789fa4d30e8260cb6f495cd9');
</script>
<script>
function loginWithKakao(){
	Kakao.Auth.login({
	    success: function(response){
			Kakao.API.request({
			    url : '/v2/user/me',
				success:function(aa){
				    kakao.mid.value = aa["id"];
				    kakao.mpass.value = aa["id"];
				    kakao.memail.value = aa["kakao_account"]["email"];
				    kakao.mname.value = aa["properties"]["nickname"];
				    kakao.method="post";
				    kakao.action="./web_loginok.do";
				    kakao.submit();
				},
				fail:function(error){
				    alert("해당 카카오 정보가 올바르지 않습니다.");
				}
			});
		},
		fail:function(error){
		    alert("현재 카카오 서비스가 제공되지 않습니다.");
		}
	});
}
</script>

<script type="module">
import {logins} from "./js/member_login.js?v=1";
</script>
</html>
