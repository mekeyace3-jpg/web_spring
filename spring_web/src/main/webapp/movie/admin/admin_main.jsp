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
    <link rel="stylesheet" href="/movie/admin/css/newadmin.css?v=3">
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
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
                	<cr:if test="${all == null}">
                	<tr>
                	<td colspan="5" style="text-align:center;">신규로 등록한 관리자가 없습니다.</td>
                	</tr>
                	</cr:if>
                	<cr:if test="${all != null}">
                	<cr:forEach var="lists" items="${all}">
                    <tr>
                        <td class="col-name">${lists.getMname()}</td>
                        <td class="col-email">${lists.getMemail()}</td>
                        <td class="col-phone" style="text-align:center;">${lists.getMtel()}</td>
                        <td class="col-date" style="text-align:center;">${lists.getMdate().substring(0,10)}</td>
                        <td class="col-action" style="text-align:center;">
                        <cr:if test="${lists.getMuse() == 'N'}">
                            <button type="button" data-index="${lists.getMidx()}" class="btn-approve use_login">승인</button>
                        </cr:if>
                            <button type="button" data-index="${lists.getMidx()}" class="btn-delete del_login">삭제</button>
                        </td>
                    </tr>
                    </cr:forEach>
                    </cr:if>
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
                        <th class="col-date">등록일</th>
                        <th class="col-views">조회</th>
                    </tr>
                </thead>
                <tbody>
                	<tr><td colspan="4" style="text-align:center;">등록된 게시물이 없습니다.</td></tr>
                    <tr>
                        <td class="col-title">서비스 점검 안내</td>
                        <td class="col-author" style="text-align:center;">관리자</td>
                        <td class="col-date" style="text-align:center;">2026-02-01</td>
                        <td class="col-views" style="text-align:center;">125</td>
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
<!-- 
querySelector : 한개의 오브젝트를 가져올 때 사용
querySelectorAll : 여러개의 오브젝트를 가져올 때 사용 (class만 적용)
 -->
<script type="module">
import {admin_gover} from "./js/allpage.js?v=20260223";

var ea = document.querySelectorAll(".use_login");
for(var a=0; a<ea.length; a++){
	ea[a].addEventListener("click",function(z){ //z : <button type="button" data-index="" class="btn-approve use_login">승인</button>
		//console.log(z);
		var node = z.target.attributes[1].nodeValue;		//data-index 가상의 속성값을 가져옴
		new admin_gover().admin_userok(node);
	});
}
//삭제처리
var i = document.querySelectorAll(".del_login");
for(var b=0; b<i.length; b++){
	i[b].addEventListener("click",function(z){
		if(confirm("해당 관리자를 삭제 데이터는 복구되지 않습니다.\n삭제 진행 하시겠습니까?")){
			var node = z.target.attributes[1].nodeValue;
			new admin_gover().admin_userdel(node);
		}
	});
}
</script>

</html>
