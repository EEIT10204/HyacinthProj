<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../Index/NewHeader.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.js"></script> --%>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> --%>
<title>檢舉管理系統</title>

<style>
	*{
		margin:0;
		padding:0;
	}
	table {
		border:1px red solid;
	}
	table th {
		border:1px black solid;
	}
	table td {
		border:1px black solid;
	}
	.table_Area{
		width:45em;
		height:50em;
		margin:auto;
		margin-top:30px;
		text-align: center;
	}
	.caseRow{
		cursor: pointer;
	}
	
</style>

</head>
<body>
<!-- 	<center> -->
	<div class="table_Area">
	<h2 style="margin-top:40px;">檢舉管理系統</h2>
	
	<form id="reportForm" style="width: 300px;">
<!-- 		<input type="text" name="search" placeholder="enter keyword" id="referID"/>  -->
        <span style="margin-top:15px;margin-bottom:0px;margin-left:460px;">
		<select id="type"><option value="" disabled selected>類型</option><option value="act">活動</option><option value="blog">網誌</option><option value="comment">留言</option></select>
		<select id="process"><option value="" disabled selected>進度</option><option value="處理中">處理中</option><option value="已完成">已完成</option></select>
		<!-- 		<input type="button" id="testAjax" value="search"/>  -->
		<button type="button" class="btn  btn-xs" id="testAjax" value="search" style="height:32px;background-color: #46a3ff;color:white;text-align:center;">查詢</button>
		

				<button type="button" class="btn btn-xs" id="testAjax" value="Clear" onclick="clearForm()" style="height:32px;background-color: #46a3ff;color:white;text-align:center;">清除</button>
		</span>
	</form>
	
	<br>
	<table class="table table-hover">
		<thead class="thead-dark">
			<tr>
			<th>案件編號</th><th>類型</th><th>檢舉理由</th><th>舉報人</th><th>進度</th>
			</tr>
		</thead>
		<tbody id="reportDisplay">		
		</tbody>
	</table>
	</div>
<!-- 	</center> -->
	
	<!-- The Comment Modal -->
<div class="modal" id="commentModal" style="display:none">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

      <!-- Modal Header -->
     
      <div class="modal-header">
      <img src="${pageContext.request.contextPath}/Images/Index/exclamation-mark.png" style="height:30px;align-content: center;">
        <h4 class="modal-title" id="cmtDetailCaseID" style="margin-left: 10px;margin-top: -4px;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

		<!--       Modal body -->
      <div class="modal-body" id="modal-body">
      <div style="margin-bottom:10px;margin-left:10px;margin-top: 10px;font-size: 18px;"><p style="display:inline">檢舉人: <span id="cmtDetailReporter" style="font-weight: bold;"></span> 於  <span id="cmtDetailReportedTime"></span> 檢舉 </p><br></div> 
        <label style="vertical-align: text-top;margin-left:10px;margin-top:0px;font-size: 18px;">理由 :</label>   <p id="cmtDetailReason" style="width:400px;height:150px; border:solid 1px black; border-radius: 10px; display:inline-block; padding:3px;margin-top:10px;margin-left: 10px;"></p><br>
         <p align="right" style="display:inline;width:300px;margin-left:600px;">
       
 <div  style="margin-left:550px;">
  <button type="button" class="btn btn-primary" onclick="caseAccept('comment')" style="margin-left:5px;">檢舉成立</button>
  <button type="button" class="btn btn-primary" onclick="caseDeny('comment')" >審核通過</button>
</div>
     	<hr>
     	 <img alt="" src="${pageContext.request.contextPath}/Images/Index/sms-bubble-speech.png" style="height:18px;">
      	<span style="margin-left:10px;margin-bottom: 10px;font-size: 25px;">檢舉內容</span><br>
      	
      	
      	<label  style="margin-left:28px;font-size: 18px;margin-top: 20px;">留言人: </label><span id="detailCommentMember"></span><br>
      	<label style="margin-left:28px;font-size: 18px;margin-top:8px;">留言內容: </label><span id="detailComment"></span><br>
      	<form>
      		<input id="detailCommentID" type="text" value="" style="display:none" />
      	</form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
      </div>

    </div>
  </div>
</div>

<!-- Act model -->

<!-- 	The Modal -->
<div class="modal" id="actModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

<!--       Modal Header -->
      <div class="modal-header">
      <img src="${pageContext.request.contextPath}/Images/Index/exclamation-mark.png" style="height:30px;align-content: center;">
        <h4 class="modal-title" id="actDetailCaseID" style="margin-left: 10px;margin-top: -4px;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

