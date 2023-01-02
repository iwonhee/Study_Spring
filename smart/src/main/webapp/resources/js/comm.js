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
			$('#file-name').text(attached.name); //파일명 보이기
			$('#delete-file').css('display', 'inline'); // 지우기 버튼 보이기
			
			//미리보기 태그가 있는 경우 선택한 이미지 보이기
			if( $("#preview").length > 0 ){
				
				// 선택한 파일이 이미지인 경우
				if( isImage(attached.name) ){					
					$("#preview").html('<img class="profile-s">');
					var reader = new FileReader();
					reader.onload = function(e){
						$("#preview img").attr('src', e.target.result);
					}
					reader.readAsDataURL( attached );
				}else{
					//프로필 이미지처럼 이미지만 첨부해야 하는 경우는
					//이미지가 아닌 파일을 선택했다면 삭제버튼도 안보이게
					if( $(this).attr('accept')=='image/*'){
						$('#delete-file').css('display','none');
					}
					$('#preview').empty();
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
	$('.file-name').text('');
	$('.attached-file').val('');
	$('.preview').empty();
	$('.delete-file').css('display', 'none');
//	$('#preview img').remove();
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
			var title = $(this).attr('placeholder') 
				? $(this).attr('placeholder') : $(this).attr('title'); /* placeholder 값 가져오기 */
			alert(title + '를 입력하세요');
			$(this).focus();	/* 입력해야 할 칸에 입력대기 */
			ok = false;
			return ok;
		}
	});
	return ok;
}

//기존 첨부파일 태그 복제
function copyFile(){
	var last = $('.atta').last();
	last.after( last.clone() );
	
	//복제한 태그 초기화
	last = $('.atta').last();
	last.find( '.attach-file').val('');
	last.find( '.file-name' ).text('');
	last.find( '.delete-file' ).css('display', 'none');
}

//첨부파일 추가 태그 동적 생성
$(document).on('change', '.attach-file', function(){
	var attached = this.files[0];
	var $div = $(this).closest('div');
	//파일을 선택했다면
	if( attached ){
		
		//선택한 파일이 없는 경우에만 기존태그를 복제해서 붙이기
		if( $div.children('.file-name').text()=='' ) copyFile();
		
		
		$div.children('.file-name').text( attached.name ); 		//선택파일명 보이게
		$div.children('.delete-file').css('display', 'inline');	//삭제버튼 보이게
		
		//이미지파일인 경우 미리보기
		if( $div.children('.preview').length>0 ){
			if( isImage( attached.name ) ){
				$div.children('.preview').html('<img>');
				var reader = new FileReader();
				reader.onload = function(e){
					$div.find('.preview img').attr('src', e.target.result);
				}
				reader.readAsDataURL( attached );
			}else{
				//이미지파일이 아닌 경우
				$div.find('.preview').html('');
//				$div.find('.preview').empty();
//				$div.find('.preview img').remove();
			}
		}
		
	}else{
		//파일선택창 열었다가 취소한 경우
		$div.remove();
	}
}).on('click', '.delete-file', function(){
	//선택한 삭제버튼에 해당하는 파일태그 삭제
	$(this).closest('div').remove();
});

//삭제한 파일관리
function removedFile( div ){
	if( $('[name=removed]').length == 0 ) return; 
	var removed = $('[name=removed]').val();
	//hidden 태그에 있는 텍스트를 배열데이터로 만들기
	if( removed=='' ) removed = []; // [1,2] 
	else removed = removed.indexOf(',') == -1 ?  [removed] : removed.split(',');
	
	if( div.data('file') )   removed.push( String(div.data('file'))  )   //DB에서 삭제해야할 정보
	
	removed = new Set(removed); //중복제거
	$('[name=removed]').val( Array.from( removed ) );
	console.log( 'removed', removed )
	console.log( '태그', $('[name=removed]').val() );
}













