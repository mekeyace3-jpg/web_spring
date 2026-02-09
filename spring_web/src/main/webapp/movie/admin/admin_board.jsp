<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 관리</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
    <link rel="stylesheet" href="/movie/admin/css/newadmin.css?v=3">
    <link rel="stylesheet" href="/movie/admin/css/admin_board.css?v=6">
</head>
<body>
    <header class="site-header">
         <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="section-header">
                <h2 class="panel-title">공지사항 관리</h2>
            </div>
            <p class="section-desc">공지사항을 작성, 수정, 삭제하고 관리할 수 있습니다.</p>

            <!-- Search Section -->
            <div class="search-section">
               
                <form id="frm" class="search-form">
                    <div class="search-group">
                        <select class="search-select" name="search">
                            <option value="search_all" <cr:if test="${search=='search_all'}">selected</cr:if>>
                            전체
                            </option>
                            <option value="search_subject" <cr:if test="${search=='search_subject'}">selected</cr:if>>
                            제목
                            </option>
                            <option value="search_writer" <cr:if test="${search=='search_writer'}">selected</cr:if>>
                            글쓴이
                            </option>
                        </select>
                        <input type="text" name="word" value="${word}" class="search-input" placeholder="검색어를 입력하세요" required>
                        <button type="submit" class="btn-search">검색</button>
                        <button type="button" class="btn-search" onclick="location.href='./admin_board.do'">전체목록</button>
                    </div>
                </form>
                
                <button type="button" class="btn-write" onclick="location.href='./admin_boardwrite.jsp';">글쓰기</button>
            </div>

            <!-- Board Table -->
            <table class="board-table">
                <thead>
                    <tr style="text-align: center !important;">
                        <th class="col-no">번호</th>
                        <th class="col-title">제목</th>
                        <th class="col-author">글쓴이</th>
                        <th class="col-date">등록일</th>
                        <th class="col-views">조회</th>
                    </tr>
                </thead>
                <tbody>
                	<cr:if test="${empty all}">
                    <tr><td style="text-align: center;" colspan="5">등록된 게시물이 없습니다.</td></tr>
                	</cr:if>
                	<cr:if test="${not empty all}">
                		
                		<cr:forEach var="lists" items="${all}" varStatus="n">
			                    <tr>
			                    <!-- 전체 게시물 - ((현재 페이지번호 - 1) * 페이지당 출력 갯수) - n.index -->
			                        <td class="col-no">${lists.getCtn() - ((pagen - 1) * notice_ea) - n.index}</td>
			                        <td style="cursor: pointer;" class="col-title notice_view" data-idx="${lists.getNidx()}">
			                        <!-- 공지사항 제목 길이가 너무 길 경우 말줄임표(...)를 사용하는 방식 -->
			                        <cr:if test="${fn:length(lists.getNsubject()) > 40}">
			                        ${lists.getNsubject().substring(0,40)}...
			                        </cr:if>
			                        <cr:if test="${fn:length(lists.getNsubject()) <= 40}">
			                        ${lists.getNsubject()}
			                        </cr:if>
			                        </td>
			                        <td class="col-author">${lists.getNwriter()}</td>
			                        <td class="col-date">${lists.getNdate().substring(0,10)}</td>
			                        <td class="col-views">${lists.getNcount()}</td>
			                    </tr>
                    	</cr:forEach>
                    </cr:if>
                </tbody>
            </table>
            <!-- Pagination active-->
            <div class="pagination">
            	<cr:if test="${pagen > 10}">
                <a href="#" class="page-btn prev">이전</a>
                </cr:if>
                <cr:forEach var="pno" begin="1" end="${no}">
                <!-- 만약 검색한 사항에 대한 페이지네이션이 작동할 경우 검색된 사항에 대해서도 get 통신으로 처리해야함 -->
                <a href="./admin_board.do?pageno=${pno}&search=${search}&word=${word}" class="page-btn <cr:if test="${pagen == pno}">active</cr:if>">${pno}</a>
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
<script type="module">
import {notice} from "./js/allpage.js?v=10";

//게시판 제목을 클릭시 해당 정보를 js에서 처리하여 admin_boardview.do에 GET으로 전달하는 이벤트 핸들링
var btn = document.querySelectorAll(".notice_view");
for(var a=0; a<btn.length; a++){
	btn[a].addEventListener("click",function(z){
			var node = z.target.attributes[2].nodeValue;
			new notice().notice_view(node);
	});	
}
</script>
</html>
