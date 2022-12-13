<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>사원목록</h3>

<div class='btnSet flex-end w-900'>
	<a class='btn-fill' href='new.hr'>사원등록</a>
</div>

<div class="tb-wrap w-900">
<table class='tb-list'>
<colgroup>
	<col width='80px'>
	<col width='200px'>
	<col width='180px'>
	<col>
	<col width='140px'>
</colgroup>
<tr>
	<th>사번</th>
	<th>사원명</th>
	<th>부서</th>
	<th>업무</th>
	<th>입사일자</th>
</tr>

<c:forEach items="${list}" var="vo">
<tr>
	<td>${vo.employee_id}</td>
	<td class='click'><a href='info.hr?id=${vo.employee_id}'>${vo.first_name} ${vo.last_name}</a></td>
	<td>${vo.department_name}</td>
	<td>${vo.job_id}</td>
	<td>${vo.hire_date}</td>
</tr>
</c:forEach>


</table>
</div>

</body>
</html>