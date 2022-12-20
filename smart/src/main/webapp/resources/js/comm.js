/*
 공통 script
 아무거나 적어봄
*/

$(function(){
	if( $('.date').length>0 ){		
		// 달력 ui 속성지정
		$.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd',
			dayNameMin:['일','월','화','수','목','금','토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			showMonthAfterYear: true,	//년도 뒤에 월 표시
			changeYear: true,
			changeMonth: true
		});
	}
	
	// 파일첨부처리
	$('#attach-file').change(function(){
		console.log(this.files[0])//선택한 파일정보
		var attached = this.files[0];
		//실제 파일 선택한 경우
		if( attached ){
			$('#delete-file').css('display', 'inline'); // 지우기 버튼 보이기
			//미리보기 태그가 있는 경우 선택한 이미지 보이기
			if( $("#preview").length > 0 ){
				// 선택한 파일이 이미지인 경우
				if( isImage(attached.name) ){					
					$("#preview").html('<img class="profile">');
					var reader = new FileReader();
					reader.onload = function(e){
						$("#preview img").attr('src', e.target.result);
					}
					reader.readAsDataURL( attached );
				}else{
					initAttach();	// 이미지가 아닌 파일 선택한 경우
				}
			}
			
		}else{
			initAttach(); //파일태그 클릭후 취소한 경우
		}
	});
	
	$('#delete-file').click(function(){
		initAttach();
	});
});

function initAttach(){
	$('#preview').empty();
	$('#delete-file').css('display', 'none');
	$('#preview img').remove();
}

function isImage( filename ){
	//파일의 확장자명으로 이미지 파일인지 판단 : abc.png -> png
	var ext = filename.substring( filename.lastIndexOf('.') + 1 ).toLowerCase();
	var imgs = ['png', 'jpg', 'jpeg', 'bmp', 'gif', 'webp'];
	if( imgs.indexOf( ext ) == -1 ) return false;
	else return true;
};

// 필수 입력 항목
function emptyCheck(){
	var ok = true;
	$('.ck').each(function(){	/* '.ck'가 여러개일때, 모두 같은 처리 */
		if( $.trim($(this).val()) ==''){	/* trim은 공백처리 위함 */
			var title = $(this).attr('placeholder'); /* placeholder 값 가져오기 */
			alert(title + '를 입력하세요');
			$(this).focus();	/* 입력해야 할 칸에 입력대기 */
			ok = false;
			return ok;
		}
	});
	return ok;
}