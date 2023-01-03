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

.c3-chart-arc text, .c3-axis, .c3-chart{ font-size:15px !important }

#legend{ display: flex; justify-content: center; }
#legend li { display:flex; align-items: center; }
/* #legend>li { column-gap:30px } */
#legend li:not(first-child){margin-left:30px;}
.legend { width:15px; height:15px; margin-right:5px;}

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
	<div class='tab'>
		<label><input type='radio' name='graph' value='bar' checked>막대그래프</label>
		<label><input type='radio' name='graph' value='donut'>도넛그래프</label>
	</div>
	<div class='tab'>
		<label><input type='checkbox' id='top3'>TOP3부서</label>
		<label><input type='radio' name='unit' value='year' checked>년도별</label>
		<label><input type='radio' name='unit' value='month'>월별</label>
	</div>
	<div id='graph'></div>
	<ul id='legend'>
		<li><span class='legend'></span><span>0~9명</span></li>
		<li><span class='legend'></span><span>10~19명</span></li>
		<li><span class='legend'></span><span>20~29명</span></li>
		<li><span class='legend'></span><span>30~39명</span></li>
		<li><span class='legend'></span><span>40~49명</span></li>
		<li><span class='legend'></span><span>50명이상</span></li>
	</ul>
</div>


<script>
$(function(){
	
	function init(){
		$('#graph').empty();
		$('#legend').css('display', 'none');
	}
	
	$('[name=graph]').on('change', function(){
		department();
	});
	
	
	
	
	//탭 선택
	$('#tabs li').on('click', function(){
		if( $(this).hasClass('active') ) return; //현재 선택된 탭인 경우
		$('#tabs li').removeClass('active');
		$(this).addClass('active');
		
		var idx = $(this).index();
		$('.tab').css('display', 'none');
		$('.tab').eq(idx).css('display', 'block');
		
		if( idx == 0 ) department();
		else		   hirement();
		
	});

	//클릭이벤트 강제발생
	$('#tabs li').eq(1).trigger('click');
// 	$('.legend').each(function(idx){
// 		$(this).css('background-color', colors[idx]);
// 	});

	//부서원수 시각화
	function department(){
		init();
		$.ajax({
			url: 'visual/department',
			success: function( response ){
				console.log(response);
				var count = [ '부서원수' ];
				var name = [ '부서명' ];
				var info = [];
				$(response).each(function(){
					count.push( this.COUNT );
					name.push( this.DEPARTMENT_NAME );
					info.push( new Array(this.DEPARTMENT_NAME, this.COUNT) );
				});
				console.log('info', info);
	// 			make_chart( new Array( count ) ); //선그래프
// 				make_chart( [ name, count ] );	//선, 막대 그래프 
	// 			make_chart( info ); 	//파이, 도넛 그래프
				if( $('[name=graph]:checked').val()=='bar' ){
					bar_chart( [ name, count ] );
				}else{
					donut_chart( info );
				}
			}
		});
	};
	
	//채용인원수(연도별/월별) 시각화
	function hirement(){
		init();
		
		if( $('#top3').prop('checked') ) hirement_top3();
		else hirement_all();
	}
	
	function hirement_top3(){
		var unit = $('[name=unit]:checked').val();
		$.ajax({
			url: 'visual/hirement/top3/' + unit,
			success: function(response){
				console.log(response);
				var info = [];
				if( unit == 'year' ){					
					//연별
					info.push( ['부서명', '2001','2002','2003','2004','2005','2006','2007','2008','2009','2010'] );
					$(response).each(function(){
						info.push( new Array( this.DEPARTMENT_NAME, this.Y2001,this.Y2002,this.Y2003,this.Y2004,this.Y2005,this.Y2006,this.Y2007,this.Y2008,this.Y2009,this.Y2010, ) );
					});
				}else{
					//월별
				}
				
				c3.generate({
					bindto: '#graph',
					data: {columns: info, x:'부서명'
							, type: unit=='year'?'bar':'line', labels:true
					},
					axis: { x: 'category' }
				});
			}
		});
	}
	
	function hirement_all(){
			
		var unit = $('[name=unit]:checked').val();
		$.ajax({
			url: 'visual/hirement/' + unit,
			success: function( response ){
// 				console.log( response ); //데이터 확인
				var name = [ unit ], count = [ '채용인원수' ];
				$(response).each(function(){
					name.push( this.UNIT );
					count.push( this.COUNT );
				});
				make_chart_hirement( [name, count] );
				
			},error: function( req, text ){
				alert(text + ":" + req.status);
			}
		});
	};
	
	function make_chart_hirement(info){
		c3.generate({
			bindto: '#graph',
			data: { columns: info, type:'bar', labels:true, 
				x: $('[name=unit]:checked').val(),	
				color: function(c, d){ return colors[ Math.floor(d.value/10) ]; }
			},
			axis:{
				x: { type: 'category' },
				y: { label: { text: info[1][0], position:'outer-top' } }
			},
			bar: { width:30 },
			size: { height:450 },
			grid: { y: {show:true} },
			legend: { hide:true },
		});
		$('#legend').css('display', 'flex');
	}
	
	$('[name=unit], #top3').change(function(){
		hirement();
	});
	
	//그래프 그리기
	function make_chart(info){
		//1. 선 그래프
	// 	line_chart(info);
		//2. 파이 그래프
	// 	pie_chart(info);
		//3. 도넛 그래프
	// 	donut_chart(info);
		//4. 막대 그래프
		bar_chart(info);
	}

	//막대 그래프
	function bar_chart(info){
		c3.generate({
			bindto: '#graph',
			data: { columns: info, type:'bar', x: '부서명', labels:true,
				color: function(color, data){
	// 				return colors[ data.index ];
					return colors[ Math.floor(data.value/10) ]; //데이터 범위별로 색 변경
				}	
			},
			axis:{
				x: {type: 'category', tick: {rotate:-20} },
				y: {label: { text: info[1][0], position:'outer-top' }}
			},
			size:{ height: 450 },
			bar : { width:30 },
			padding: { bottom : 50 },
			grid: { y: { show:true } },
			legend: {hide:true},
		});
		$('#legend').css('display', 'flex');
	}

	var colors = [ '#fcba03','#fc3d03','dodgerblue','#3388ff','#8000ff','#f21bcb'
		, '#b8caf2', '#f2ceb8', '#b8bcf2', '#40913d', '#6f3d91', '#e6aecc', '#f7f6c1' ];

	//도넛 그래프
	function donut_chart(info){
		c3.generate({
			bindto: '#graph',
			data: { columns: info, type:'donut' },
			size: { height:450 },
			padding: { bottom:50 },
			donut: {
				label:{
					format: function(v, r, id){
						return ( r * 100 ).toFixed(1) + '%('+ v +'명)';
					}
				}
			},
	// 		width: 100,
			title: '부서원수',
		});
	}

	//파이 그래프
	function pie_chart(info){
		c3.generate({
			bindto: '#graph',
			data: { columns: info, type: 'pie'	},
			size: { height: 450 },
			pie: {
				label: {
					format: function(value, ratio, id){
						return (ratio*100).toFixed(2) + '%('+value+'명)'; //31.5% -> 0.315
					}
				}
			},
			padding: { bottom:50 }
		});
	}

	function line_chart(info){
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
	
	$('.legend').each(function(idx){
		$(this).css('background-color', colors[idx]);
	});
	
})
</script>

</body>
</html>