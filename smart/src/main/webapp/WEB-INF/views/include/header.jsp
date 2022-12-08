<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<link href='css/common.css?<%= new java.util.Date() %>' rel='stylesheet' type='text/css'>
<script type='text/javascript' src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	
	header{
		border-bottom:1px solid #ccc;
	}
	header nav{display:flex; justify-content:center;}
	
</style>
<header>

<nav>
	<ul class='menu'>
		<li><a href="list.cu" ${category eq 'cu' ? 'class="active"' : ''}>고객관리</a></li>
		<li><a href="list.hr" ${category eq 'hr' ? 'class="active"' : ''}>사원관리</a></li>
		<li><a href="">공지사항</a></li>
		<li><a href="">방명록</a></li>
		<li><a href="">공공데이터</a></li>
		<li><a href="">시각화</a></li>
	</ul>
</nav>

</header>