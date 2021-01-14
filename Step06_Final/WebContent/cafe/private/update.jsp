<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼전송되는 수정할 글의 번호, 제목, 내용을 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	//2. DB에 수정반영
	CafeDto dto=new CafeDto();
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess=CafeDao.getInstance().update(dto);
	//3. 응답한다
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/update.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<script>다");
			alert("수정 했습니
			location.href="${pageContext.request.contextPath}/cafe/detail.jsp?num=<%=num%>";
		</script>
	<%}else{ %>
		<script>
			alert("수정 실패");
			location.href="${pageContext.request.contextPath}/cafe/private/updateform.jsp?num=<%=num%>";
		</script>
	<%} %>
</body>
</html>