<!--       Modal body -->
      <div class="modal-body" id="modal-body">
      <div style="margin-bottom:10px;margin-left:10px;margin-top: 10px;font-size: 18px;"><p style="display:inline">檢舉人: <span id="actDetailMember" style="font-weight: bold;"></span> 於  <span id="actDetailReportedTime"></span> 檢舉 </p><br></div> 
        <label style="vertical-align: text-top;margin-left:10px;margin-top:0px;font-size: 18px;">理由 :</label>   <p id="actDetailReason" style="width:400px;height:150px; border:solid 1px black; border-radius: 10px; display:inline-block; padding:3px;margin-top:10px;margin-left: 10px;"></p><br>
         <p align="right" style="display:inline;width:300px;margin-left:600px;">
       
 <div  style="margin-left:550px;">
  <button type="button" class="btn btn-primary" onclick="caseAccept('act')" style="margin-left:5px;">檢舉成立</button>
  <button type="button" class="btn btn-primary" onclick="caseDeny('act')" >審核通過</button>
</div>

      	<hr>
        <img alt="" src="${pageContext.request.contextPath}/Images/Index/sms-bubble-speech.png" style="height:18px;">
      	<span style="margin-left:10px;margin-bottom: 10px;font-size: 25px;">檢舉內容(活動)</span><br>
      	<label style="margin-left:28px;font-size: 18px;">發起人: </label><span id="actOwner" style="font-size: 18px;"></span><br>
      	<label style="margin-left:28px;font-size: 18px;">標題: </label><span id="actTitle" style="font-size: 18px;"></span><br>
      	<label style="margin-left:28px;font-size: 18px;">封面: </label><img id="actCover" src="" style="maxwidth:800px;max-height:250px;vertical-align:top;margin-left: 60px;"/><br>
      	<br>
 
      	<label style="margin-left:10px;margin-top:10px;font-size: 18px;">內容: </label><br>
      	<span id="actContent" style="margin-top:10px;font-size: 18px;margin-left: 10px;"></span><br>
      	<form>
      		<input id="detailActID" type="text" value="" style="display:none" />
      	</form>
      </div>

<!--       Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
      </div>

    </div>
  </div>
</div>

<!-- Blog model -->

<!-- 	The Modal -->
<div class="modal" id="blogModal">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">

     	<!--       Modal Header -->
      <div class="modal-header">
      <img src="${pageContext.request.contextPath}/Images/Index/exclamation-mark.png" style="height:30px;align-content: center;">
        <h4 class="modal-title" id="blogDetailCaseID" style="margin-left: 10px;margin-top: -4px;"></h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

<!--       Modal body -->
      <div class="modal-body" id="modal-body">
      <div style="margin-bottom:10px;margin-left:10px;margin-top: 10px;font-size: 18px;"><p style="display:inline">檢舉人: <span id="blogDetailMember" style="font-weight: bold;"></span> 於  <span id="blogDetailReportedTime"></span> 檢舉 </p><br></div> 
        <label style="vertical-align: text-top;margin-left:10px;margin-top:0px;font-size: 18px;">理由 :</label>   <p id="blogDetailReason" style="width:400px;height:150px; border:solid 1px black; border-radius: 10px; display:inline-block; padding:3px;margin-top:10px;margin-left: 10px;"></p><br>
         <p align="right" style="display:inline;width:300px;margin-left:600px;">
       
 <div  style="margin-left:550px;">
  <button type="button" class="btn btn-primary" onclick="caseAccept('blog')" style="margin-left:5px;">檢舉成立</button>
  <button type="button" class="btn btn-primary" onclick="caseDeny('blog')" >審核通過</button>
</div>
      	<hr>    	
      	 <img alt="" src="${pageContext.request.contextPath}/Images/Index/sms-bubble-speech.png" style="height:18px;">
      	<span style="margin-left:10px;margin-bottom: 10px;font-size: 25px;">檢舉內容(網誌)</span>
      	<br>
      	<br>
      	<p><span style="margin-left:28px;font-size: 18px;">發布人:</span> <span id="blogOwner"></span></p>
      	<p><span style="margin-left:28px;font-size: 18px;">主題: </span> <span id="blogTitle"></span></p>
      	<p><span style="margin-left:28px;font-size: 18px;">封面: </span> 
      	<br>
      	<img id="blogCover" src="" style="width:600px; height:450px;vertical-align:top;margin-left:100px;"/></p>
      	<p><span style="margin-left:20px;font-size: 18px;">內文: </span> <div id="blogContext" style=" border:1px solid #bebebe; display:inline-block;margin-left:60px;padding-left: 20px;padding-right: 20px;padding-top:20px;"></div></p>    	
      	<form>
      		<p><input id="detailBlogID" type="text" value="" style="display:none" /></p>
      	</form>
      </div>

