<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL2 - 기초문법 (XHTML) - 조건문</title>
</head>
<body>
<cr:set var="data" value="hong@nate.com" scope="session"/>
<!-- jstl의 조건문 else if(X) test 속성에 조건식을 사용하고 var 결과를 셋팅 (true,false) -->
<cr:if test="${5 < 10}" var="result">
10이 큽니다.
</cr:if>
${result}
<cr:if test="${5 > 10}" var="result">
5가 큽니다.
</cr:if>
${result}
<br><br><br>
<cr:set var="userid" value="hong"/>
<cr:if test="${userid =='hong'}">
홍길동님 환영합니다.
</cr:if>
<cr:if test="${userid !='hong'}">
로그인
</cr:if>
<br><br>
<!-- choose라는 조건 그룹의 태그 -->
<cr:set var="agree" value="N"/>
<!-- choose사용시 주의사항 일반 html 주석을 choose 안에 사용을 하실 수 없습니다. -->
<cr:choose>
<%-- eq : ==, ne : != --%>
	<cr:when test="${agree eq 'Y'}"> <!-- when = if -->
	 약관에 동의 하셨습니다.
	</cr:when>
	<cr:when test="${agree ne 'N'}"> <!-- when = else if -->
	 약관에 비동의 하셨습니다.
	</cr:when>
	<cr:otherwise>  <!-- when = else -->
	 해당 데이터의 값이 올바르지 않습니다.
	</cr:otherwise>
</cr:choose>
<br><br><br>
<!--  ||(or), &&(and) -->
<cr:set var="no" value="100"/>
<cr:choose>
	<cr:when test="${no > 100 && no <= 200}">
	100 보다 크고 200 미만의 숫자 입니다.
	</cr:when>
	<cr:when test="${no <= 100}">
	100 이하의 숫자 입니다.
	</cr:when>
</cr:choose>

</body>
</html>