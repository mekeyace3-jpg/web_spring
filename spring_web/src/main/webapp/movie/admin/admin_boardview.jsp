<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<cr:if test="${empty ndto}">
<script>
	alert('올바른 접근이 아닙니다.');
	history.go(-1);
</script>
</cr:if>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 확인</title>
    <link rel="stylesheet" href="/movie/admin/css/admin_main.css?v=4">
    <link rel="stylesheet" href="/movie/admin/css/admin_boardwrite.css?v=1">
    <link rel="stylesheet" href="/movie/admin/css/newadmin.css?v=3">
</head>
<body>
    <header class="site-header">
        <cr:import url="./admin_top.jsp"/>
    </header>

    <main class="container">
        <section class="panel full-width">
            <div class="boardwrite-form">
            
                <div class="form-section">
                    <h3 class="section-subtitle">공지사항 정보</h3>
                    
                    <div class="form-group">
                        <label class="form-label">제목</label>
                        ${ndto.getNsubject()}
                    </div>

                    <div class="form-row">
                        <div class="form-group form-group-half">
                            <label class="form-label">글쓴이</label>
                            ${ndto.getNwriter()}
                        </div>
                        <div class="form-group form-group-half">
                            <label class="form-label">이메일</label>
                            ${ndto.getNemail()}
                        </div>
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">내용</h3>
                    
                    <div class="form-group">
                        <label class="form-label">내용</label>
                        ${ndto.getNcontent()}
                    </div>
                </div>

                <div class="form-section">
                    <h3 class="section-subtitle">첨부 파일</h3>
                    
                    <div class="form-group">
                        <label class="form-label">첨부 파일</label>
                        <div class="file-input-wrapper">
                        <!-- 해당 게시물에 첨부파일이 없을경우 출력하는 방식과 첨부파일이 있을 경우 출력하는 방식으로 구분 -->
                        <cr:if test="${ndto.getNfile()==null}">
                        첨부파일이 없습니다.
                        </cr:if>
                        <cr:if test="${ndto.getNfile()!=null}">
                        <a href="${ndto.getNfile()}" target="_blank">
                        <img src='./disk.svg'> [첨부파일]
                        </a>
                        </cr:if>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="button" class="btn-modify">글 수정</button>
                    <button type="button" class="btn-list">목록</button>
                </div>
            </div>
        </section>
    </main>

    <footer class="site-footer" style="background-color: black;">
       <cr:import url="./footer.jsp"/>
    </footer>

</body>
</html>
