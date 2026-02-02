<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cr"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 등록</title>
    <link rel="stylesheet" href="/css/product_write.css">
    <script>
    	function gopage(){
    	 	  location.href='./product_list.do';
    	}
    </script>
</head>
<body>
    <div class="product-container">
        <!-- Header -->
        <div class="product-header">
            <h1>상품 등록</h1>
        </div>

        <!-- Product Registration Form -->
            <!-- 상품명 -->
            <div class="form-group">
                <label class="form-label">상품명 <span class="required">*</span></label>
                ${one.pnm}
            </div>

            <!-- 상품코드 -->
            <div class="form-group">
                <label class="form-label">상품코드 <span class="required">*</span></label>
                ${one.pcode}
            </div>

            <!-- 원가 -->
            <div class="form-group">
                <label class="form-label">원가 <span class="required">*</span></label>
                <div class="input-with-unit">
                  <fmt:formatNumber value="${one.pcost}" /> 원 
                </div>
            </div>

            <!-- 판매가 -->
            <div class="form-group">
                <label class="form-label">판매가 <span class="required">*</span></label>
                <div class="input-with-unit">
                  <fmt:formatNumber value="${one.psale}" /> 원 
                </div>
            </div>

            <!-- 할인율 -->
            <div class="form-group">
                <label class="form-label">할인율 <span class="required">*</span></label>
                <div class="input-with-unit">
                   ${one.pdis} %
                </div>
            </div>

            <!-- 재고수량 -->
            <div class="form-group">
                <label class="form-label">재고수량 <span class="required">*</span></label>
                <div class="input-with-unit">
                   ${one.pea} EA
                </div>
            </div>

            <!-- 상품상세내용 -->
            <div class="form-group">
                <label class="form-label">상품상세내용 <span class="required">*</span></label>
                  ${one.pcontent}
            </div>

            <!-- 출력 유/무 -->
            <div class="form-group">
                <label class="form-label">출력 <span class="required">*</span></label>
                <div class="radio-group">
                   <cr:if test="${one.puse == 'Y'}">
                   판매중
                   </cr:if>
                   <cr:if test="${one.puse == 'N'}">
                   판매중지
                   </cr:if>
                </div>
            </div>

            <!-- 버튼 그룹 -->
            <div class="button-group">
                <button type="button" class="btn btn-submit" onclick="gopage()">목록</button>
            </div>
    </div>
</body>
</html>
