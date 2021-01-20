<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload_form.jsp</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>
<body style="font-family: 'Jua', sans-serif; text-align:center;">
<a href="${pageContext.request.contextPath}/index.jsp"><img src="../../images/yellowbird.png" /></a>
<div class="container" >
	
	<h1>파일 업로드 폼입니다</h1>
	<!--
		파일업로드 폼 작성법
		1.method="post"
		2.enctype="multipart/form-data"
		3.<input type="file"/>
		- enctype="multipart/form-data" 가 설정된 폼을 전송하면
		폼 전송된 내용을 추출할때 HttpServletRequest 객체로 추출을 할수 없다
		MultipartRequest 객체를 이용해서 추출해야한다
	-->
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
		<div>
			<label for="title">제목</label>
			<input type="text" name="title" id="title" />
		</div>
		<div>
			<label for="myFile">첨부파일</label>
			<input type="file" name="myFile" id="myFile" />
		</div>
		<button type="submit">업로드</button>
	</form>
</div>
</body>
</html>