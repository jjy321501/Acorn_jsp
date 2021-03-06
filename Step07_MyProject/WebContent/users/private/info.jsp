<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. session scope 에서 로그인된 아이디 불러오기
	String id=(String)session.getAttribute("id");
	//2. 로그인된 아이디를 이용해서 DB 에서 가입정보를 불러온다.
	UsersDto dto=UsersDao.getInstance().getData(id);
	//3. 가입정보를 응답한다.
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/info.jsp</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<jsp:include page="../../include/resource.jsp"></jsp:include>
<style>
	/* 프로필 이미지를 작은 원형으로 만든다 */
	#profileImage{
		width: 75px;
		height: 75px;
		border: 1px solid #cecece;
		border-radius: 50%;
	}
</style>
</head>
<body style="font-family: 'Jua', sans-serif;">
<jsp:include page="../../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>회원 정보 입니다.</h1>
	<table class="table table-striped bg-light">
		<colgroup>
			<col width="150" />
			<col  />
		</colgroup>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>프로필 이미지</th>
			<td>
				<%if(dto.getProfile() == null){ %>
					<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
			  			<path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
					</svg>
				<%}else{ %>
					<img src="${pageContext.request.contextPath }<%=dto.getProfile() %>" 
						id="profileImage"/>
				<%} %>			
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><a class="btn btn-info" href="pwd_updateform.jsp">비밀번호 변경</a></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<th>가입일</th>
			<td><%=dto.getRegdate() %></td>
		</tr>
	</table>
	<a class="btn btn-info" href="updateform.jsp"> 수정</a>  <span></span>
	<a class="btn btn-info" href="javascript:deleteConfirm()">탈퇴</a>
</div>
<script>
	function deleteConfirm(){
		let isDelete=confirm("<%=id %> 회원님 탈퇴 하시겠습니까?");
		if(isDelete){
			location.href="delete.jsp";
		}
	}
</script>
</body>
</html>