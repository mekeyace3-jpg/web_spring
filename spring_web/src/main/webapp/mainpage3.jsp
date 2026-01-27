<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>   
<%
ArrayList<String> all = new ArrayList<String>();
all.add("hong");
all.add("kim");
all.add("park");
all.add("shin");

Integer no[] = {10,20,30,55,60,70,75,80};

/* 응용문제 
   해당 배열값을 처리하여 다음과 같은 결과가 나오도록 출력하시오.	
   21 57 69 73
*/

ArrayList<Integer> age = new ArrayList<Integer>();
age.add(16);
age.add(21);
age.add(38);
age.add(44);
age.add(57);
age.add(69);
age.add(73);
age.add(88);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL2 - 기초문법 (XHTML) - 반복문</title>
</head>
<body>
<ul>
<!-- forEach : jstl 전용 반복문 => for문 과 비슷한 성격 (역순으로 출력은 불가능함) 
begin : 시작값
end : 종료값
step : 반복시 데이터의 + 증가 기준을 셋팅할 수 있음 단, 음수를 사용할 수 없습니다.

역순을 사용시 기본 데이터 총 합계 - 반복문 var 정보를 적용해야함
-->
<cr:set var="total" value="8"/>
<cr:forEach var="a" begin="0" end="7" step="1">
<li>${total-a}</li>
</cr:forEach>
</ul>
<br><br>
<ol>
<!-- forEach 사용이유 : 배열값을 빠르게 출력하기 위함  (items : 해당 속성은 배열 데이터) -->
<cr:forEach var="data" items="<%=no%>">
<li>${data}</li>
</cr:forEach>
</ol>
<br><br>
<dl>
<dt>사용자 정보 리스트</dt>
<cr:forEach var="user" items="<%=all%>">
<cr:if test="${user eq 'shin'}">
<dl>${user}</dl>
</cr:if>
</cr:forEach>
</dl>
<br><br>




</body>
</html>