<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<style>
	header{
		border-bottom:1px solid #ccc;
		display:flex;
		justify-content:center;
		align-items: center;
		column-gap:10px;
	}
	header nav{display:flex; justify-content:center;}
</style>
<header>
<br>
	<nav>
		<ul class='menu'>
			<li><a href='<c:url value="/"/>'><img src='img/hanul.logo.png' class='menu_logo'></a></li>
			<li><a href="list.cu" ${category eq 'cu' ? 'class="active"' : ''}>고객관리</a></li>
			<li><a href="list.hr" ${category eq 'hr' ? 'class="active"' : ''}>사원관리</a></li>
			<li><a href="list.no" ${category eq 'no' ? 'class="active"' : ''}>공지사항</a></li>
			<li><a href="">방명록</a></li>
			<li><a href="">공공데이터</a></li>
			<li><a href="">시각화</a></li>
		</ul>
	</nav>
	<div>
		<ul class='login_ul'>
			<!-- 로그인하지 않은 경우 -->
			<c:if test='${empty loginInfo}'>
			<li><a class='btn-fill' href='login'>로그인</a></li>
			<li><a class='btn-fill' href='member'>회원가입</a></li>
			</c:if>
			<!-- 로그인한 경우 -->
			<c:if test="${not empty loginInfo}">
				<c:if test='${empty loginInfo.profile}'>
					<li><i class="font-profile fa-regular fa-circle-user"></i></li>					
				</c:if>
				<c:if test='${not empty loginInfo.profile}'>
					<li><img class='profile' src='${loginInfo.profile}'></li>
				</c:if>
				<li><strong>${loginInfo.name}</strong></li>
				<li><a class='btn-fill' href='changePW' >비밀번호변경</a></li>
				<li><a class='btn-fill' href='logout'>로그아웃</a></li>
			</c:if>
		</ul>
	</div>
</header>