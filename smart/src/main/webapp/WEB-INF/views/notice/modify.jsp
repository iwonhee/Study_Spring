<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>공지글 수정</h3>

<form method='post' action='update.no' autocomplete="off">
<input type='hidden' name='writer' value='admin'>
<input type='hidden' name='id' value='${modify.id}'>
<table class='w-600'>
<colgroup>
	<col width='140px'>
	<col>
</colgroup>
<tr>
	<th>제목</th>
	<td><input type='text' name='title' value='${modify.title}'></td>
</tr>
<tr>
	<th>글내용</th>
	<td><textarea class='in_content' name='content'>${modify.content}</textarea></td>
</tr>
</table>

</form>

<div class='btnSet'>
	<a class='btn-fill' onclick='$("form").submit()'>저장</a>
	<a class='btn-empty' href='list.no'>취소</a>
</div>

</body>
</html>