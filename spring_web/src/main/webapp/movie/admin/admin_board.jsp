<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 관리</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=3">
    <link rel="stylesheet" href="/movie/admin/css/admin_board.css?v=1">
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
                <h2 class="panel-title">공지사항 관리</h2>
            </div>
            <p class="section-desc">공지사항을 작성, 수정, 삭제하고 관리할 수 있습니다.</p>

            <!-- Search Section -->
            <div class="search-section">
                <form class="search-form">
                    <div class="search-group">
                        <select class="search-select">
                            <option value="">검색 대상</option>
                            <option value="title">제목</option>
                            <option value="author">글쓴이</option>
                            <option value="all">전체</option>
                        </select>
                        <input type="text" class="search-input" placeholder="검색어를 입력하세요">
                        <button type="submit" class="btn-search">검색</button>
                    </div>
                </form>
                <button class="btn-write">글쓰기</button>
            </div>

            <!-- Board Table -->
            <table class="board-table">
                <thead>
                    <tr>
                        <th class="col-no">번호</th>
                        <th class="col-title">제목</th>
                        <th class="col-author">글쓴이</th>
                        <th class="col-phone">연락처</th>
                        <th class="col-date">등록일</th>
                        <th class="col-views">조회</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="col-no">50</td>
                        <td class="col-title"><a href="#">서버 점검 예정 안내</a></td>
                        <td class="col-author">관리자</td>
                        <td class="col-phone">02-1234-5678</td>
                        <td class="col-date">2026-02-03</td>
                        <td class="col-views">145</td>
                    </tr>
                    <tr>
                        <td class="col-no">49</td>
                        <td class="col-title"><a href="#">신규 기능 업데이트 안내</a></td>
                        <td class="col-author">개발팀</td>
                        <td class="col-phone">02-2345-6789</td>
                        <td class="col-date">2026-02-02</td>
                        <td class="col-views">267</td>
                    </tr>
                    <tr>
                        <td class="col-no">48</td>
                        <td class="col-title"><a href="#">보안 업데이트 완료</a></td>
                        <td class="col-author">보안팀</td>
                        <td class="col-phone">02-3456-7890</td>
                        <td class="col-date">2026-02-01</td>
                        <td class="col-views">312</td>
                    </tr>
                    <tr>
                        <td class="col-no">47</td>
                        <td class="col-title"><a href="#">1월 이용통계 및 피드백</a></td>
                        <td class="col-author">데이터팀</td>
                        <td class="col-phone">02-4567-8901</td>
                        <td class="col-date">2026-01-31</td>
                        <td class="col-views">198</td>
                    </tr>
                    <tr>
                        <td class="col-no">46</td>
                        <td class="col-title"><a href="#">모바일 앱 업데이트 공지</a></td>
                        <td class="col-author">관리자</td>
                        <td class="col-phone">02-5678-9012</td>
                        <td class="col-date">2026-01-30</td>
                        <td class="col-views">423</td>
                    </tr>
                    <tr>
                        <td class="col-no">45</td>
                        <td class="col-title"><a href="#">고객 피드백 반영 완료</a></td>
                        <td class="col-author">제품팀</td>
                        <td class="col-phone">02-6789-0123</td>
                        <td class="col-date">2026-01-29</td>
                        <td class="col-views">156</td>
                    </tr>
                    <tr>
                        <td class="col-no">44</td>
                        <td class="col-title"><a href="#">시스템 점검 완료 안내</a></td>
                        <td class="col-author">운영팀</td>
                        <td class="col-phone">02-7890-1234</td>
                        <td class="col-date">2026-01-28</td>
                        <td class="col-views">289</td>
                    </tr>
                    <tr>
                        <td class="col-no">43</td>
                        <td class="col-title"><a href="#">결제 시스템 개선</a></td>
                        <td class="col-author">결제팀</td>
                        <td class="col-phone">02-8901-2345</td>
                        <td class="col-date">2026-01-27</td>
                        <td class="col-views">234</td>
                    </tr>
                    <tr>
                        <td class="col-no">42</td>
                        <td class="col-title"><a href="#">2026년 신년 인사</a></td>
                        <td class="col-author">대표이사</td>
                        <td class="col-phone">02-9012-3456</td>
                        <td class="col-date">2026-01-01</td>
                        <td class="col-views">567</td>
                    </tr>
                    <tr>
                        <td class="col-no">41</td>
                        <td class="col-title"><a href="#">연말 서비스 점검 안내</a></td>
                        <td class="col-author">관리자</td>
                        <td class="col-phone">02-0123-4567</td>
                        <td class="col-date">2025-12-25</td>
                        <td class="col-views">445</td>
                    </tr>
                </tbody>
            </table>

            <!-- Pagination -->
            <div class="pagination">
                <a href="#" class="page-btn prev">이전</a>
                <a href="#" class="page-btn active">1</a>
                <a href="#" class="page-btn">2</a>
                <a href="#" class="page-btn">3</a>
                <a href="#" class="page-btn">4</a>
                <a href="#" class="page-btn">5</a>
                <span class="page-ellipsis">...</span>
                <a href="#" class="page-btn">10</a>
                <a href="#" class="page-btn next">다음</a>
            </div>
        </section>
    </main>

    <footer class="site-footer">
        <div class="container">© 2026 MySite 관리자</div>
    </footer>

</body>
</html>
