export class admin_login{
	login(){
		if(frm.mid.value==""){
			alert("아이디를 입력하세요!");
		}
		else if(frm.mpw.value==""){
			alert("패스워드를 입력하세요!");
		}
		else{
			frm.method="post";
			frm.action="./loginok.do";
			frm.submit();
		}
	}
}

export class log_out{
	
}

