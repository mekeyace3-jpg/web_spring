<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<section class="top10-section">
            <h2 class="section-title">신작영화 TOP10</h2>
            <div class="movies-grid" id="toplist">
            	<!-- 데이터 반복 javascript로 출력-->
                
                <!-- 데이터 끝 -->
            </div>
</section>
<!-- Front-end에서 오늘날짜 기준 -1일의 데이터를 요청하여 출력하는 방식 -->
<script type="module">
import {top10} from "./js/api_movie.js?v=3";
top10();
</script>

