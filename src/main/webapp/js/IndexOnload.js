$(document).ready(function(){
	//picture
	$.getJSON('../intodsd',function(blogList){
		$.each(blogList,function(idx,blogBean){
//			$('#loopBlog'+(idx+1)).children("img").attr("src","data:image/png;base64,"+arrayBufferToBase64(blogBean.blogCover));
			$('#loopBlog'+(idx+1)).children("img").attr("src","data:image/png;base64," + blogBean.blogCover	);
			$('#cities'+(idx+1)).text(blogBean.blogCity);
			$('#textTile'+(idx+1)).text(blogBean.blogTitle);
			console.log("blog img: " + arrayBufferToBase64(blogBean.blogCover))
		});
	});
////	title
//	$.getJSON('../intodsd',function(B){
//		$.each(B,function(idx,bbb){
//			$('#textTile'+(idx+1)).text(bbb.blogTitle);
//		});
//	});
////city
//	$.getJSON('../intodsd',function(C){
//		$.each(C,function(idx,ccc){
//			$('#cities'+(idx+1)).text(ccc.blogCity);
//		});
//	});
	
	//ActMainTitleT2
	$.getJSON('../intoAct',function(MActT){
		$.each(MActT,function(idx,MAT){
		$('#ActTpu'+(idx+1)).text(MAT.actTitle);
		$('#views'+(idx+1)).text(MAT.actView);	
		$('#ActPpu'+(idx+1)).children("img").attr("src","data:image/png;base64,"+MAT.actPhoto);	
	});
});
	//ActMainPicture2
//	$.getJSON('../intoAct',function(MActT){
//		$.each(MActT,function(idx,MAT){
//		$('#ActPpu'+(idx+1)).children("img").attr("src","data:image/png;base64,"+MAT.actPhoto);	
//		});
//	});

	//ActMainView2
//	$.getJSON('../intoAct',function(MActT){
//	    $.each(MActT,function(idx,MAT){
//		$('#views'+(idx+1)).text(MAT.actView);	
//	});
//	});
//});	


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
