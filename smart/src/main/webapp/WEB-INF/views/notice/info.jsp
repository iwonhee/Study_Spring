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
		<a href='modify.no?id=${info.id}&${params}' class='btn-fill'>수정</a>
		<a class='btn-empty notice_delete'>삭제</a>
	</c:if>
</div>
<table class='w-800'>
<colgroup>
	<col width='100px'>
	<col>
	<col width='100px'>
	<col width='140px'>
	<col width='100px'>
	<col>
</colgroup>
<tr>
	<th>제목</th>
	<td colspan='5' class="text-left">${info.title}</td>
</tr>

<tr>
	<th>작성자</th>
	<td class="text-left">${info.writer}</td>
	<th>작성일</th>
	<td>${info.write_date}</td>
	<th>조회수</th>
	<td>${info.readcnt}</td>
</tr>
<tr>
	<th>첨부파일</th>
	<td colspan='5' class='text-left'>${info.filename}
		<c:if test='${!empty info.filename}'>
		<a class='pointer download'><i class="font-b fa-solid fa-file-arrow-down"></i></a>
		</c:if>
	</td>
</tr>
</table>

<div class='content w-800'>${fn: replace(info.content, crlf, '<br>')}</div>

<c:set var='params' value='curPage=${page.curPage}&search=${page.search}&keyword=${page.keyword}'/>

<div class='btnSet'>
	<!-- 로그인한 경우 답글달기 보이기 -->
	<c:if test="${!empty loginInfo}">
		<a class='btn-fill' href='reply.no?id=${info.id}&${params}'>답글쓰기</a>
	</c:if>
	<a href='list.no?${params}' class='btn-fill'>돌아가기</a>
</div>

<script>

$('.download').on('click', function(){
	$(this).attr('href', 'download.no?id=${info.id}&url=' 
			+ $(location).attr('href')); //url주소 넘겨주기
});

$(document).on('click', '.notice_delete', function(){
	
	if(confirm('해당 공지글을 삭제')){
		location='delete.no?id=${info.id}';
	}
	
});

</script>

</body>
</html>