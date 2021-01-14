<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자세히 보여줄 갤러리 item 번호를 읽어온다
	int num=Integer.parseInt(request.getParameter("num"));
	//번호를 이용해서 갤러리 item 정보를 얻어온다
	GalleryDto dto=GalleryDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/gallery/detail.jsp</title>
</head>
<body>
<div class="container">
	<img src="${pageContext.request.contextPath}<%=dto.getImagePath() %>"/>
	<div>
		<p><%=dto.getCaption() %></p>
		<p>by <strong><%=dto.getWriter() %></strong></p>
		<p><%=dto.getRegdate() %></p>
	</div>
</div>
</body>
</html>