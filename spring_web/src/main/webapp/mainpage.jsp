<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
JSTL : JSP를 기본 태그 + L(라이브러리)
 -->
<!-- JSTL의 엔진 -->
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- JSTL의 각종 함수 (단어를 잘라서 사용하는법, 단어변경)-->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- JSTL의 각종 숫자,날짜형식, 메세지 처리 (formatDate), message(변수명), 금액출력, 시간형태-->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- JSTL의 Database를 연결할 때 사용하는 방식  -->
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%
	Integer point = 50000;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL1 - 기초문법 (XHTML)</title>
</head>
<body>
${user} <br>
<!-- set 태그 : setattribute와 동일한 형태를 가지는 코드 -->
<cr:set var="a" value="포인트"/>${a} <br>
<cr:set var="p" value="<%=point%>"/>${p} <br>
<cr:set var="c" value="jstl문법공부" scope="session"/>
세션 데이터값 : ${c}
<br>
<cr:set var="c" value="" scope="session"/>
세션 데이터 초기화 : ${c}
<br><br>
<!-- mainpage2.jsp에서 만들어진 session값을 출력 -->
${data}
<br><br>
<cr:out value="출력 연습"/> <!-- jsp : out.print와 동일한 성격의 태그 -->
<br><br>
<%
String tel = "010-****-1234";
%>
<!-- 
var 속성 : jstl 변수를 선언
scope속성 : core에 적용되는 속성 (session,request(jsp변수))
 -->
<cr:set var="t" scope="request"><%=tel%></cr:set>
${t}
</body>
</html>