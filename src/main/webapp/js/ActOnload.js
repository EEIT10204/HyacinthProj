$(document).ready(function(){
//ActMainTitle
	$.getJSON('../ActMain',function(MActT){
		$.each(MActT,function(idx,MAT){
		$('#ActT'+(idx+1)).text(MAT.actTitle);	
	});
});
	//ActMainTitleT2
	$.getJSON('../intoAct',function(MActT){
		$.each(MActT,function(idx,MAT){
		$('#ActTpu'+(idx+1)).text(MAT.actTitle);	
	});
});
	//ActMainPicture
//	$.getJSON('../ActMain',function(MActT){
//		$.each(MActT,function(idx,MAT){
//		$('#ActP'+(idx+1)).children("img").attr("src","data:image/png;base64,"+MAT.actPhoto);
//		});
//	});
	//ActMainPicture2
	$.getJSON('../intoAct',function(MActT){
		$.each(MActT,function(idx,MAT){
		$('#ActPpu'+(idx+1)).children("img").attr("src","data:image/png;base64,"+MAT.actPhoto);	
		});
	});
	//ActMainView
	$.getJSON('../ActMain',function(MActT){
		$.each(MActT,function(idx,MAT){
		$('#view'+(idx+1)).text(MAT.actView);
		});
	});
	//ActMainView2
	$.getJSON('../intoAct',function(MActT){
	    $.each(MActT,function(idx,MAT){
		$('#views'+(idx+1)).text(MAT.actView);	
	});	
	});
});	

function arrayBufferToBase64(buffer) {

	
    let binary = '';
    let bytes = new Uint8Array(buffer);
    let len = bytes.byteLength;
    for (let i = 0; i < len; i++) {
        binary += String.fromCharCode(bytes[i]);
    }
//	alert('buffer='+buffer);
//	alert('bytes='+bytes);
//	alert('binary='+binary);
    return window.btoa(binary);
}