<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지사항</h3>

<form action='list.no' method='post' style='height:38px; margin:20px auto;' class='mb w-900 flex-between'>
<ul id='list-top' class='flex-start'>
	<li>
		<select class="w-100" name='search' style='height:38px;'>
			<option value='all' ${page.search eq 'all' ? 'selected' : ''}>전체</option>
			<option value='title' ${page.search eq 'title' ? 'selected' : ''}>제목</option>
			<option value='content' ${page.search eq 'content' ? 'selected' : ''}>내용</option>
			<option value='writer' ${page.search eq 'writer' ? 'selected' : ''}>작성자</option>
		</select>
	</li>
	<li><input type='text' class='w-200' name='keyword' value='${page.keyword}'></li>
	<li><a class='btn-fill btn-search' style='border:2px solid dodgerblue; margin-left:1px'>검색</a></li>
</ul>
<div class='btnSet flex-end' style='margin: 0 0 0 150px'>
	<!-- 관리자만 글쓰기 가능 -->
	<c:if test="${loginInfo.admin eq 'Y'}">	
		<a class='btn-fill' href='new.no'>공지글 등록</a>
	</c:if>
</div>
<input type='hidden' name='curPage' value='1'>
</form>

<table class='w-900 tb-list'>
<colgroup>
	<col width='80px'>
	<col>
	<col width='140px'>
	<col width='140px'>
	<col width='80px'>
	<col width='80px'>
</colgroup>
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
	<th>첨부파일</th>
</tr>
<c:forEach items='${page.list}' var='vo'>
	<tr>
		<td>${vo.no}</td>
		<td class='click text-left align-center' style=''>
		<span style="width:${(vo.indent*20)}px"></span>
		<c:if test='${vo.indent gt 0}'>
			<i class="font-b fa-brands fa-replyd"></i>
		</c:if>
			<a href='info.no?id=${vo.id}
				&curPage=${page.curPage}
					&search=${page.search}
						&keyword=${page.keyword}'>[공지] ${vo.title}</a>
		</td>
		<td>${vo.writer}</td>
		<td>${vo.write_date}</td>
		<td>${vo.readcnt}</td>
		<td><c:if test='${!empty vo.filename}'><i class="font-b fa-solid fa-paperclip"></i></c:if></td>
	</tr>
</c:forEach>
</table>

<jsp:include page="/WEB-INF/views/include/page.jsp"/>

<script>

$('.btn-search').click(function(){
	$('form').submit();
});

</script>

</body>
</html>





