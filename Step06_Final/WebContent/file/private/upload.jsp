<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Tomcat 서버를 실행했을때 WebContent/upload 폴더의 실제경로 얻어오기
	String realPath=application.getRealPath("/upload");
	System.out.println("realPath:"+realPath);
	
	File f=new File(realPath);
	if(!f.exists()){
		f.mkdir();
	}
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
	//작성자
	String writer=(String)session.getAttribute("id");
	//업로드된 파일의 정보를 FileDto 에 담고
	FileDto dto=new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);
	//DB에저장
	boolean isSuccess=FileDao.getInstance().insert(dto);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>
	<%if(isSuccess){ %>
		<p>
			<%=writer %>님이 업로드한 <%=orgFileName %>파일을 저장했습니다.
			<a href="${pageContext.request.contextPath}/file/list.jsp">목록보기</a>
		</p>
	<%}else{ %>
		<p>
			업로드실패!
			<a href="upload_from.jsp">다시시도</a>
		</p>
	<%} %>
</body>
</html>