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
	
	<div class='menu'>
		<input type='submit' value='HttpServletRequest'>
		<input type='submit' value='RequestParam' onclick='action="joinParam"'>
		<input type='submit' value='데이터객체' onclick='action="joinDataObject"'>
		<input type='submit' value='@PathVariable' onclick='fn_submit( this.form )'>
	</div>
</form>
<script>
function fn_submit( f ){
	// action="joinPath/name/gnder/lskehflsk"
	f.action = "joinPath/" + f.name.value + "/" + f.gender.value + "/" + f.email.value;
}
</script>
</body>
</html>






