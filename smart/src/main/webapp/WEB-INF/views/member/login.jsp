<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class='center'>
	<a href='<c:url value="/"/>'><img src='img/hanul.logo.png'></a>
	<ul class='box'>
		<li><input type='text' id='userid' placeholder='아이디' class='ck'></li>
		<li><input type='password' id='userpw' placeholder='비밀번호' class='ck'></li>
		<li><input type='button' value='로그인' class='login'></li>
		<li><hr style='margin:20px 0 '></li>
		<li><input type='button' class='naver social' id='naver'></li>
		<li><input type='button' class='kakao social' id='kakao'></li>
	</ul>
	<div><a href='find'>비밀번호찾기</a></div>
</div>
<script>

/* function emptyCheck(){
	var ok = true;
	$('.ck').each(function(){
		if( $.trim($(this).val()) ==''){
			var title = $(this).attr('placeholder');	
			alert(title + '입력하세요');
			$(this).focus();
			ok = false;
			return ok;
		}
	});
	return ok;
} */

$('.login').click(function(){
	login();
});
$('#userpw').keydown(function(e){
	if(e.keyCode == 13) login();
});

// ajax통신으로 로그인
function login(){
	if(emptyCheck()){
		$.ajax({
			url: 'smartLogin',
			data: { userid : $('#userid').val(), 
					userpw : $('#userpw').val() },
			success : function( response ){
				if( response ){
					
					location = '<c:url value="/"/>';
				}else{
					alert('로그인 정보가 잘못 됐습니다')
				}
			}, error: function(req, text){
				alert(text+':'+req.status);
			}
		});
	}
}

</script>
</body>
</html>