<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/users/signup_form.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>회원가입 폼입니다</h1>
	<form action="signup.jsp" method="post" id="myForm">
		<div class="form-group">
			<label for="id">아이디</label>
			<input class="form-control" type="text" name="id" id="id" />
		</div>
		<div class="form-group">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" name="pwd" id="pwd" />	
			<div class="invalid-feedback">비밀번호를 확인하세요</div>
		</div>
		<div class="form-group">
			<label for="pwd2">비밀번호 확인</label>
			<input class="form-control" type="password" id="pwd2" />	
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input class="form-control" type="email" name="email" id="email" />
		</div>
		<button class="btn btn-outline-primary"type="submit">가입</button>
	</form>
</div>
<script>
	//폼에 submit 이벤트가 일어났을때 jquery 를 활용해서 폼에 입력한 내용 검증하기
	
	//id 가 myForm인 요소에 submit 이벤트가 일어 났을때 실행할 함수등록
	$("#myForm").on("submit",function(){
		//입력한 두 비밀번호를 읽어와서 다르게 입력했으면 폼 전송막기
		let pwd1=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		if(pwd1 != pwd2){
			alert("비밀번호를 확인하세요");
			return false; //폼전송 막기(jquery)
		}
	});
	//id 가 pwd와  pwd2 인 요소에 input(입력) 이벤트가 일어났을때 실행할 함수 등록
	$("#pwd, #pwd2").on("input",function(){
		//console.log("input!");
		
		//입력한 두 비밀번호를 읽어온다
		let pwd=$("#pwd").val();
		let pwd2=$("#pwd2").val();
		//일단 두가지 클래스 다 삭제
		$("#pwd").removeClass("is-valid is-invalid");
		//둘이 같은지 확인해서
		if(pwd==pwd2){//같으면
			//유효하다는 클래스 추가
			$("#pwd").addClass("is-valid");
		}else{//다르면
			//유효 않다는 클래스 추가
			$("#pwd").addClass("is-invalid")
		}
	})
</script>
</body>
</html>