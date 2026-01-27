<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%
	String data = "빨강,주황,노랑,초록,파랑";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL로 외부 페이지 로드하는 방법 (main.do를 실행 시켜서 top.jsp에 값을 출력)</title>
</head>
<body>
<cr:set var="arr" value="<%=data%>"/>
<cr:set var="color" value="${fn:split(arr,',')}"/>
<cr:forEach var="z" items="${color}">
${z}
</cr:forEach>
<br><br>
<cr:set var="word" value="abcdefg"/>
단어 갯수 : ${fn:length(word)} <br>
데이터 출력 : ${fn:toUpperCase(word)}<br>
데이터 출력 : ${fn:toLowerCase(word)}<br>
특정문자검색 : ${fn:contains(word,'c')}
<br><br>

<!-- jsp include file과 동일한 형태로 외부 파일을 로드 -->
<cr:set var="kk" value="10%" scope="request"/> <!-- 해당 jsp 파일에서만 생성된 변수에 출력을 하는 역활 --> 
<cr:import url="./top.jsp"/> 
<!-- import에는 해당 set 태그에서 적용된 변수가 출력이 안됨 
단 set 태그에 scope 태그를 이용하여 request 속성을 적용하면 해당 jsp에 변수로 출력할 수 있음
 -->
 
<!-- 아래 코드는 jstl 변수를 banner.jsp에서 출력하며, 로드시 JSP 형태로 로드하는 방식 -->
<cr:set var="banner_img" value="https://img.freepik.com/free-vector/graident-ai-robot-vectorart_78370-4114.jpg"/>
<%@ include file = "./banner.jsp" %>
 
<!-- import jsp에 값을 이관하는 방식(DHTML) : param 태그를 이용하여 출력하는 방식 -->
<cr:import url="./footer.jsp">
	<cr:param name="copyright" value="회사정보 출력 페이지"/>
</cr:import>
</body>
</html>




