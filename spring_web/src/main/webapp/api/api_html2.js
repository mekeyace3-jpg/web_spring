function ajax(){
	var aj = new XMLHttpRequest();
	aj.onreadystatechange = function(){
		if(aj.readyState == 4 && aj.status == 200){
			var alldata = JSON.parse(this.response);
			console.log(alldata);
		}
	}
	//patch 통신으로 API에 데이터 자료를 요청한 사항
	aj.open("PATCH","./jsontest4/5");
	aj.send();
}