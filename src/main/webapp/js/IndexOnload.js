$(document).ready(function(){
	//picture
	$.getJSON('../intodsd',function(blogList){
		$.each(blogList,function(idx,blogBean){
			$('#loopBlog'+(idx+1) + ' img').attr("src","data:image/png;base64," + blogBean.blogCover);
			$('#cities'+(idx+1)).text(blogBean.blogCity);
			$('#textTile'+(idx+1)).text(blogBean.blogTitle);
			$('#loopBlog'+(idx+1) + '>a').attr("href","../Blog/BlogMember.controller?blogSNum="+blogBean.blogSNum);
		});
	});
	
//	ActMainTitleT2
	$.getJSON('../intoAct',function(MActT){
		$.each(MActT,function(idx,MAT){
		$('#ActTpu'+(idx+1)).text(MAT.actTitle);
		$('#views'+(idx+1)).text(MAT.actView);
		$('#ActPpu'+(idx+1)).children("img").attr("src","data:image/png;base64," + MAT.actPhoto);	 //arrayBufferToBase64(MAT.actPhoto))
		$('#ActMpu'+(idx+1)).attr("href","../actdisplay.controller?actSNum="+MAT.actSNum);
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

    return window.btoa(binary);
}
