<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>배너 관리</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
    <link rel="stylesheet" href="/movie/admin/css/admin_banner.css?v=1">
</head>
<body>
    <header class="site-header">
        <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="section-header">
                <span class="section-badge">4</span>
                <h2 class="panel-title">배너 관리</h2>
            </div>
            <p class="section-desc">배너를 등록/수정/삭제하고 순서를 관리할 수 있습니다.</p>

            <div class="banner-actions">
                <div class="left-actions">
                    <button class="btn-add">배너 추가</button>
                </div>
                <div class="right-actions">
                    <form class="search-form">
                        <input type="text" class="search-input" placeholder="링크주소나 파일명으로 검색">
                        <button type="submit" class="btn-search">검색</button>
                    </form>
                </div>
            </div>

            <table class="banner-table">
                <thead>
                    <tr>
                        <th class="col-no">번호</th>
                        <th class="col-img">배너이미지</th>
                        <th class="col-link">링크주소</th>
                        <th class="col-order">배너순서</th>
                        <th class="col-manage">관리</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="col-no">10</td>
                        <td class="col-img"><img src="/movie/admin/images/banner1.jpg" alt="배너1" class="banner-thumb"></td>
                        <td class="col-link">https://example.com/promo1</td>
                        <td class="col-order">1</td>
                        <td class="col-manage">
                            <button type="button" class="btn-edit">수정</button>
                            <button type="button" class="btn-delete">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-no">9</td>
                        <td class="col-img"><img src="/movie/admin/images/banner2.jpg" alt="배너2" class="banner-thumb"></td>
                        <td class="col-link">https://example.com/promo2</td>
                        <td class="col-order">2</td>
                        <td class="col-manage">
                            <button type="button" class="btn-edit">수정</button>
                            <button type="button" class="btn-delete">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-no">8</td>
                        <td class="col-img"><img src="/movie/admin/images/banner3.jpg" alt="배너3" class="banner-thumb"></td>
                        <td class="col-link">https://example.com/promo3</td>
                        <td class="col-order">3</td>
                        <td class="col-manage">
                            <button type="button" class="btn-edit">수정</button>
                            <button type="button" class="btn-delete">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-no">7</td>
                        <td class="col-img"><img src="/movie/admin/images/banner4.jpg" alt="배너4" class="banner-thumb"></td>
                        <td class="col-link">https://example.com/promo4</td>
                        <td class="col-order">4</td>
                        <td class="col-manage">
                            <button type="button" class="btn-edit">수정</button>
                            <button type="button" class="btn-delete">삭제</button>
                        </td>
                    </tr>
                    <tr>
                        <td class="col-no">6</td>
                        <td class="col-img"><img src="/movie/admin/images/banner5.jpg" alt="배너5" class="banner-thumb"></td>
                        <td class="col-link">https://example.com/promo5</td>
                        <td class="col-order">5</td>
                        <td class="col-manage">
                            <button type="button" class="btn-edit">수정</button>
                            <button type="button" class="btn-delete">삭제</button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="pagination">
                <a href="#" class="page-btn prev">이전</a>
                <a href="#" class="page-btn active">1</a>
                <a href="#" class="page-btn">2</a>
                <a href="#" class="page-btn">3</a>
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