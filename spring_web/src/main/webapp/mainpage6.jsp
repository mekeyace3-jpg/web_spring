<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="cr" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!-- jstl 엔진 중 sql 엔진 라이브러리를 활용하여 Database 정보를 설정 -->
<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/cms"
user="web_cms"
password="cms_1234"
/>
<!-- Database 쿼리문을 실행 -->
<cr:set var="table" value="member"/>
<cr:set var="order" value="order by midx desc"/>
<sql:query var="ps" dataSource="${db}">
select mid,mname from ${table} ${order}
</sql:query>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL - Database 연결하기</title>
</head>
<body>
<!-- 쿼리문을 실행하는 변수 및 rows 데이터베이스 rows 값을 가져와서 반복문을 적용 -->
<cr:forEach var="data" items="${ps.rows}">
<!-- get(컬럼명) 또는 ['컬럼명'] -->
아이디 : ${data.get("mid")} / 고객명 : ${data['mname']}<br>
</cr:forEach>
</body>
</html>

