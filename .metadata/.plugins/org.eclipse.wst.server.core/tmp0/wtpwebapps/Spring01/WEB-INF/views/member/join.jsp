<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원가입</h3>

<form action="joinRequest" autocomplete="off" method="post">
	<div>성명 : <input type='text' name='name'></div>
	<div>성별 : 
		<input type='radio' name='gender' value='남' checked>남
		<input type='radio' name='gender' value='여'>여
	</div>
	<div>이메일 : <input type='text' name='email'></div>
	<div><input type='submit' value='HttpServletRequest'></div>
</form>

</body>
</html>