<!--       Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">關閉</button>
      </div>

    </div>
  </div>
</div>

 <!-- Report Modal -->
  <div class="modal fade" id="reportModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <h4 class="modal-title">檢舉</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>          
        </div>
        <div class="modal-body">
        	<form>
       		<span>理由:</span> <textArea style="vertical-align:top; width:400px" id="reportReason" >test123</textArea>
       		<input type="text" id="reportMember" value="5"/> <input type="text" id="referID" value="ACC00006"/>
       		</form>
        </div>
        <div class="modal-footer">
        	<button onclick="sendReport()" type="button" class="btn btn-default" data-dismiss="modal">送出</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        </div>
      </div>
      
    </div>
  </div>
  
  <input data-toggle="modal" data-target="#reportModal" type="button" value="欠檢舉"/>

	
	<script>
	
	function sendReport(){
// 		alert('send report');
		var reportReason = $('#reportReason').text();
		var reportMember = $('#reportMember').val();
		var referID = $('#referID').val();
		alert(reportReason + '-' + reportMember + '-' + referID);
		
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/report.Send",
			data: {"reportMember":reportMember, "referID":referID,"reportReason":reportReason},
			contentType: "application/json; charset=utf-8",
			dataType: "text",
			success: function (data) {
					alert(data);
				},
			error: function (response) {
				$('#detailReason').empty();
				alert("detail error");
				},				
		});	
	}
	
	function caseAccept(type){
		alert('檢舉成立');
		
		if(type.match('comment')){
			var referID = $('#detailCommentID').val();
			var caseID = $('#cmtDetailCaseID').text()
		}
		else if (type.match('blog')){
			var referID = $('#detailBlogID').val();
			var caseID = $('#blogDetailCaseID').text()
			
		}
		else if (type.match('act')){
			var referID = $('#detailActID').val();
			var caseID = $('#actDetailCaseID').text()
		}
		
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/report.Process",
			data: {"referID":referID, "type":type, "caseID":caseID,"process":'accept'},
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (data) {
					alert(data);
				},
			error: function (response) {
				$('#detailReason').empty();
				alert("detail error");
				},				
		});	
		
	}
	
	function caseDeny(type){
		alert('通過審核');
		if(type.match('comment')){
			var referID = $('#detailCommentID').val();
			var caseID = $('#cmtDetailCaseID').text()
		}
		else if (type.match('blog')){
			var referID = $('#detailBlogID').val();
			var caseID = $('#blogDetailCaseID').text()
			
		}
		else if (type.match('act')){
			var referID = $('#detailActID').val();
			var caseID = $('#actDetailCaseID').text()
		}

		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/report.Process",
			data: {"referID":referID, "type":type, "caseID":caseID,"process":'deny'},
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (data) {
					alert(data);
				},
			error: function (response) {
				$('#detailReason').empty();
				alert("detail error");
				},				
		});	
	}
	
	function insertDetail(referID,caseID,reporterName,reportedTime,reason){

		if(referID.match('ACC') || referID.match('BGC')){
			$('#cmtDetailCaseID').empty().html(caseID);
			$('#cmtDetailReporter').empty().html(reporterName);
			$('#cmtDetailReportedTime').empty().html(reportedTime);
			$('#cmtDetailReason').empty().html(reason);
			$('#detailCommentID').val(referID);
		}
		else if(referID.match('AC')){
			$('#actDetailCaseID').empty().html(caseID);
			$('#actDetailMember').empty().html(reporterName);
			$('#actDetailReportedTime').empty().html(reportedTime);
			$('#actDetailReason').empty().html(reason);
			$('#detailActID').val(referID);
		}
		else if (referID.match('BG')){
			$('#blogDetailCaseID').empty().html(caseID);
			$('#blogDetailMember').empty().html(reporterName);
			$('#blogDetailReportedTime').empty().html(reportedTime);
			$('#blogDetailReason').empty().html(reason);
			$('#detailBlogID').val(referID);
		}
		
	}
		
	function showCommentDetail(referID, caseID, reporterName, reportedTime,reason){	
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/report.ShowDetail",
			data: {"referID":referID},
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (data) {
//--------------Pop up different div to display different case type (blog,act,comment)
// 				alert(data['referID']);
// 				$('#modal-body').empty();
				if(data['commentContent']!= null){
				insertDetail(referID,caseID,reporterName,reportedTime,reason);
				$('#detailCommentMember').empty().text(data['memberName']);
				$('#detailComment').empty().text(data['commentContent']);
				}  //comment div content
				else{
					alert('not comment');
				}			
				},
			error: function (response) {
				$('#detailReason').empty();
				alert("detail error");
				},				
		});	
	}
	
	function showActDetail(referID, caseID, reporterName, reportedTime,reason){
// 		alert(referID);		
		insertDetail(referID,caseID,reporterName,reportedTime,reason);
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/report.ShowDetail",
			data: {"referID":referID},
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (data) {
//--------------Pop up different div to display different case type (blog,act,comment)
				$('#actOwner').empty().text(data['memberName']);
				$('#actTitle').empty().text(data['actTitle']);
				var picStr = String.fromCharCode.apply(null, new Uint8Array(data['actPhoto']));
				$('#actCover').attr("src","data:image/jpg;base64," + btoa(picStr));
				$('#actContent').empty().html(data['actIntro']);
				},
			error: function (response) {
				$('#detailReason').empty();
				alert("act detail error");
				},				
		});	
	}
	
	function showBlogDetail(referID, caseID, reporterName, reportedTime,reason){
// 		alert(referID);		
		insertDetail(referID,caseID,reporterName,reportedTime,reason);
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/report.ShowDetail",
			data: {"referID":referID},
			contentType: "application/json; charset=utf-8",
			dataType: "json",
			success: function (data) {
				$('#blogOwner').empty().text(data['memberName']);
				$('#blogTitle').empty().text(data['blogTitle']);
// 				alert(data['blogCover']);
				var picStr = String.fromCharCode.apply(null, new Uint8Array(data['blogCover']));
// 				alert(picStr);
				$('#blogCover').attr("src","data:image/jpg;base64," + btoa(picStr));
				$('#blogContext').empty().html(data['blogContext']);
		
				},
			error: function (response) {
				$('#detailReason').empty();
				alert("blog detail error");
				},				
		});	
	}
	function clearForm() {
	    document.getElementById("reportForm").reset();
	    $('#reportDisplay').empty();
	}
	
	$('#testAjax').click(function SearchResult(){
		
		$('#reportDisplay').empty();
		
		 $.ajax({
				type : "get",
				url : "${pageContext.request.contextPath}/report.Controller",
				data:	{
						 "type":document.getElementById("type").value, 
						 "process":document.getElementById("process").value
						},
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function (data) {
//                     alert(data[0]["caseID"]); 
//                     $('#testArea').text(data[1]["caseID"]);
					for(var i = 0; i < data.length; i++){
						if(data[i]["referID"].match('ACC') || data[i]["referID"].match('BGC'))
							$('#reportDisplay').append('<tr data-toggle="modal" data-target="#commentModal" class="caseRow" onclick="showCommentDetail(\'' +data[i]["referID"]+'\',\''+ data[i]["caseID"]+ '\',\''+ data[i]["memberName"]+ '\',\''+ data[i]["reportedTime"] + '\',\''+ data[i]["reason"]+'\')"><td>'+ data[i]["caseID"] + '</td><td>' + data[i]["referID"] + '</td><td>' + data[i]["reason"] + '</td><td>' + data[i]["memberName"] + '</td><td>' + data[i]["process"] + '</td></tr>');
						else if (data[i]["referID"].match('AC'))
							$('#reportDisplay').append('<tr data-toggle="modal" data-target="#actModal" class="caseRow" onclick="showActDetail(\'' +data[i]["referID"]+'\',\''+ data[i]["caseID"]+ '\',\''+ data[i]["memberName"]+ '\',\''+ data[i]["reportedTime"] + '\',\''+ data[i]["reason"]+'\')"><td>'+ data[i]["caseID"] + '</td><td>' + data[i]["referID"] + '</td><td>' + data[i]["reason"] + '</td><td>' + data[i]["memberName"] + '</td><td>' + data[i]["process"] + '</td></tr>');
						else if (data[i]["referID"].match('BG'))
							$('#reportDisplay').append('<tr data-toggle="modal" data-target="#blogModal" class="caseRow" onclick="showBlogDetail(\'' +data[i]["referID"]+'\',\''+ data[i]["caseID"]+ '\',\''+ data[i]["memberName"]+ '\',\''+ data[i]["reportedTime"] + '\',\''+ data[i]["reason"]+'\')"><td>'+ data[i]["caseID"] + '</td><td>' + data[i]["referID"] + '</td><td>' + data[i]["reason"] + '</td><td>' + data[i]["memberName"] + '</td><td>' + data[i]["process"] + '</td></tr>');
					
					}
					},
				error: function (response) {
					alert("search error");
					},				
			});
	});
	</script>
</body>
</html>