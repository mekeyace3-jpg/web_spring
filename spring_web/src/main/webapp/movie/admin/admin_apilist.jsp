<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 데이터 리스트</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
    <link rel="stylesheet" href="/movie/admin/css/admin_apilist.css?v=1">
</head>
<body>
    <header class="site-header">
        <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="section-header">
                <h2 class="panel-title">영화 데이터 리스트</h2>
            </div>
            <p class="section-desc">년/월/일 입력 후 조회하여 해당 일자의 영화 데이터 목록을 확인합니다.</p>

            <div class="search-panel">
                <form class="date-form" method="post" action="./admin_moviedata.do">
                    <div class="date-inputs">
                        <input type="text" name="date" class="input-year" placeholder="예시)20260211" maxlength="8" required>
                    </div>
                    <div class="search-action">
                        <button type="submit" class="btn-search">조회</button>
                        <button type="button" class="btn-search" onclick="location.href='./admin_movieapi.do'">
                        영화정보 API 설정
                        </button>
                    </div>
                </form>
            </div>

            <div class="list-container">
                <table class="apilist-table">
                    <thead>
                        <tr>
                            <th class="col-date">일자</th>
                            <th class="col-item">데이터항목</th>
                            <th class="col-manage">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-date">2026-02-11</td>
                            <td class="col-item">영화 이미지: poster_0123.jpg</td>
                            <td class="col-manage">
                                <button type="button" class="btn-register">이미지등록</button>
                                <button type="button" class="btn-delete">삭제</button>
                            </td>
                        </tr>
                        <tr>
                            <td class="col-date">2026-02-10</td>
                            <td class="col-item">메타데이터: runtime, director, rating</td>
                            <td class="col-manage">
                                <button type="button" class="btn-register">이미지등록</button>
                                <button type="button" class="btn-delete">삭제</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="pagination">
                <a href="#" class="page-btn prev">이전</a>
                <a href="#" class="page-btn active">1</a>
                <a href="#" class="page-btn next">다음</a>
            </div>
        </section>
    </main>

    <footer class="site-footer">
        <div class="container">© 2026 MySite 관리자</div>
    </footer>
</body>
</html>
