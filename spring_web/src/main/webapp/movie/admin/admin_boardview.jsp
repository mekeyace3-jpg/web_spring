<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<cr:if test="${empty ndto}">
<script>
	alert('올바른 접근이 아닙니다.');
	history.go(-1);
</script>
</cr:if>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 확인</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
    <link rel="stylesheet" href="/movie/admin/css/admin_boardwrite.css?v=1">
    <link rel="stylesheet" href="/movie/admin/css/newadmin.css?v=3">
</head>
<body>
    <header class="site-header">
        <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="boardwrite-form">
            
                <div class="form-section">
                    <h3 class="section-subtitle">공지사항 정보</h3>
                    
                    <div class="form-group">
                        <label class="form-label">제목</label>
                        ${ndto.getNsubject()}
                    </div>

                    <div class="form-row">
                        <div class="form-group form-group-half">
                            <label class="form-label">글쓴이</label>
                            ${ndto.getNwriter()}
                        </div>
                        <div class="form-group form-group-half">
                            <label class="form-label">이메일</label>
                            ${ndto.getNemail()}
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">내용</h3>
                    
                    <div class="form-group">
                        <label class="form-label">내용</label>
                        ${ndto.getNcontent()}
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">첨부 파일</h3>
                    
                    <div class="form-group">
                        <label class="form-label">첨부 파일</label>
                        <div class="file-input-wrapper">
                        <!-- 해당 게시물에 첨부파일이 없을경우 출력하는 방식과 첨부파일이 있을 경우 출력하는 방식으로 구분 -->
                        <cr:if test="${ndto.getNfile()==null}">
                        첨부파일이 없습니다.
                        </cr:if>
                        <cr:if test="${ndto.getNfile()!=null}">
                        <a href="${ndto.getNfile()}" target="_blank">
                        <img src='./disk.svg'> [첨부파일]
                        </a>
                        </cr:if>
                        </div>
                    </div>
                </div>
	<!-- 글삭제 버튼 클릭시 해당 패스워드를 입력하는 오브젝트가 보이도록 처리함 -->
			<div class="form-section" id="pwd" style="display: none;">
                    <h3 class="section-subtitle">보안 (작성시 적용된 패스워드를 입력하세요)</h3>
                    <div class="form-group">
                        <label class="form-label">패스워드</label>
                        <input type="password" id="npass" required class="form-input" placeholder="공지사항 수정/삭제 시 필요한 패스워드를 입력하세요">
                    </div>
             </div>

                <div class="form-actions">
                    <button type="button" class="btn-modify" onclick="location.href='./admin_boardmodify.do?nidx=${ndto.getNidx()}';">글 수정</button>
                    <button type="button" class="btn-delete" id="delete_board">글 삭제</button>
                    <button type="button" class="btn-list">목록</button>
                </div>
            </div>
        </section>
    </main>
    <!-- 삭제시 해당 정보를 admin_boarddel.do(post) -->
	<form id="frm" method="post">
		<input type="hidden" name="nidx" value="${ndto.getNidx()}">
		<input type="hidden" name="npass" value=""> <!-- 삭제시 입력한 패스워드를 js에서 입력시킴 -->
		<input type="hidden" name="nfile" value="${ndto.getNfile()}"> <!-- 첨부파일이 있을 경우 URL 경로가 설정됨 -->
	</form>
    <footer class="site-footer" style="background-color: black;">
       <cr:import url="./footer.jsp"/>
    </footer>
</body>
<script type="module">
import {notice} from "./js/allpage.js?v=20260205";

document.querySelector("#delete_board").addEventListener("click",function(){
		new notice().notice_delete();
});
</script>
</html>



