<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지사항</h3>
<div class='btnSet flex-end w-900'>
	<a class='btn-fill' href='new.no'>공지글 등록</a>
</div>
<table class='w-900 tb-list'>
<colgroup>
	<col width='80px'>
	<col>
	<col width='160px'>
	<col width='160px'>
	<col width='80px'>
</colgroup>
<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>작성일</th>
	<th>조회수</th>
</tr>
<c:forEach items='${list}' var='vo'>
	<tr>
		<td>${vo.id}</td>
		<td class='click'><a href='info.no?id=${vo.id}'>[공지] ${vo.title}</a></td>
		<td>${vo.writer}</td>
		<td>${vo.write_date}</td>
		<td>${vo.readcnt}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>