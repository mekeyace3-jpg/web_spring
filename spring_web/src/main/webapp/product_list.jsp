<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cr"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 목록</title>
    <link rel="stylesheet" href="/css/product_list.css?v=1">
</head>
<body>
    <div class="product-list-container">
        <!-- Header -->
        <div class="product-list-header">
            <h1>상품 목록</h1>
        </div>

        <!-- Search Section -->
        <div class="search-section">
            <form id="sfrm" method="get" class="search-form" action="./product_list.do">
                <div class="search-box">
                    <input type="text" name="search" placeholder="상품명으로 검색하세요" class="search-input" required>
                    <button type="submit" class="search-btn">검색</button>
                </div>
            </form>
        </div>

        <!-- Product Table -->
        <div class="table-wrapper">
            <table class="product-table">
                <thead>
                    <tr>
                        <th class="col-number">번호</th>
                        <th class="col-name">상품명</th>
                        <th class="col-code">상품코드</th>
                        <th class="col-price">판매가</th>
                        <th class="col-stock">재고</th>
                        <th class="col-stock2">등록일</th>
                        <th class="col-management">관리</th>
                    </tr>
                </thead>
                <tbody>
                <cr:forEach var="lists" items="${all}" varStatus="n">
                        <tr>
                            <td class="col-number">${lists.ctn - n.index}</td>
                            <td class="col-name" style="text-align: left;" onclick="views('${lists.pidx}')">${lists.pnm}</td>
                            <td class="col-code">${lists.pcode}</td>
                            <td class="col-price">
                            <fmt:formatNumber value="${lists.psale}" pattern="#,### 원"/>
                            <%-- 
                            <fmt:formatNumber value="12345678" type="currency" currencySymbol="＄"/>
                            <fmt:formatNumber value="0.37" type="percent"/>
                            <fmt:formatNumber value="12.56998" pattern=".0"/>
                            <fmt:parseNumber value="15.678" integerOnly="true"/>
                            --%>
                            </td>
                            <td class="col-stock">${lists.getPea()}</td>
                            <td class="col-stock2">
                            <!-- parseDate : 문자열을 실제 Date 자료형으로 변환 후 formatDate로 출력  -->
                            <%--
                            <fmt:parseDate var="pdate" value="${lists.pdate}" pattern="yyyy-MM-dd"/> 
                            <fmt:formatDate value="${pdate}" pattern="yyyy.MM.dd"/>
                             --%>
                             <!-- functions를 이용하여 날짜만 출력하는 형태 -->
                             ${fn:substring(lists.pdate,0,10)}
                            </td>
                            <td class="col-management">
                                <button type="button" class="btn-edit" onclick="product_modify('${lists.pidx}','${lists.pcode}')">수정</button>
                                <button type="button" class="btn-delete" onclick="product_del('${lists.pidx}','${lists.pcode}')">삭제</button>
                            </td>
                        </tr>
                </cr:forEach>        
                </tbody>
            </table>
            <!-- 삭제를 위한 form 태그 post 전송 -->
            <form id="frm">
            	<input type="hidden" name="pidx" value="">
            	<input type="hidden" name="pcode" value="">
            </form>
            <cr:if test="${all == null}">
                <div class="empty-state">
                    <p>등록된 상품이 없습니다.</p>
                </div>
            </cr:if>    
        </div>

        <!-- Pagination -->
        <div class="pagination">
                <a href="#" class="page-btn page-first">첫 페이지</a>
                <a href="#" class="page-btn page-prev">이전</a>
                <span class="page-number current">1</span>
                <a href="#" class="page-btn page-next">다음</a>
                <a href="#" class="page-btn page-last">마지막 페이지</a>
        </div>

        <!-- Button Group -->
        <div class="button-group">
            <button class="btn btn-write">상품 등록</button>
        </div>
    </div>
</body>
<script src="/js/product.js?v=1"></script>
</html>




