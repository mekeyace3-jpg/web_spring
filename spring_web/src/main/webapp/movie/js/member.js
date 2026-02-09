//해당 Back-end값을 리턴 받는 전역변수 값	
var secode = "";
export class memberck{	
	//메일에서 받은 인증번호와 사용자가 입력하는 인증번호를 검토하는 메소드	
	usernock(){
		var usercode = document.querySelector("#usercode");
		if(usercode.value == secode){
			alert("인증이 완료 되었습니다.");
			usercode.readOnly = true;
		}
		else{
			alert("인증번호가 일치 하지 않습니다. 다시 확인하시길 바랍니다.");
		}
	}
	
	postmail_api(){
	//사용자가 메일인증을 처리하는 메소드
		var mail = document.querySelector("#usermail")
		if(mail.value == ""){
			alert("정상적인 메일을 입력하셔야만 메인인증이 진행 됩니다.");
		}
		else{
			//Back-end mailcheck API로 전송
			fetch("./mail_check.do?mail="+mail.value,{
					method:"get"
			}).then(function(a){
				return a.text();
			}).then(function(b){
				secode = b;		//Backend에서 받을 결과를 필드에 변수값으로 이관
			}).catch(function(error){
				console.log(error);
			});
		}
	}
	
	
	closeDaumPostcode() {
        var element_layer = document.querySelector("#layer");
        element_layer.style.display = 'none';
    }
	
	
	address(){	//ECMA로 카카오 우편번호 작동
		var element_layer = document.querySelector("#layer");
		
		  new kakao.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector('#sample2_postcode').value = data.zonecode;
                document.querySelector('#sample2_address').value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("#dtc_address").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        this.initLayerPosition();
	}
	
	initLayerPosition(){
		var element_layer = document.querySelector("#layer");
		
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
	
}