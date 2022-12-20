<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지글</h3>

<div class='btnSet w-800 flex-end'>
	<c:if test="${loginInfo.userid eq vo.writer}">	
		<a href='modify.no?id=${info.id}' class='btn-fill'>수정</a>
		<a class='btn-empty notice_delete'>삭제</a>
	</c:if>
</div>
<table class='w-800'>
<colgroup>
	<col width='80px'>
	<col>
	<col width='140px'>
	<col width='140px'>
	<col width='80px'>
</colgroup>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
<tr>
	<td>${info.id}</td>
	<td>${info.title}</td>
	<td>${info.writer}</td>
	<td>${info.write_date}</td>
	<td>${info.readcnt}</td>
</tr>
</table>
<div class='content w-800'>${info.content}</div>

<div class='btnSet'>
	<a href='list.no' class='btn-fill'>돌아가기</a>
</div>

<script>

$(document).on('click', '.notice_delete', function(){
	
	if(confirm('해당 공지글을 삭제')){
		location='delete.no?id=${info.id}';
	}
	
});

</script>

</body>
</html>