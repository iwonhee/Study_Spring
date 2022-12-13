<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>사원등록</h3>
<form action='insert.hr' method='post' autocomplete="off">
<table class='w-400'>
<tr>
	<th class='w-140'>First Name</th>
	<td><input type='text' name='first_name'></td>
</tr>
<tr>
	<th>last Name</th>
	<td><input type='text' name='last_name'></td>
</tr>
<tr>
	<th>Email</th>
	<td><input type='text' name='email'></td>
</tr>
<tr>
	<th>연락처</th>
	<td><input type='text' name='phone_number'></td>
</tr>
<tr>
	<th>부서</th>
	<td><select name='department_id'>
		<option value='-1'>부서없음</option>
		<c:forEach items='${dept_list}' var='d'>
			<option value='${d.department_id}'>${d.department_name}</option>
		</c:forEach>
	</select></td>
</tr>
<tr>
	<th>업무</th>
	<td><select name='job_id'>
		<c:forEach items='${jobs_list}' var='j'>
			<option value='${j.job_id}'>${j.job_title}</option>
		</c:forEach>
	</select></td>
</tr>
<tr>
	<th>급여</th>
	<td><input type='text' name='salary'></td>
</tr>
<tr>
	<th>입사일</th>
	<td><input type='date' name='hire_date'></td>
</tr>
</table>
</form>

<div class="btnSet">
	<!-- href='javascript:$("form").submit()' 도 가능 -->
	<a class='btn-fill' onclick='$("form").submit()'>저장</a>
	<a class='btn-empty' href='list.hr'>취소</a>
</div>

</body>
</html>