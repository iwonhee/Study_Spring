/*
 공통 script
 아무거나 적어봄
*/

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