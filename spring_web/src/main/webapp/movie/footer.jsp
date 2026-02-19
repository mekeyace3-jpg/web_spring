<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="footer-content">
            <ul class="footer-links">
                <li><a href="#">회사소개</a></li>
                <li><a href="#">이용약관</a></li>
                <li><a href="#">개인정보처리방침</a></li>
            </ul>
            <p class="copyright">대표자 : 홍길동 | 사업자 번호 : 220-90-07535 <a href="javascript:biz()">[사업자확인]</a></p>
            <p class="copyright">&copy; 2026 영화예매. All rights reserved.</p>
</div>
<script>
//공정거래위원회 API 연동 (사업자번호)
function biz(){
    window.open("http://www.ftc.go.kr/bizCommPop.do?wrkr_no=2209007535","","width=500,height=500");
}
</script>