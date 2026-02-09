//공지사항 관련 스크립트
export class notice{
	notice_view(idxs){
		location.href='./admin_boardview.do?nidx='+idxs;
	}
	//공지사항 삭제 메소드
	notice_delete(){
		if(document.querySelector("#pwd").style.display == "none"){
			if(confirm("해당 공지사항을 삭제 하시겠습니까? 삭제시 해당 데이터는 복구 되지 않습니다.")){
				document.querySelector("#pwd").style.display = "block";
			}
		}
		else{
			if(document.querySelector("#npass").value == ""){
				alert("작성시 적용한 패스워드를 입력하셔야 삭제가 진행 됩니다.");
			}
			else{
				frm.npass.value = document.querySelector("#npass").value;
				frm.action="./admin_boarddel.do";
				frm.submit();
			}
		}
	}
}


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
	admin_userdel(midx){
		fetch("./admin_approval.do",{
			method:"post",
			headers:{"content-type":"application/x-www-form-urlencoded"},
			body: "midx="+midx+"&sign=del"
		}).then(function(a){
			return a.text();
		}).then(function(b){
			if(b=="ok"){
				alert("해당 관리자를 삭제 하였습니다.");
				window.location.reload();
			}
			else{
				alert("해당 데이터가 올바르지 않습니다.");
				window.location.reload();
			}
		}).catch(function(error){
			alert("해당 서버의 접속 문제로 데이터를 이관하지 못하였습니다.");
		});
	}
		
	admin_userok(midx){
		fetch("./admin_approval.do",{
			method:"post",
			headers:{"content-type":"application/x-www-form-urlencoded"},	//post 전용으로 해당 URL 암호화 전송
			body: "midx="+midx+"&sign=new"		//파라미터 값으로 back-end 값을 전송
		}).then(function(a){
			return a.text();	//back-end에 return 결과를 받을 때 암호화된 결과값을 받아서 해석해서 문자열로 변경
		}).then(function(b){	
			//console.log(b);	//back-end 결과에 대한 정보를 출력
			if(b == "ok"){
				alert("해당 관리자 승인이 완료 되었습니다.");
				window.location.reload();
			}
			else{
				alert("해당 데이터가 올바르지 않습니다.");
				window.location.reload();		
			}
		}).catch(function(error){
			alert("해당 서버의 접속 문제로 데이터를 이관하지 못하였습니다.");
		});
	}
}









