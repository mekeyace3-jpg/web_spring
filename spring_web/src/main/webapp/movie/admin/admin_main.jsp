<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 메인</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=3">
    <link rel="stylesheet" href="/movie/admin/css/newadmin.css?v=2">
</head>
<body>
    <header class="site-header">
        <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="section-header">
                <span class="section-badge">1</span>
                <h2 class="panel-title">신규 관리자 리스트</h2>
            </div>
            <p class="section-desc">신규 관리자 승인 대기 중인 항목을 확인하고 관리할 수 있습니다.</p>
            <table class="admin-table">
                <thead>
                    <tr>
                        <th class="col-name">관리자명</th>
                        <th class="col-email">이메일</th>
                        <th class="col-phone">연락처</th>
                        <th class="col-date">가입일</th>
                        <th class="col-action">조치</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="col-name">관리자 A</td>
                        <td class="col-email">admin_a@example.com</td>
                        <td class="col-phone">010-1111-1111</td>
                        <td class="col-date">2026-01-28</td>
                        <td class="col-action">
                            <button class="btn-approve">승인</button>
                            <button class="btn-delete">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-name">관리자 B</td>
                        <td class="col-email">admin_b@example.com</td>
                        <td class="col-phone">010-2222-2222</td>
                        <td class="col-date">2026-01-25</td>
                        <td class="col-action">
                            <button class="btn-approve">승인</button>
                            <button class="btn-delete">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-name">관리자 C</td>
                        <td class="col-email">admin_c@example.com</td>
                        <td class="col-phone">010-3333-3333</td>
                        <td class="col-date">2026-01-20</td>
                        <td class="col-action">
                            <button class="btn-approve">승인</button>
                            <button class="btn-delete">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-name">관리자 D</td>
                        <td class="col-email">admin_d@example.com</td>
                        <td class="col-phone">010-4444-4444</td>
                        <td class="col-date">2026-01-18</td>
                        <td class="col-action">
                            <button class="btn-approve">승인</button>
                            <button class="btn-delete">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-name">관리자 E</td>
                        <td class="col-email">admin_e@example.com</td>
                        <td class="col-phone">010-5555-5555</td>
                        <td class="col-date">2026-01-15</td>
                        <td class="col-action">
                            <button class="btn-approve">승인</button>
                            <button class="btn-delete">삭제</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section class="panel full-width">
            <div class="section-header">
                <span class="section-badge">2</span>
                <h2 class="panel-title">공지사항 리스트</h2>
            </div>
            <p class="section-desc">최근 공지사항 내용을 확인하고 관리할 수 있습니다.</p>
            <table class="notice-table">
                <thead>
                    <tr>
                        <th class="col-title">제목</th>
                        <th class="col-author">글쓴이</th>
                        <th class="col-phone">연락처</th>
                        <th class="col-date">등록일</th>
                        <th class="col-views">조회</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="col-title">서비스 점검 안내</td>
                        <td class="col-author">관리자</td>
                        <td class="col-phone">010-1234-5678</td>
                        <td class="col-date">2026-02-01</td>
                        <td class="col-views">125</td>
                    </tr>
                    <tr>
                        <td class="col-title">이용 약관 변경</td>
                        <td class="col-author">관리자</td>
                        <td class="col-phone">010-1234-5678</td>
                        <td class="col-date">2026-01-30</td>
                        <td class="col-views">98</td>
                    </tr>
                    <tr>
                        <td class="col-title">신규 기능 출시</td>
                        <td class="col-author">시스템</td>
                        <td class="col-phone">010-2345-6789</td>
                        <td class="col-date">2026-01-25</td>
                        <td class="col-views">256</td>
                    </tr>
                    <tr>
                        <td class="col-title">이벤트 안내</td>
                        <td class="col-author">마케팅팀</td>
                        <td class="col-phone">010-3456-7890</td>
                        <td class="col-date">2026-01-20</td>
                        <td class="col-views">142</td>
                    </tr>
                    <tr>
                        <td class="col-title">보안 공지</td>
                        <td class="col-author">보안팀</td>
                        <td class="col-phone">010-4567-8901</td>
                        <td class="col-date">2026-01-10</td>
                        <td class="col-views">89</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <section class="panel full-width">
            <div class="section-header">
                <span class="section-badge">3</span>
                <h2 class="panel-title">신규 고객 리스트</h2>
            </div>
            <p class="section-desc">신규 가입 고객 정보를 확인하고 관리할 수 있습니다.</p>
            <table class="customer-table">
                <thead>
                    <tr>
                        <th class="col-id">고객아이디</th>
                        <th class="col-name">고객명</th>
                        <th class="col-phone">연락처</th>
                        <th class="col-email">이메일</th>
                        <th class="col-date">가입일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="col-id">user_001</td>
                        <td class="col-name">김철수</td>
                        <td class="col-phone">010-1234-5678</td>
                        <td class="col-email">kim@example.com</td>
                        <td class="col-date">2026-01-30</td>
                    </tr>
                    <tr>
                        <td class="col-id">user_002</td>
                        <td class="col-name">이영희</td>
                        <td class="col-phone">010-2345-6789</td>
                        <td class="col-email">lee@example.com</td>
                        <td class="col-date">2026-01-29</td>
                    </tr>
                    <tr>
                        <td class="col-id">user_003</td>
                        <td class="col-name">박민준</td>
                        <td class="col-phone">010-3456-7890</td>
                        <td class="col-email">park@example.com</td>
                        <td class="col-date">2026-01-27</td>
                    </tr>
                    <tr>
                        <td class="col-id">user_004</td>
                        <td class="col-name">최정숙</td>
                        <td class="col-phone">010-4567-8901</td>
                        <td class="col-email">choi@example.com</td>
                        <td class="col-date">2026-01-22</td>
                    </tr>
                    <tr>
                        <td class="col-id">user_005</td>
                        <td class="col-name">조명호</td>
                        <td class="col-phone">010-5678-9012</td>
                        <td class="col-email">jo@example.com</td>
                        <td class="col-date">2026-01-18</td>
                    </tr>
                </tbody>
            </table>
        </section>
    </main>

    <footer class="site-footer" style="background-color: black;">
       <cr:import url="./footer.jsp"/>
    </footer>

</body>
</html>
