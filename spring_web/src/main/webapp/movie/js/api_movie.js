let day = new Date();
day.setDate(day.getDate()-1);
const today = day.toISOString().slice(0,10).replace(/-/g,'');

export function top10(){
	fetch("./top10.do?day="+today,function(){
		 method:"get"
	}).then(function(a){
		return a.text();
	}).then(function(b){
		if(b == "no"){
			console.log("정상적인 데이터 로드가 되지 않습니다.");
		}else{
			var json = JSON.parse(b);
			var id = document.querySelector("#toplist");
			var html = "";
			json["boxOfficeResult"]["dailyBoxOfficeList"].forEach(function(a,b,c){
				console.log(a);
				var ico = "";
				if(a["rankOldAndNew"] == "NEW"){
					ico = '🔺';		
				}	
					html += `
				<div class="movie-card">
                    <div class="movie-poster">
                        <img src="http://localhost:8080/movie/admin/imgcdn/`+a["movieCd"]+`" alt="영화">
                    </div>
                    <h3 class="movie-title">`+a["movieNm"]+`</h3>
                    <p class="movie-rating">TOP `+ a["rank"] + ico +` 누적관객수 `+Number(a["audiAcc"]).toLocaleString()+`</p>
                </div>
				`;
			});
			id.innerHTML = html;
			
		}
	}).catch(function(error){
		console.log("api 서버 에러!!")
	});
}