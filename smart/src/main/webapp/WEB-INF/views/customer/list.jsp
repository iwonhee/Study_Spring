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
<tr>
	<td></td>
	<td></td>
	<td></td>
</tr>
</table>

<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>