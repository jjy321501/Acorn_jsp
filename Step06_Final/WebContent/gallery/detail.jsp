<%@page import="test.gallery.dao.GalleryDao"%>
<%@page import="test.gallery.dto.GalleryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//자세히 보여줄 겔러리 item 번호를 읽어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//번호를 이용해서 겔러리 item 정보를 얻어온다.
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
	<div>
		<img src="${pageContext.request.contextPath }<%=dto.getImagePath()%>"/>
		<div>
			<p><%=dto.getCaption() %></p>
			<p>by <strong><%=dto.getWriter() %></strong></p>
			<p><small><%=dto.getRegdate() %></small></p>
		</div>
	</div>
	<%if(dto.getPrevNum() != 0){ %>
		<a href="detail.jsp?num=<%=dto.getPrevNum()%>">이전</a>
	<%} %>
	<%if(dto.getNextNum() != 0){ %>
		<a href="detail.jsp?num=<%=dto.getNextNum()%>">다음</a>
	<%} %>
</div>
</body>
</html>
