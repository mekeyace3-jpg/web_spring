<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객 관리</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
    <link rel="stylesheet" href="/movie/admin/css/newadmin.css?v=3">
    <link rel="stylesheet" href="/movie/admin/css/admin_person.css?v=1">
</head>
<body>
    <header class="site-header">
         <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="section-header">
                <h2 class="panel-title">고객 관리</h2>
            </div>
            <p class="section-desc">고객 정보를 조회하고 관리할 수 있습니다.</p>

            <!-- Search Section -->
            <div class="search-section">
               
                <form class="search-form">
                    <div class="search-group">
                        <select class="search-select">
                            <option value="search_all" <cr:if test="${search=='search_all'}">selected</cr:if>>
                            전체
                            </option>
                            <option value="search_name" <cr:if test="${search=='search_name'}">selected</cr:if>>
                            고객명
                            </option>
                            <option value="search_phone" <cr:if test="${search=='search_phone'}">selected</cr:if>>
                            연락처
                            </option>
                            <option value="search_email" <cr:if test="${search=='search_email'}">selected</cr:if>>
                            이메일
                            </option>
                        </select>
                        <input type="text" value="${word}" class="search-input" placeholder="검색어를 입력하세요" required>
                        <button type="submit" class="btn-search">검색</button>
                        <button type="button" class="btn-search" onclick="location.href='./admin_person.do'">전체목록</button>
                    </div>
                </form>
            </div>

            <!-- Customer Table -->
            <table class="person-table">
                <thead>
                    <tr style="text-align: center !important;">
                        <th class="col-no">번호</th>
                        <th class="col-id">아이디</th>
                        <th class="col-name">고객명</th>
                        <th class="col-email">이메일</th>
                        <th class="col-phone">연락처</th>
                        <th class="col-path">가입경로</th>
                        <th class="col-date">가입일자</th>
                        <th class="col-status">상태</th>
                        <th class="col-manage">관리</th>
                    </tr>
                </thead>
                <tbody>
                	<cr:if test="${empty all}">
                    <tr><td style="text-align: center;" colspan="9">등록된 고객이 없습니다.</td></tr>
                	</cr:if>
                	<cr:if test="${not empty all}">
                		
                		<cr:forEach var="lists" items="${all}" varStatus="n">
			                    <tr>
			                        <td class="col-no"></td>
			                        <td class="col-id"></td>
			                        <td class="col-name"></td>
			                        <td class="col-email"></td>
			                        <td class="col-phone"></td>
			                        <td class="col-path"></td>
			                        <td class="col-date"></td>
			                        <td class="col-status"></td>
			                        <td class="col-manage">
			                            <button type="button" class="btn-delete" onclick="" title="삭제">삭제</button>
			                        </td>
			                    </tr>
                    	</cr:forEach>
                    </cr:if>
                </tbody>
            </table>

            <!-- Pagination -->
            <div class="pagination">
            	<cr:if test="${pagen > 10}">
                <a href="#" class="page-btn prev">이전</a>
                </cr:if>
                <cr:forEach var="pno" begin="1" end="${no}">
                <a href="./admin_person.do?pageno=${pno}" class="page-btn <cr:if test="${pagen == pno}">active</cr:if>">${pno}</a>
                </cr:forEach>
                <cr:if test="${no > 10}">
                <a href="#" class="page-btn next">다음</a>
                </cr:if>
            </div>
        </section>
    </main>
    <footer class="site-footer" style="background-color: black;">
       <cr:import url="./footer.jsp"/>
    </footer>
</body>
</html>
