//ECMA는 무조건 class를 상단에 적용할 경우 버그 없이 사용이 가능합니다. 그 외에 오류발생 높습니다.
export class admin_new{
	//회원가입시 적용하는 메소드
	member_check(){
	
	}
	
	id_ajax(aa){
		if(aa == ""){
			alert("아이디를 입력하셔야만 중복확인 하실 수 있습니다.");
			document.querySelector("#mid").focus();
		}
		else{
			//ajax => fetch (ECMA, React, Vue, Angular) => new XMLHttpRequest에 대한 API 기반으로 설계
			fetch("./idcheck.do?admin_id="+aa,{
				method : "get"		//ajax 전송방식
			})
			.then(function(a){		//Back-end 암호화 된 배열 형태의 통신 내역을 처리하는 then
				console.log(a);
				return a.text();	//결과를 return 시켜서 아래의 then으로 전달
			})
			.then(function(b){	//실제 결과값을 출력하는 역활을 하는 then
				//결과 출력
				if(b == "ok"){
					alert("사용가능한 아이디 입니다.");
					document.querySelector("#mid").readOnly = true;
					document.querySelector("#idck").value = "1";
				}else{
					alert("이미 사용중인 아이디 입니다.");
				}
			})
			.catch(function(error){
				console.log(error);		//통신오류 예외처리
			});
		}
	}
}

let ad = new admin_new();
/* getElement (X), function aaa()(X) */
/* 
querySelector = getElement 
addEventListener : click, change, submit, keypress, keyup, keydown
*/
document.querySelector("#idcheck").addEventListener("click",function(){
	//ad.member_check();		//해당 클래스 안에 메소드를 호출
	var mid = document.querySelector("#mid").value;
	ad.id_ajax(mid);
});

//회원가입 버튼 클릭시 작동되는 이벤트 
document.querySelector("#frm").addEventListener("submit",function(z){
	z.preventDefault(); //return false 와 동일한 사항
	if(document.querySelector("#idck").value=="0"){
		alert("아이디 중복체크를 하셔야 합니다.");
	}
	else if(frm.mpw.value != document.querySelector("#mpw2").value){
		alert("동일한 패스워드를 입력하셔야 합니다.");
	}
	else{
		frm.method = "post";
		frm.action = "./newadminok.do";
		frm.submit();
	}
});




