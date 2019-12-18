<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>
${sessionScope.loginUser.user_id }
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>

 	<c:url var="myListbtn" value="myupdatememberlist.do">
				<c:param name="user_id" value="${sessionScope.loginUser.user_id }"/>
	</c:url>
	
	<c:url var="blistbtn" value="blist.do">
				<c:param name="user_id" value="${sessionScope.loginUser.u_mid }"/>
	</c:url>
	
	
<div class="menu"><a href="${myListbtn}">업데이트 버튼</a></div>
<div class="menu"><a href="${blistbtn}">채팅내역 버튼</a></div>

</body>
</html>