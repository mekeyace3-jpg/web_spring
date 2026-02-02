function product_del(pidx,pcode){
	if(confirm("해당 데이터를 삭제시 절대 복구 안됩니다.")){
		frm.pidx.value = pidx;
		frm.pcode.value = pcode;
		frm.method="post";
		frm.action="./product_del.do";
		frm.submit();
	}	
}

function views(pidx){
	location.href='./product_view.do?pidx='+pidx;
}

function product_modify(pidx,pcode){
	location.href='./product_modify.do?pidx='+pidx+"&pcode="+pcode;
}