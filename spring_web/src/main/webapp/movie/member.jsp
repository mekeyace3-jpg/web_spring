<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 - 영화예매</title>
    <link rel="stylesheet" href="/movie/css/index.css">
    <link rel="stylesheet" href="/movie/css/member.css">
</head>
<body>
    <!-- 헤더 -->
    <header>
        <cr:import url="./top.jsp"/>
    </header>

    <!-- 메인 컨텐츠 -->
    <main class="member-container">
        <div class="member-form-wrapper">
            <h1>회원가입</h1>
            
            <form method="post" action="/movie/memberJoin.do" class="member-form">
                <!-- 아이디 -->
                <div class="form-group">
                    <label for="memberid">아이디</label>
                    <div class="input-with-btn">
                        <input type="text" class="form-input" placeholder="아이디를 입력하세요" required>
                        <button type="button" class="btn-check">중복조회</button>
                    </div>
                </div>

                <!-- 비밀번호 -->
                <div class="form-group">
                    <label for="memberpass">비밀번호</label>
                    <input type="password" class="form-input" placeholder="비밀번호를 입력하세요" required>
                </div>

                <!-- 비밀번호 확인 -->
                <div class="form-group">
                    <label for="memberpass2">비밀번호 확인</label>
                    <input type="password" class="form-input" placeholder="비밀번호를 다시 입력하세요" required>
                </div>

                <!-- 이름 -->
                <div class="form-group">
                    <label for="membername">이름</label>
                    <input type="text" class="form-input" placeholder="이름을 입력하세요" required>
                </div>

                <!-- 연락처 -->
                <div class="form-group">
                    <label for="memberphone">연락처</label>
                    <input type="tel" class="form-input" placeholder="010-0000-0000" required>
                </div>

                <!-- 생년월일 -->
                <div class="form-group">
                    <label for="memberbirthday">생년월일</label>
                    <input type="date" class="form-input" required>
                </div>

                <!-- 이메일 -->
                <div class="form-group">
                    <label for="memberemail">이메일</label>
                    <div class="input-with-btn">
                        <input type="email" id="usermail" class="form-input" placeholder="이메일을 입력하세요" required>
                        <button type="button" class="btn-auth" id="mail_security">본인인증</button>
                        <input type="text" id="usercode" class="form-input" placeholder="인증코드 6자리" maxlength="6" required>
                        <button type="button" class="btn-auth" id="seno_check">인증번호 확인</button>
                    </div>
                </div>

                <!-- 우편번호 -->
                <div class="form-group">
                    <label for="zipcode">우편번호</label>
                    <div class="input-with-btn">
                        <input type="text" id="sample2_postcode" class="form-input" placeholder="우편번호를 입력하세요" readonly required>
                        <button type="button" class="btn-auth" id="post_search">우편번호 검색</button>
                    </div>
                </div>

				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
					<img src="//t1.kakaocdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" alt="닫기 버튼">
				</div>

                <!-- 도로명 주소 -->
                <div class="form-group">
                    <label for="roadaddress">도로명 주소</label>
                    <input type="text" id="sample2_address" class="form-input" placeholder="도로명 주소를 입력하세요" readonly required>
                </div>

                <!-- 상세주소 -->
                <div class="form-group">
                    <label for="memberaddress2">상세주소</label>
                    <input type="text" id="dtc_address" class="form-input" placeholder="상세주소를 입력하세요">
                </div>

                <!-- 약관동의 -->
                <div class="terms-group">
                    <div class="terms-item">
                        <input type="checkbox" class="checkbox-input">
                        <label class="checkbox-label">이용약관에 동의합니다</label>
                    </div>
                    <div class="terms-item">
                        <input type="checkbox" class="checkbox-input">
                        <label class="checkbox-label">개인정보 수집 및 이용 동의</label>
                    </div>
                </div>

                <!-- 버튼 -->
                <div class="button-group">
                    <button type="submit" class="btn-submit">가입하기</button>
                    <button type="reset" class="btn-reset">초기화</button>
                </div>
            </form>
        </div>
    </main>
    <!-- 푸터 -->
    <footer>
        <cr:import url="./footer.jsp"/>
    </footer>
</body>
<script src="//t1.kakaocdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="module">
import {memberck} from "./js/member.js?v=1";
document.querySelector("#post_search").addEventListener("click",function(){
	new memberck().address();
});

//주소 닫기 버튼 활성화
document.querySelector("#btnCloseLayer").addEventListener("click",function(){
	new memberck().closeDaumPostcode();
});

//메일인증 발송 활성화
document.querySelector("#mail_security").addEventListener("click",function(){
	new memberck().postmail_api();
});

//인증번호 일치여부 체크
document.querySelector("#seno_check").addEventListener("click",function(){
	new memberck().usernock();
});

</script>





</html>
