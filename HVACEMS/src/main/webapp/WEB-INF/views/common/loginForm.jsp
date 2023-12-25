<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<title>LOGIN</title>
<head>
<style>
body {
	background-image : url('<%=request.getContextPath() %>/resources/img/clean_room_black.png');
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	height: 100vh;
	margin: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.loginTitle {
	justify-content: center;
	margin: 0 0 20px;
}

.loginWrapper {
	width: 400px;
	height: 300px;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: rgba(255, 255, 255, 0.8);
	padding: 20px;
	border-radius: 10px;
}

.loginButton {
	margin: 10px 0 0;
}
</style>
</head>

<body>
	<div>
	   <div class="loginWrapper">
		<div>
		 <div>
		 <div class="loginTitle">
		 	<h3 style="font-weight: bold;">HVACEMS</h3>
		 </div>
			<form action="login.do"	method="post">
				<input name="retUrl" value="${retUrl }" type="hidden" />
				<div class="form-group has-feedback">
					<input type="text" class="form-control" name="adminId" placeholder="아이디를 입력하세요." value="">
					<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" class="form-control" name="adminPwd" placeholder="패스워드를 입력하세요."  value="">
					<span class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<div class="col-sm-3">
					</div>
					<!-- /.col -->
					<div class="col-sm-6 loginButton">
						<button type="submit" class="btn bg-gradient-info btn-block btn-block">로그인</button>
					</div>
					<div class="col-sm-3">
					</div>
					<!-- /.col -->
				</div>
			</form>
			
		</div>
		<!-- /.login-box-body -->
	  </div>	
	</div>
	<!-- /.login-box -->
	
  </div>    

<c:if test="${not empty message }" >
<script>
	alert("${message}");
</script>
</c:if> 
  
</body>
  
  
  
  
  
  
  