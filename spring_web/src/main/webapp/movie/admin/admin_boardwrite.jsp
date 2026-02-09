<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 작성</title>
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
            <div class="section-header">
                <h2 class="panel-title">공지사항 작성</h2>
            </div>
            <p class="section-desc">새로운 공지사항을 작성하거나 기존 공지사항을 수정할 수 있습니다.</p>

            <form id="frm" class="boardwrite-form" method="post" enctype="multipart/form-data" action="./admin_boardwriteok.do">
                <div class="form-section">
                    <h3 class="section-subtitle">공지사항 정보</h3>
                    
                    <div class="form-group">
                        <label class="form-label">제목</label>
                        <input type="text" name="nsubject" class="form-input" placeholder="공지사항 제목을 입력하세요" required>
                    </div>

                    <div class="form-row">
                        <div class="form-group form-group-half">
                            <label class="form-label">글쓴이</label>
                            <input type="text" name="nwriter" value="${admin_name}" class="form-input" placeholder="글쓴이 이름을 입력하세요" readonly>
                        </div>
                        <div class="form-group form-group-half">
                            <label class="form-label">이메일</label>
                            <input type="email" name="nemail" value="${admin_email}" class="form-input" placeholder="이메일 주소를 입력하세요" readonly>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">내용</h3>
                    
                    <div class="form-group">
                        <label class="form-label">내용</label>
                        <textarea class="form-textarea" name="ncontent" placeholder="공지사항 내용을 입력하세요" rows="12" required></textarea>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">첨부 파일</h3>
                    
                    <div class="form-group">
                        <label class="form-label">첨부 파일</label>
                        <div class="file-input-wrapper">
                        <!-- 파일 전송에 따른 사항은 DTO와 별개의 name을 사용하여 Back-end 전달해야함 -->
                            <input type="file" name="afile" class="form-input" accept="image/*"> 
                            <span class="file-help">* 최대 1개 및 5MB 이하의 이미지만 전송가능</span>
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">보안</h3>
                    
                    <div class="form-group">
                        <label class="form-label">패스워드</label>
                        <input type="password" name="npass" required class="form-input" placeholder="공지사항 수정/삭제 시 필요한 패스워드를 입력하세요">
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-submit">글 등록</button>
                    <button type="button" class="btn-list">목록</button>
                </div>
            </form>
        </section>
    </main>

    <footer class="site-footer">
        <div class="container">© 2026 MySite 관리자</div>
    </footer>

</body>
</html>
