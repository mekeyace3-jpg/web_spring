/* 각각의 name이 별도로 존재 하여 검토 후 Back-end 전송 */
function agree_ck(){
	if(frm.agree_ck1.checked==false || frm.agree_ck2.checked==false){
		alert("약관에 필수 동의 하셔야 정상 반영 됩니다.");
	}
	else{
		frm.method="post";
		frm.action="./agreeok.do";
		frm.submit();
	}
}
//checkbox의 모든 name명이 같을 경우
function agree_cck(){
	if(frm.agree_ck[0].checked==false || frm.agree_ck[1].checked==false){
		alert("약관에 필수 동의 하셔야 정상 반영 됩니다.");
	}
	else{
		frm.method="post";
		frm.action="./agreeok.do";
		frm.submit();
	}
}