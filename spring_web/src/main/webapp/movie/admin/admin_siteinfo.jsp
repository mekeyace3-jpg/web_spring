<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이트 정보 관리</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=3">
    <link rel="stylesheet" href="/movie/admin/css/admin_siteinfo.css?v=1">
</head>
<body>
    <header class="site-header">
        <div class="container">
            <h1 class="brand">사이트 관리자</h1>
            <nav class="main-nav">
                <ul>
                    <li><a href="#">사이트 정보</a></li>
                    <li><a href="#">관리자 리스트</a></li>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">영화 API</a></li>
                    <li><a href="#">고객리스트</a></li>
                    <li><a href="#">팝업창관리</a></li>
                    <li><a href="#">배너관리</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="section-header">
                <h2 class="panel-title">사이트 정보 관리</h2>
            </div>
            <p class="section-desc">웹사이트 기본 정보를 입력하고 관리할 수 있습니다.</p>
            
            <form class="siteinfo-form">
                <div class="form-section">
                    <h3 class="section-subtitle">기본 정보</h3>
                    <div class="form-group">
                        <label class="form-label">홈페이지 제목</label>
                        <input type="text" class="form-input" placeholder="홈페이지의 제목을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label class="form-label">관리자 메일주소</label>
                        <input type="email" class="form-input" placeholder="관리자 메일주소를 입력하세요">
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">회사 정보</h3>
                    <div class="form-group">
                        <label class="form-label">회사명</label>
                        <input type="text" class="form-input" placeholder="회사명을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label class="form-label">대표자명</label>
                        <input type="text" class="form-input" placeholder="대표자명을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label class="form-label">사업자등록번호</label>
                        <input type="text" class="form-input" placeholder="사업자등록번호를 입력하세요 (예: 123-45-67890)">
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">연락처 정보</h3>
                    <div class="form-group">
                        <label class="form-label">대표전화번호</label>
                        <input type="tel" class="form-input" placeholder="대표전화번호를 입력하세요 (예: 02-1234-5678)">
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">법적 정보</h3>
                    <div class="form-group">
                        <label class="form-label">통신판매업 신고번호</label>
                        <input type="text" class="form-input" placeholder="통신판매업 신고번호를 입력하세요">
                    </div>
                    <div class="form-group">
                        <label class="form-label">부가통신 사업자번호</label>
                        <input type="text" class="form-input" placeholder="부가통신 사업자번호를 입력하세요">
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">주소 정보</h3>
                    <div class="form-group">
                        <label class="form-label">사업장 주소</label>
                        <textarea class="form-textarea" placeholder="사업장 주소를 입력하세요" rows="3"></textarea>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">정보 보호 담당자</h3>
                    <div class="form-group">
                        <label class="form-label">정보관리책임자명</label>
                        <input type="text" class="form-input" placeholder="정보관리책임자명을 입력하세요">
                    </div>
                    <div class="form-group">
                        <label class="form-label">정보책임자 E-mail</label>
                        <input type="email" class="form-input" placeholder="정보책임자 이메일을 입력하세요">
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-submit">저장</button>
                    <button type="reset" class="btn-reset">초기화</button>
                    <button type="button" class="btn-cancel">취소</button>
                </div>
            </form>
        </section>
    </main>

    <footer class="site-footer">
        <div class="container">© 2026 MySite 관리자</div>
    </footer>

</body>
</html>
