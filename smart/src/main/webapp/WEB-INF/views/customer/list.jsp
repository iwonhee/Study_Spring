<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>

<h3>고객목록</h3>

<div class='btnSet flex-end w-600'>
	<a class='btn-fill' href='new.cu'>신규등록</a>
</div>

<table class='tb-list w-600'>
<colgroup>
	<col width='160px'>
	<col width='160px'>
</colgroup>
<tr>
	<th>고객명</th>
	<th>전화번호</th>
	<th>이메일</th>
</tr>
<c:forEach items="${list}" var="vo">
	<tr>
		<td class='click'><a href='info.cu?id=${vo.id}'>${vo.name}</a></td>
		<td>${vo.phone}</td>
		<td>${vo.email}</td>
	</tr>
</c:forEach>
</table>

<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>