<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>방명록 목록</h3>

<form method='post' action='list.bo' autocomplete="off">
<div id='list-top' class='w-1000 flex-between margin-center'>
<ul>
	<li><select name='search' class='w-100'>
		<option value='all'>전체</option>
		<option value='title'>제목</option>
		<option value='content'>내용</option>
		<option value='writer'>작성자</option>
	</select>
	<li><input type='text' name='keyword' class='w-300' value='${page.keyword}'></li>
	<li><a class='btn-fill'>검색</a></li>
</ul>
<ul>
	<li>
	<select name='pageList' class='w-100'>
		<c:forEach var='i' begin='1' end='6'>
		<option ${page.pageList eq i*5 ? 'selected' : ''} value='${i*5}'>${5*i}개씩</option>
		</c:forEach>
	</select>
	</li>
	<li>
	<select name='viewType' class='w-100'>
		<option value='list'>리스트</option>
		<option value='grid'>그리드</option>
	</select>
	</li>
	<!-- 로그인한 경우 글쓰기 가능 -->
	<c:if test='${not empty loginInfo}'>
		<li><a class='btn-fill' href='new.bo'>글쓰기</a></li>
	</c:if>
</ul>
</div>

<c:if test="${page.viewType eq 'list'}">
<table class='w-1000 tb-list'>
<colgroup>
	<col width='100px'>
	<col>
	<col width='140px'>
	<col width='140px'>
</colgroup>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
</tr>
<c:if test='${empty page.list}'>
	<tr><td colspan='5'>검색결과가 없습니다</td></tr>
</c:if>
<c:forEach items="${page.list}" var="vo">
	<tr>
		<td>${vo.no}</td>
		<td class='click text-left text-over'>
			<a onclick="fn_submit( ${vo.id} )">${vo.title}
			<c:if test='${vo.fileCount gt 0}'><i class="font-b fa-solid fa-paperclip"></i></c:if>
			</a>
		</td>
		<td>${vo.name}</td>
		<td>${vo.writedate}</td>
	</tr>
</c:forEach>
</table>
</c:if>
<c:if test='${page.viewType eq "grid"}'>
<ul class='grid w-1000'>
<c:forEach items='${page.list}' var='vo'>
	<li class='li_click'>
		<div><a class='grid_click' data-id='${vo.id}'>${vo.title}</a></div>
		<div>${vo.name}</div>
		<div>${vo.writedate}<c:if test='${vo.fileCount gt 0}'><span style='width:20px; float:right;'><i class="font-b fa-solid fa-paperclip"></i></span></c:if></div>
	</li>
</c:forEach>
</ul>
</c:if>
<input name='curPage' value='1' type='hidden'>
<input name='id' type='hidden'>
</form>

<div class='btnSet'>
	<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>

<script>

$('.li_click').on('click', function(){
	fn_submit( $(this).children().children('.grid_click').data('id') );
});

function fn_submit( id ){
	
	$('[name=curPage]').val( ${page.curPage} );
	$('[name=id]').val( id );
	$('form').attr('action', 'info.bo');
	$('form').submit();
}

$(function(){
	$('[name=search]').val( '${page.search}' );
	$('[name=viewType]').val( '${page.viewType}' );
});



$('.btn-search').on('click', function(){
	$('form').attr('action', 'list.bo');
	$('form').submit();
});

$('[name=pageList], [name=viewType]').on('change', function(){
	$('form').attr('action', 'list.bo');
	$('form').submit();
});

</script>

</body>
</html>