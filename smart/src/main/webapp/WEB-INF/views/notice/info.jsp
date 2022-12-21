<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지글</h3>
<%-- ${loginInfo.userid}] [${info.writer} --%>
<div class='btnSet w-800 flex-end'>
	<c:if test="${loginInfo.userid eq info.writer}">	
		<a href='modify.no?id=${info.id}' class='btn-fill'>수정</a>
		<a class='btn-empty notice_delete'>삭제</a>
	</c:if>
</div>
<table class='w-800'>
<colgroup>
	<col width='140px'>
	<col>
	
</colgroup>
<tr>
	<th>제목</th>
	<th colspan='5'>${info.title}</th>
</tr>

<tr>
	<td>${info.id}</td>
	<td>${info.title}</td>
	<td>${info.writer}</td>
	<td>${info.write_date}</td>
	<td>${info.readcnt}</td>
</tr>
</table>
<table class='w-800'>
<tr>
	<th class='w-80'>첨부파일</th>
	<td>${info.filename}
		<c:if test='${!empty info.filename}'>
		<a class='pointer download'><i class="font-b fa-solid fa-file-arrow-down"></i></a>
		</c:if>
	</td>
</tr>
</table>
<div class='content w-800'>${fn: replace(info.content, crlf, '<br>')}</div>

<div class='btnSet'>
	<a href='list.no' class='btn-fill'>돌아가기</a>
</div>

<script>

$('.download').on('click', function(){
	$(this).attr('href', 'download.no?id=${info.id}');
});

$(document).on('click', '.notice_delete', function(){
	
	if(confirm('해당 공지글을 삭제')){
		location='delete.no?id=${info.id}';
	}
	
});

</script>

</body>
</html>