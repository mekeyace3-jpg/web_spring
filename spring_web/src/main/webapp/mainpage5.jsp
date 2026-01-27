<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL2 - Controller + JSTL 반복문</title>
</head>
<body>
<cr:if test="${myinfo[0] != null}">
<ul>
<cr:set var="blood" value="${myinfo[1]}"/>
<cr:forEach var="user" items="${myinfo[0]}" varStatus="i">
<li>고객명 : ${user}  / 혈액형 : ${blood[i.index]} 형</li>
</cr:forEach>
</ul>
</cr:if>
<cr:if test="${myinfo[0] == null}">
등록된 고객이 없습니다.
</cr:if>
</body>
</html>