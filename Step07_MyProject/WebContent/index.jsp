<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//session scope 에 "id" 라는 키값으로 저장된 문자열이 있는지 읽어와 본다.
	String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic&display=swap');
</style>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body style="font-family: 'Jua', sans-serif;">
<jsp:include page="include/navbar.jsp"></jsp:include>
	<div class="container">
		<%-- 만일 id 가 null 이 아니면 로그인을 한 상태이다. --%>
		<%if(id != null){ %>
		
			<p> 
				<a href="users/private/info.jsp"><%=id %></a> 님 로그인중...
				<a href="users/logout.jsp">로그아웃</a>
			</p>
		<%} %>
		
		<img style="position: relative; width:1000px;height:976px" src="images/angrymain.jpg"/>
		<a style="position: absolute;" href="file/list.jsp"><img src="imgaes/go.png"/></a>
	</div>
</body>
</html>