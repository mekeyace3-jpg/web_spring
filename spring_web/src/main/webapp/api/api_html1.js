function ajax(){
    var aj = new XMLHttpRequest();
	aj.onreadystatechange = function(){
		if(aj.readyState==4 && aj.status==200){
			var data = JSON.parse(this.response);
			console.log(data);
		}
	}
	aj.open("GET","./jsontest1");
	aj.send();
}

function ajax2(){
    var aj = new XMLHttpRequest();
	aj.onreadystatechange = function(){
		if(aj.readyState==4 && aj.status==200){
			var data = JSON.parse(this.response);
			console.log(data);
		}
	}
	aj.open("GET","./jsontest2");
	aj.send();
}

function ajax3(){
    var aj = new XMLHttpRequest();
	aj.onreadystatechange = function(){
		if(aj.readyState==4 && aj.status==200){
			var data = JSON.parse(this.response);
			console.log(data);
		}
	}
	aj.open("GET","./jsontest3");
	aj.send();
}







