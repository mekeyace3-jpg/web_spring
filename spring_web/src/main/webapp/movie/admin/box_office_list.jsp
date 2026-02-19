<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>영화 박스오피스 TOP 10</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
    <link rel="stylesheet" href="/movie/admin/css/newadmin.css?v=3">
    <link rel="stylesheet" href="/movie/admin/css/box_office_list.css?v=1">
</head>
<body>
    <header class="site-header">
        <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="section-header">
                <h2 class="panel-title">영화 박스오피스 TOP 10</h2>
            </div>
            <p class="section-desc">현재 주의 박스오피스 TOP 10 영화목록입니다.</p>

            <div class="list-container">
                <table class="boxoffice-table">
                    <thead>
                        <tr>
                            <th class="col-rank">순위</th>
                            <th class="col-title">영화제목</th>
                            <th class="col-image">이미지</th>
                            <th class="col-date">개봉일자</th>
                            <th class="col-status">랭킹 진입여부</th>
                            <th class="col-audience">누적관객수</th>
                            <th class="col-manage">정보수정</th>
                        </tr>
                    </thead>
                    <tbody id="boxoffice_view">
                        
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    <!-- 영화 이미지 등록하는 form 통신 -->
    <form id="imgs" method="post" action="./cdn_server.do" enctype="multipart/form-data">
    	<input type="hidden" name="code">
    	<input type="hidden" name="bidx" value="${bidx}">
    	<input type="file" name="upimage" value="" accept="image/*" style="opacity: 0;">
    </form>
    <footer class="site-footer" style="background-color: black;">
       <cr:import url="./footer.jsp"/>
    </footer>
</body>
<script>
//JSON.parse => Backend가 JSON 배열을 문자로 전달 => 실제 배열형태로 변환
//import 한 js 파일에도 해당 변수는 전역변수로 활용 가능합니다.
var jsondata = JSON.parse('${jsondata}');
var bidx = '${bidx}';
</script>
<!-- 일반 function 함수를 사용하는 방식 {함수명} -->
<script type="module">
import {html_view} from "./js/admin_apilist.js?v=3";
html_view();	//해당 함수를 즉시 실행하는 명령어
</script>
<script>
//이미지 등록 버튼을 클릭시 영화 고유코드 및 이미지 등록을 할 수 있도록 적용
function upimg(code){
	imgs.code.value = code;
	imgs.upimage.click();
}
//해당 첨부파일에 이미지를 선택시 파일 전송함
window.onload = function(){
    imgs.upimage.onchange = function(){
        if(imgs.upimage.value != ""){
            imgs.submit();
        }
    }
}
</script>


</html>
