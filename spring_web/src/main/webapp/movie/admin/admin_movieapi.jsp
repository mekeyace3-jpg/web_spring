<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<cr:if test="${not empty message}">
<script>
${message}
</script>
</cr:if>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 정보 API 관리</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
    <link rel="stylesheet" href="/movie/admin/css/newadmin.css?v=3">
    <link rel="stylesheet" href="/movie/admin/css/admin_movieapi.css?v=1">
</head>
<body>
    <header class="site-header">
        <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="section-header">
                <h2 class="panel-title">영화 정보 API 관리</h2>
            </div>
            <p class="section-desc">영화 정보사이트 API의 URL경로와 KEY 정보를 등록/수정할 수 있습니다.</p>

            <div class="api-form-container">
                <form id="frm" method="post" class="api-form" action="./admin_movieapi.do">
                    <div class="form-group">
                        <label for="api-url" class="form-label">API URL 경로</label>
                        <input type="text" name="murl" class="form-input" placeholder="예: https://api.example.com/movies" value="${murl}" required>
                    </div>

                    <div class="form-group">
                        <label for="api-key" class="form-label">API KEY</label>
                        <input type="text" name="mkey" class="form-input" placeholder="예: your_api_key_here" value="${mkey}" required>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn-register">등록</button>
                        <button type="button" class="btn-register" onclick="location.href='./admin_apilist.do';">
                        영화 API 목록
                        </button>
                    </div>
                </form>
            </div>
        </section>
    </main>
    <footer class="site-footer" style="background-color: black;">
       <cr:import url="./footer.jsp"/>
    </footer>
</body>
</html>
