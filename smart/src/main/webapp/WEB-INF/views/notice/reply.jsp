<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>답글 작성</h3>

<form method='post' action='reply_insert.no' autocomplete="off" enctype='multipart/form-data'>
<input type='hidden' name='writer' value='${loginInfo.userid}'>
<input type='hidden' name='root' value='${vo.root}'>
<input type='hidden' name='step' value='${vo.step}'>
<input type='hidden' name='indent' value='${vo.indent}'>
<table class='w-800'>
<colgroup>
	<col width='140px'>
	<col>
</colgroup>
<tr>
	<th>제목</th>
	<td><input type='text' name='title' class='ck' title='제목'></td>
</tr>
<tr>
	<th>글내용</th>
<!-- 	<td class='in_content'><input type='text' name='content'></td> -->
	<td><textarea class='in_content ck' name='content' title='내용'></textarea></td>
</tr>
<tr>
	<th>파일첨부</th>
	<td class='text-left align-center border-none h-46'>
	<label>
		<input type='file' name='file' id='attach-file' >
		<a class='pointer'><i class="font-b fa-solid fa-file-arrow-up"></i></a>
	</label>
	<span id='file-name'></span>
	<span id='preview'></span>
	<a id='delete-file'><i class="font-r fa-regular fa-trash-can"></i></a>
	</td>
	
</tr>
</table>

</form>

<div class='btnSet'>
	<a class='btn-fill save'>작성</a>
	<a class='btn-empty' href='list.no'>취소</a>
</div>

<script>

$('.save').click(function(){
	if( emptyCheck() ){
		$('form').submit();
	}
});

</script>

</body>
</html>