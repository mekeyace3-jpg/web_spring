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


//관리자 정보를 관리하는 class
export class admin_gover{
	admin_userok(){
	
	}
}









