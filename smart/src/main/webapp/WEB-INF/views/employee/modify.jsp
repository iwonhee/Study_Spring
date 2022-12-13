<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
input[name=employee_id]{
	border:none;
	text-align:center;
}
</style>
</head>
<body>
<h3>사원정보수정</h3>
<form action="update.hr" method="post" autocomplete="off">

<table class='w-400'>
<tr>
	<th class='w-140'>사번</th>
	<td>
	<input type='text' name='employee_id' value='${vo.employee_id}' readonly>
	</td>
</tr>
<tr>
	<th>First Name</th>
	<td><input type='text' name='first_name' value='${vo.first_name}'></td>
</tr>
<tr>
	<th>Last Name</th>
	<td><input type='text' name='last_name' value='${vo.last_name}'></td>
</tr>
<tr>
	<th>이메일</th>
	<td><input type='text' name='email' value='${vo.email}'></td>
</tr>
<tr>
	<th>전화번호</th>
	<td><input type='text' name='phone_number' value='${vo.phone_number}'></td>
</tr>
<tr>
	<th>부서</th>
	<td>
		<select name='department_id'>
		<option value='-1'>부서선택</option>
		<c:forEach items='${dept_list}' var='dl'>
			<option value='${dl.department_id}' 
				<c:if test='${vo.department_id eq dl.department_id}'>selected</c:if>
			>${dl.department_name}</option>
		</c:forEach>
		</select>
	</td>	
</tr>
<tr>
	<th>업무</th>
	<td>
		<select name='job_id'>
		<c:forEach items='${jobs_list}' var='j'>
			<option value='${j.job_id}' 
				<c:if test='${vo.job_id eq j.job_id}'>selected</c:if>
			>${j.job_title}</option>
		</c:forEach>
		</select>
	</td>
</tr>
<tr>
	<th>급여</th>
	<td><input type='text' name='salary' value='${vo.salary}'></td>
</tr>
<tr>
	<th>입사일</th>
	<td><input type='date' name='hire_date' value='${vo.hire_date}'></td>
</tr>
</table>

</form>

<div class="btnSet">
	<!-- href='javascript:$("form").submit()' 도 가능 -->
	<a class='btn-fill' onclick='$("form").submit()'>저장</a>
	<a class='btn-empty' href='info.hr?id=${vo.employee_id}'>취소</a>
</div>

</body>
</html>