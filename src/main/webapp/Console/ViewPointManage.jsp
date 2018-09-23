<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../Index/NewHeader.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/datatables.min.css"/>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.26.29/sweetalert2.min.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/datatables.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.26.29/sweetalert2.all.min.js" type="text/javascript"></script>

<title>後台景點管理</title>

<style>
	*{
		margin:0;
		padding:0;
	}
	.form-control{
		width:30em;
	}
	
.content {
  position: absolute;
  top: 30%;
  left: 30%;
  margin-top:-100px;
  margin-left:-280px;
  float: left;
 
}
.aside{
/* 	border: 1px  solid #adadad; */
/*  border-left:1px  solid #adadad;  */
 	position: absolute;
    margin-top:-100px;
      margin-left:-100px;
/* 	float: left; */
	top: 30%;
	left: 55%;
 	width:37em;
 	padding-left:20px;
    padding-right: 20px;
    height:100%;
}
 .viewPointList tr {
	cursor: pointer;
}
/*table paging size changed*/
.dataTables_paginate > a
{
    margin-bottom: 0px !important;
    padding: 2px 10px !important;
}

/*table paging size changed*/
.dataTables_paginate > span > a
{
    margin-bottom: 0px !important;
    padding: 2px 10px !important;
}

tbody{
background-color: 	#acd6ff;

}

.bodyContent{
	height: 40rem;
}

 #inputInfo{ 
 	width:400px; 
 } 

</style>

</head>
<body>
<div class="bodyContent" >
	<div class="content">
	<h3 >景點管理</h3>
	
	<form action="<c:url value="/viewPoint.Controller"/>" method="post" id="uploadForm" accept-charset="utf-8">
		<p class="form-group" >名稱: <input class="form-control" type="text" name="viewPointName" id="inputName" placeHolder="搜尋條件空白可顯示全部景點" /></p>
		<c:if test="${errors != null}"><span class="errors" style="color:red">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${errors.name}</span></c:if>
		<p class="form-group">地址: <input class="form-control" type="text" name="viewPointAddress" id="inputAddress"/></p>
		<c:if test="${errors != null}"><span class="errors" style="color:red">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${errors.address}</span></c:if>
		<p class="form-group">城市: <select class="form-control" type="select" name="viewPointCity" id="inputCity"/></p>
							<option value="" disabled selected>請選擇城市</option>
							<option value="台北">台北</option>
							<option value="台中">台中</option>
							<option value="宜蘭">宜蘭</option>
							<option value="中壢">中壢</option>
							<option value="拉斯維加斯">拉斯維加斯</option>
							<option value="舊金山">舊金山</option></select></p>
		<c:if test="${errors != null}"><span class="errors" style="color:red">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${errors.city}</span></c:if>
		<p class="form-group">介紹: <textarea class="form-control" style="vertical-align:text-top; margin-left:0px;" rows="4" cols="80" name="viewPointInfo" id="inputInfo"></textarea></p>
		<c:if test="${errors != null}"><span class="errors" style="color:red">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${errors.info}</span></c:if>
		<p class="form-group">類型: <select class="form-control" type="select" name="viewPointType" id="inputType">
							<option value="" disabled selected>請選擇類型</option>
							<option value="美食">美食</option>	
							<option value="購物">購物</option>
							<option value="觀光">觀光</option></select></p>
		<c:if test="${errors != null}"><span class="errors" style="color:red">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;${errors.info}</span></c:if>
		<input type="text" style="display:none" id=inputID name="viewPointID"><br><br><br>							
		<p class="form-group">
<!-- 		<input type="submit" name="action" value="Select"> -->
		
		<button type="submit" class="btn " name="action" value="Select" style="background-color: #46a3ff;color: white;margin-left:80px;margin-top:-50px; ">搜尋</button>
		
<!-- 		<input name="action" type="submit" value="Update"> -->
		<button type="button" onclick="updateSwal()" class="btn  " name="action" value="Update" style="background-color: #46a3ff;color: white;margin-left:5px;margin-top:-50px; ">修改</button>
		
		
<!-- 			<input name="action" type="submit" value="Insert"> -->
				<button type="button" onclick="insertSwal()" class="btn  " name="action" value="Insert" style="background-color: #46a3ff;color: white;margin-left:5px;margin-top:-50px; ">新增</button>
			
<!-- 		 <input type="button" value="Clear" onclick="clearForm()" -->
		 <button type="button" class="btn  " name="action" value="Clear" onclick="clearForm()" style="background-color: #46a3ff;color: white;margin-left:5px;margin-top:-50px;; ">清空</button>			
		 </p>
	</form>

</div>

<div class="aside">
<h3>景點列表: ${selectResult.size()}筆</h3>
<div class="viewPointList">
	<table id="viewPointTable" class="table table-hover">
		<thead class="thead-light">
			<th >編號</th><th>名稱</th><th>城市</th><th>分類</th>
		</thead>
		<tbody id="reportBody">		
		<c:forEach var="bean" items="${selectResult}" varStatus="loop">
			<tr id="${loop.index}" onclick="fillForm('${bean.viewPointID}','${bean.viewPointName}','${bean.viewPointInfo}','${bean.viewPointCity}','${bean.viewPointType}','${bean.viewPointAddress}')">			
				<td>${loop.index + 1}</td><td>${bean.viewPointName}</td><td style="width:80px">${bean.viewPointCity}</td><td>${bean.viewPointType}</td>			
			</tr>	
		</c:forEach>	
		</tbody>
		
	
	</table>

</div>

</div>
		
</div>
<script>

		function insertSwal(){			
			swal({
				  title: '確認上傳景點資料?',
				  text: "",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '確認上傳'
				}).then((result) => {
				  if (result.value) {
				    $('#uploadForm').append('<input type="text" name="action" value="Insert" style="display:none"/>');
				    $('#uploadForm').submit();				    
				  }
				})
		}
		
		function updateSwal(){			
			swal({
				  title: '確認修改景點資料?',
				  text: "",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '確認修改'
				}).then((result) => {
				  if (result.value) {
				    $('#uploadForm').append('<input type="text" name="action" value="Update" style="display:none"/>');
				    $('#uploadForm').submit();				    
				  }
				})
		}
		
		$(document).ready( function () {
		    $('#viewPointTable').DataTable({
				  "columnDefs": [
					    { "width": "20%", "targets": 0 },
					    { "width": "15%", "targets": 3 }
					  ],
		    		"order": [[ 0, "asc" ]],
		    		"bLengthChange": false,
					});
		} );
		
			function fillForm(id, name, info, city, type, address){
				$('#inputName').val(name);
				$('#inputCity').val(city);
				$('#inputInfo').val(info);
				$('#inputType').val(type);
				$('#inputID').val(id);
				$('#inputAddress').val(address);
				
			}
			
			function clearForm() {
			    document.getElementById("uploadForm").reset();
			    $('#reportBody').empty().html('<tr><td valign="top" colspan="4" class="dataTables_empty">No data available in table</td></tr>');
			    var errors = document.getElementsByClassName("errors")
			    for (i = 0; i < errors.length; i++) {
			        errors[i].innerHTML="";
			    }
			}
		</script>

</body>
<jsp:include page="../Index/Footer.jsp" />
</html>
