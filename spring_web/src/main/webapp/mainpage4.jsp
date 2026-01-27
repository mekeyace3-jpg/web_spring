<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>     
<%
	ArrayList<String> all = new ArrayList<>();
	all.add("박순수");
	all.add("허대회");
	all.add("신범석");
	all.add("김고운");
	all.add("김예빈");
	all.add("권하민");
	all.add("김동완");
	ArrayList<String> mail = new ArrayList<>();
	mail.add("park@nate.com");
	mail.add("hur@gmail.com");
	mail.add("shin@naver.com");
	mail.add("kim@gmail.com");
	mail.add("bin@naver.com");
	mail.add("min@naver.com");
	mail.add("wan@gmail.com");
	ArrayList<ArrayList<String>> alldata = new ArrayList<ArrayList<String>>();
	alldata.add(all);
	alldata.add(mail);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL2 - 기초문법 (XHTML) - 반복문2</title>
</head>
<body>
<!-- 
varStatus : 배열번호, 순서, 갯수, 속성값 
first : 배열에 첫번째 데이터만 (true), false
last : 배열에 맨 마지막 데이터만 (true), false
index : 배열 노드번호
count : 데이터 기준 +1씩 카운팅
-->
<cr:forEach var="z" items="<%=all%>" varStatus="n">
데이터 기준 : ${n.last}
번호 : ${n.index}
데이터 값 : ${z}
총 데이터 갯수 카운팅 : ${n.count} 
<br>
</cr:forEach>
<br><br>
<cr:forEach var="aa" items="<%=alldata%>"> <!-- 2 --> 
<cr:forEach var="bb" items="${aa}"> <!-- 7 -->
${bb}<br>
</cr:forEach>
</cr:forEach>

<cr:set var="dd" value="<%=alldata.get(1)%>"/>
<cr:forEach var="cc" items="<%=alldata.get(0)%>" varStatus="no">
고객명 : ${cc}   / 이메일 : ${dd.get(no.index)}  <br> 
</cr:forEach>

</body>
</html>