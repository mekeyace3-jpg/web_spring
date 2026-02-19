export class apiclass{
	imgpage(idx){
		location.href='./box_office_list.do?bidx='+idx;
	}
}

export function html_view(){
	console.log(jsondata);
	var pt = document.getElementById("boxoffice_view");
	let htmlcode = ""; 
	var ea = jsondata["boxOfficeResult"]["dailyBoxOfficeList"].length;
//jsondata["boxOfficeResult"]["dailyBoxOfficeList"][f]["movieCd"]
	for(var f=0; f<ea; f++){	
	var moviecode = jsondata["boxOfficeResult"]["dailyBoxOfficeList"][f]["movieCd"];
	htmlcode += `<tr>
                            <td class="col-rank">`+jsondata["boxOfficeResult"]["dailyBoxOfficeList"][f]["rank"]+`</td>
                            <td class="col-title">`+jsondata["boxOfficeResult"]["dailyBoxOfficeList"][f]["movieNm"]+`</td>
                            <td class="col-image">
                            <img src="http://localhost:8080/movie/admin/imgcdn/`+ jsondata["boxOfficeResult"]["dailyBoxOfficeList"][f]["movieCd"] +`" alt="`+jsondata["boxOfficeResult"]["dailyBoxOfficeList"][f]["movieCd"]+`" class="movie-thumbnail">
							<button type="button" class="btn-register" onclick="upimg('`+moviecode+`')">이미지등록</button>
                            </td>
                            <td class="col-date">`+jsondata["boxOfficeResult"]["dailyBoxOfficeList"][f]["openDt"]+`</td>
                            <td class="col-status">`+jsondata["boxOfficeResult"]["dailyBoxOfficeList"][f]["rankOldAndNew"]+`</td>
                            <td class="col-audience">`+Number(jsondata["boxOfficeResult"]["dailyBoxOfficeList"][f]["audiAcc"]).toLocaleString()+`</td>
                            <td class="col-manage">
                            
                            <button type="button" class="btn-modify">정보수정</button>
                            </td>
                     </tr>`;
	}
	pt.innerHTML = htmlcode;
}








