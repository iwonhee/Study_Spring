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
<h3>사원정보</h3>

<table class='w-600'>
<tr><th class='w-140'>사번</th><td>${vo.employee_id}</td></tr>
<tr><th>이름</th><td>${vo.name}</td></tr>
<tr><th>이메일</th><td>${vo.email}</td></tr>
<tr><th>전화번호</th><td>${vo.phone_number}</td></tr>
<tr><th>부서</th><td>${vo.department_name eq null ? '부서없음' : vo.department_name}</td></tr>
<tr><th>업무</th><td>${vo.job_title}</td></tr>
<tr><th>급여</th><td><fmt:formatNumber value='${vo.salary}'/> </td></tr>
<tr><th>입사일</th><td>${vo.hire_date}</td></tr>
</table>

<div class="btnSet">
	<a href='list.hr' class='btn-fill'>목록</a>
	<a href='modify.hr?id=${vo.employee_id}' class='btn-fill'>수정</a>
	<a class='btn-empty emp_delete'>삭제</a>
</div>

<script>
// 삭제 묻기
$(document).on('click', '.emp_delete', function(){
	if( confirm('사원 [${vo.name}] 삭제') ){
		location = 'delete.hr?id=${vo.employee_id}';
	}
});

</script>

</body>
</html>