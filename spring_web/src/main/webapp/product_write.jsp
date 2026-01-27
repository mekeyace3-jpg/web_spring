<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 등록</title>
    <link rel="stylesheet" href="/css/product_write.css">
    <script>
    	function gopage(){
    	 	  frm.action="./product_writeok.do";
    	 	  frm.submit();
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
        <form id="frm" class="product-form" method="post" onsubmit="return gopage()">
            <!-- 상품명 -->
            <div class="form-group">
                <label class="form-label">상품명 <span class="required">*</span></label>
                <input type="text" name="pnm" class="form-input" placeholder="상품명을 입력해주세요" required>
            </div>

            <!-- 상품코드 -->
            <div class="form-group">
                <label class="form-label">상품코드 <span class="required">*</span></label>
                <input type="text" name="pcode" class="form-input" placeholder="상품코드를 입력해주세요" required>
            </div>

            <!-- 원가 -->
            <div class="form-group">
                <label class="form-label">원가 <span class="required">*</span></label>
                <div class="input-with-unit">
                    <input type="number" name="pcost" class="form-input" placeholder="0" min="0" max="60000" maxlength="5" required>
                    <span class="unit">원</span>
                </div>
            </div>

            <!-- 판매가 -->
            <div class="form-group">
                <label class="form-label">판매가 <span class="required">*</span></label>
                <div class="input-with-unit">
                    <input type="number" name="psale" class="form-input" placeholder="0" min="0" max="60000" maxlength="5" required>
                    <span class="unit">원</span>
                </div>
            </div>

            <!-- 할인율 -->
            <div class="form-group">
                <label class="form-label">할인율 <span class="required">*</span></label>
                <div class="input-with-unit">
                    <input type="number" name="pdis" class="form-input" placeholder="0" min="0" max="100" required>
                    <span class="unit">%</span>
                </div>
            </div>

            <!-- 재고수량 -->
            <div class="form-group">
                <label class="form-label">재고수량 <span class="required">*</span></label>
                <div class="input-with-unit">
                    <input type="number" name="pea" class="form-input" placeholder="0" min="0" max="60000" maxlength="5" required>
                    <span class="unit">개</span>
                </div>
            </div>

            <!-- 상품상세내용 -->
            <div class="form-group">
                <label class="form-label">상품상세내용 <span class="required">*</span></label>
                <textarea class="form-textarea" name="pcontent" rows="8" placeholder="상품의 상세한 내용을 입력해주세요"></textarea>
            </div>

            <!-- 출력 유/무 -->
            <div class="form-group">
                <label class="form-label">출력 <span class="required">*</span></label>
                <div class="radio-group">
                    <label class="radio-item">
                        <input type="radio" name="puse" class="radio-input" value="Y" checked>
                        <span class="radio-label">유</span>
                    </label>
                    <label class="radio-item">
                        <input type="radio" name="puse" class="radio-input" value="N">
                        <span class="radio-label">무</span>
                    </label>
                </div>
            </div>

            <!-- 버튼 그룹 -->
            <div class="button-group">
                <button type="submit" class="btn btn-submit">등록</button>
                <button type="reset" class="btn btn-reset">초기화</button>
                <button type="button" class="btn btn-cancel">취소</button>
            </div>
        </form>
    </div>
</body>
</html>
