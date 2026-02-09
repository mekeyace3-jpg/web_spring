<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배너 등록</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
    <link rel="stylesheet" href="/movie/admin/css/admin_bannerwrite.css?v=1">
</head>
<body>
    <header class="site-header">
        <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="section-header">
                <span class="section-badge">4</span>
                <h2 class="panel-title">배너 등록</h2>
            </div>
            <p class="section-desc">새 배너를 등록할 수 있습니다.</p>

            <form class="bannerwrite-form">
                <div class="form-section">
                    <h3 class="section-subtitle">기본정보</h3>

                    <div class="form-group">
                        <label class="form-label">배너 제목</label>
                        <input type="text" class="form-input" placeholder="배너 제목을 입력하세요">
                    </div>

                    <div class="form-group">
                        <label class="form-label">배너 이미지</label>
                        <div class="file-upload-wrapper">
                            <input type="file" class="file-input"> <span class="file-hint">(권장 사이즈: 1200x300px, 최대 5MB)</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">링크주소</label>
                        <input type="text" class="form-input" placeholder="https:// 형식으로 입력하세요">
                    </div>

                    <div class="form-row">
                        <div class="form-group form-group-half">
                            <label class="form-label">배너 순서</label>
                            <input type="number" class="form-input" placeholder="1" min="1">
                        </div>
                        <div class="form-group form-group-half">
                            <label class="form-label">출력 여부</label>
                            <select class="form-input">
                                <option>노출</option>
                                <option>비노출</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-submit">신규배너등록</button>
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