<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>방명록 글쓰기</h3>

<form method='post' action='insert.bo' enctype='multipart/form-data'>

<table class='w-1000'>
<tr>
	<th class='w-140'>제목</th>
	<td><input type='text' name='title' class='ck' title='제목'></td>
</tr>
<tr>
	<th>내용</th>
	<td><textarea name='content' class='in_content ck' title='내용'></textarea></td>
</tr>
<tr>
	<th>첨부파일</th>
	<td class='text-left' style='height:46px; border:none'>
	<div class='atta align-center'>
		<label>
			<input type='file' name='file' class='attach-file' >
			<a class='pointer'><i class="font-b fa-solid fa-file-arrow-up"></i></a>
		</label>
		<span class='file-name'></span>
		<span class='preview'></span>
		<a class='delete-file'><i class="font-r fa-regular fa-trash-can"></i></a>
	</div>
	</td>
</tr>
</table>
<input type='hidden' name='writer' value='${loginInfo.userid}'>

</form>

<div class='btnSet'>
	<a class='btn-fill save'>저장</a>
	<a class='btn-empty cancel'>취소</a>
</div>

<script>

$('.save').click(function(){
	if( emptyCheck() ){		
		$('form').submit();
	}
});

$('.cancel').click(function(){
	history.go(-1);
});

</script>

</body>
</html>