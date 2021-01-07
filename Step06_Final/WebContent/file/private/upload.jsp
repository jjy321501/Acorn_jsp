<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Tomcat 서버를 실행했을때 WebContent/upload 폴더의 실제경로 얻어오기
	String realPath=application.getRealPath("/upload");
	System.out.println("realPath:"+realPath);
	
	//최대 업로드사이즈 설정
	int sizeLimit=1024*1024*50; //50 Mbyte
	/*
		WEB-INF/lib/cos.jar 라이브러리가 있으면 아래의 객체를 생성할수 있다
		
		new MultipartRequest(HttpServletRequest 객체,
				업로드된 파일을 저장할경로,
				최대 업로드 사이즈 제한,
				DefaultFilterRenamePolicy 객체)
	*/
	//<form enctype="multipart/form-data">로 전송된 값은 아래의 객체를 이용해서 추출한다.
	MultipartRequest mr=new MultipartRequest(request,
				realPath,
				sizeLimit,
				"utf-8",
				new DefaultFileRenamePolicy());	
	
	//폼전송된 내용 추출하기
	String title=mr.getParameter("title");
	String orgFileName=mr.getOriginalFileName("myFile");
	String saveFileName=mr.getFilesystemName("myFile");
	long fileSize=mr.getFile("myFile").length();
	System.out.println("title:"+title);
	System.out.println("orgFileName:"+orgFileName);
	System.out.println("saveFileName:"+saveFileName);
	System.out.println("fileSize:"+fileSize);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>

</body>
</html>