<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#tabs{display:flex; border-bottom: 1px solid dodgerblue; }
#tabs li{
	width:140px;
	line-height:40px;
	color:dodgerblue;
	border:1px solid dodgerblue;
	border-bottom: none;
	cursor:pointer;
}
#tabs li:not(:first-child){
	border-left:none;
}
#tabs li.active{
	background-color:dodgerblue;
	color:#fff;
}
#tab-content{width:1100px; height:550px; margin:20px auto;}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.16.0/d3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.min.js"></script>
</head>
<body>
<h3>시각화</h3>

<div class='w-1100 margin-center'>
<ul id='tabs'>
	<li>부서원수</li>
	<li>채용인원수</li>
</ul>
</div>

<div id='tab-content'>
	<div id='graph'></div>
</div>


<script>
$(function(){
	
//탭 선택
$('#tabs li').on('click', function(){
	if( $(this).hasClass('active') ) return; //현재 선택된 탭인 경우
	$('#tabs li').removeClass('active');
	$(this).addClass('active');
	
	var idx = $(this).index();
	if( idx == 0 ) department();
	else		   hirement();
	
});

//클릭이벤트 강제발생
$('#tabs li').eq(0).trigger('click');

//부서원수 시각화
function department(){
	
	$.ajax({
		url: 'visual/department',
		success: function( response ){
			console.log(response);
			var count = [ '부서원수' ];
			var name = [ '부서명' ];
			$(response).each(function(){
				count.push( this.COUNT );
				name.push( this.DEPARTMENT_NAME );
			});
			console.log(count);
// 			make_chart( new Array( count ) );
			make_chart( [ name, count ] );
		}
	});
	
	
};

//채용인원수(연도별/월별) 시각화
function hirement(){
	
};
	
//그래프 그리기
function make_chart(info){
	var chart = c3.generate({
		bindto: '#graph',
	    data: {
// 	        columns: [ ['부서원수', 50, 20, 10, 40, 15, 25] ]
			columns: info,
			x: '부서명',
	    },
	    axis: {
	        x: {
	            type: 'category'
	        }
	    }
	});
}
	
})
</script>

</body>
</html>