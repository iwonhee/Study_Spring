<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<style>
table td { text-align: left; padding: 5px 0 5px 10px;}
p { width: 600px; text-align: right; margin: 10px auto; color: #ff0000; }
form span { color: #ff0000; margin-right:5px }
[name=address] {margin-top: 3px }
.ui-datepicker td{height:inherit;}
input[type=text]{width:60%; height:24px;}
input[type=password]{
 	height:24px;
	padding:2px 10px;
	width:60%;
	font-size:16px;
}
#post{width:100px; padding:2px 8px; display:inline}
.w-80{width:60px !important; padding:2px 10px; height:24px;}

#btn-userid{
	padding:2px 10px;
	
	text-align:center;
}
</style>
</head>
<body>
<h3>회원가입</h3>

<p>*는 필수입력항목입니다</p>
<!-- 
	파일 업로드하기 위한 form 태그 주의사항
	post로 보내야함
	enctype='nultipart/form-data'
 -->
<form method='post' action='join' enctype='multipart/form-data'>
<table class='w-px600'>
<tr><th class='w-px140'><span>*</span>성명</th>
	<td><input type='text' name='name' autofocus></td>
</tr>
<tr><th><span>*</span>아이디</th>
	<td>
		<input type='text' name='userid' class='chk'>
		<a class='btn-fill w-100' id='btn-userid'>중복확인</a>
		
		<div class='valid'>아이디를 입력하세요(영문소문자,숫자만)</div>
	</td>
</tr>
<tr><th><span>*</span>비밀번호</th>
	<td><input type='password' name='userpw' class='chk'>
		<div class='valid'>비밀번호를 입력하세요(영문대/소문자,숫자 모두 포함)</div>
	</td>
</tr>
<tr><th><span>*</span>비밀번호확인</th>
	<td><input type='password' name='userpw_ck' class='chk'>
		<div class='valid'>비밀번호를 다시 입력하세요</div>
	</td>
</tr>
<tr><th>프로필이미지</th>
	<td><div class='align-center'>
		<label>
			<input type='file' id='attach-file' accept='image/*' name='profile_image'>
			<a class='pointer'><i class="font-b fa-solid fa-address-card"></i></a>
		</label>
		<span id='preview'></span>
		<a id='delete-file' class='pointer'><i class="font-b fa-solid fa-trash-can"></i></a>
	</div></td>
</tr>
<tr><th><span>*</span>성별</th>
	<td><label><input type='radio' name='gender' value='남' checked>남</label>
		<label><input type='radio' name='gender' value='여'>여</label>
	</td>
</tr>
<tr><th><span>*</span>이메일</th>
	<td><input type='text' name='email' class='chk'>
		<div class='valid'>이메일을 입력하세요</div>
	</td>
</tr>
<tr><th>생년월일</th>
	<td>
		<input type='text' name='birth' class='date' readonly>
		<a id='delete' class='pointer'><i class="font-b fa-solid fa-calendar-xmark"></i></a>
	</td>
</tr>
<tr><th>전화번호</th>
	<td><input type='text' name='phone' maxlength="13"></td>
</tr>
<tr><th>주소</th>
	<td>
		<div>
			<a class='btn-fill' id='post'>우편번호찾기</a>
			<input type='text' name='post' class='w-80' readonly>
		</div>
		<input type='text' name='address' class='full' readonly>
		<input type='text' name='address' class='full'>
	</td>
</tr>
</table>
</form>

<div class='btnSet'>
	<a class='btn-fill join'>회원가입</a>
	<a class='btn-empty' href='<c:url value="/"/>'>취소</a>
</div>

<script src='js/member.js?<%= new java.util.Date()%>'></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$('.join').click(function(){
	if($.trim($('[name=name]').val())==''){
		alert('성명을 입력하세요');
		$('[name=name]').focus();
		$('[name=name]').val('');
		return;
	}
	//유효성확인
	//중복확인 했고 이미 사용중인 경우 가입불가
	//중복확인 하지 않은 경우 가입불가
	var _userid = $('[name=userid]');
	if( _userid.hasClass('chked')){
		if( _userid.siblings('div').hasClass('invalid') ){
			alert('회원가입 불가!\n' + member.userid.unUsable.desc);
			_userid.focus();
			return;
		}
	}else{
		//유효하지 않게 입력해서 회원가입 불가
		if( IsTagInvalid( _userid ) ) return;
		else{
			//중복확인하지 않아서 회원가입 불가
			alert('회원가입 불가\n'+ member.userid.valid.desc);
			_userid.focus();
			return;
		}
	}
	
	if( IsTagInvalid( $('[name=userpw]') ) ) return; //유효하지 않으면 리턴
	if( IsTagInvalid( $('[name=userpw_ck]') ) ) return; //유효하지 않으면 리턴
	if( IsTagInvalid( $('[name=email]') ) ) return; //유효하지 않으면 리턴
	$('form').submit();
});
//유효성확인
function IsTagInvalid( tag ){
	var status = member.tag_status( tag );
	if( status.code=='invalid' ){
		alert('회원가입 불가\n'+ status.desc);
		tag.focus();
		return true;
	}else{
		return false;
	}
		
}

// 아이디 중복확인
$('#btn-userid').click(function(){
	idCheck();
});
function idCheck(){
	var $userid = $('[name=userid]');
	// 이미 중복확인 했다면 재확인 불필요
	if( $userid.hasClass('chked') ) return;
	
	var status = member.tag_status( $userid );
	if( status.code == 'invalid' ){
		alert('아이디 중복확인 불필요!/n'+ status.desc);
		$userid.focus();
	}else{
		//아이디 중복확인 처리 $ajax 통신
		$.ajax({
			url: 'idCheck',
			data: { id: $userid.val() },
			success: function( response ){
				//true : 아이디 존재
				status = response ? member.userid.unUsable : member.userid.usable;
				$userid.siblings('div').text( status.desc ).removeClass().addClass( status.code );
				//아이디 중복확인 완료 지정
				$userid.addClass('chked');
			},error: function(req, text){
				alert(text + ':' + req.status);
			}
			
		});
	}
};

//
$('.chk').keyup(function(e){
	if( $(this).attr('name')=='userid' && e.keyCode == 13 ){	//아이디에서 Enter입력시 중복확인처리
		idCheck();
	}else{		
		$(this).removeClass('chked');
		var status = member.tag_status( $(this) );
		console.log(status);
		$(this).siblings('div').text( status.desc ).removeClass().addClass( status.code );
	}
});

// 프로필 이미지 지우기 버튼
$('#delete-file').click(function(){
	$('#attach-file').val(''); 		// 첨부한 파일정보 없애기
	$(this).css('display', 'none') 	// 삭제버튼 안 보이게
	$('#preview').html('');			// 이미지 안 보이게(1)
// 	$('#preview img').remove();		// 이미지 안 보이게(2)
});

// 날짜변경시 삭제버튼 나오게
$('.date').change(function(){
	$(this).next().css('display', 'inline');
});
// 날짜삭제 버튼 클릭시 날짜 없애고, 날짜삭제 버튼 사라지게
$('#delete').click(function(){
	$(this).css('display', 'none');
	$(this).siblings('.date').val('');
});

//생년월일 특정날짜(만13세)까지만 선택가능하도록 제한
var today = new Date();
var endDay = new Date( today.getFullYear() - 13, today.getMonth(), today.getDate() - 1 );
var range = today.getFullYear() - 80 + ':' + endDay.getFullYear();

$('.date').datepicker({
	yearRange: range,
	maxDate : endDay,
});

$('#post').click(function(){
	//다음 우편번호찾기 api로 우편번호와 기본주소를 조회해온다.
	new daum.Postcode({
		oncomplete: function(data) {
			console.log( data )
			$('[name=post]').val( data.zonecode );
			var address = data.userSelectedType == 'R' ? data.roadAddress : data.jibunAddress;
			if( data.buildingName != '') address += ' ('+data.buildingName+')';
			$('[name=address]').eq(0).val( address );
		}
    }).open();
});
</script>
</body>
</html>

