<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <jsp:include page="../Index/NewHeader.jsp" />
    
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"> -->
<!--     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script> <!-- 務必使用 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>  <!-- 務必使用 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<%--     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>

    
    <style>
@import url(https://fonts.googleapis.com/earlyaccess/notosanstc.css);

* {
	margin: 0;
	padding: 0;
}
h4{
	padding-top:5px;
}
.a5 {
	font-family: 'Noto Sans TC';
	color: rgb(48, 43, 43);
}
.a1 {
	font-family: 'Noto Sans TC';
	color: rgb(48, 43, 43);
}

.a1:hover {
	transition-property: all;
	transition-duration: 0.8s;
	transition-delay: 0s;
	transition-timing-function: linear;
	color: rgb(8, 29, 31);
}

#container {
	padding-top:50px;
	position: relative;
	left: 50%;
	margin-left: -550px;
	/* 760 除以 -2 */
	width: 1100px;
}

.title-text span {
	display: block;
	position: relative;
	color: #0d2335;
	text-align: center;
	font-family: 'Noto Sans TC';
	/* 	padding-left:50px; */
}

.title-text span:before, .title-text span:after {
	content: '';
	position: absolute;
	top: 50%;
	background: #8c8c8c;
	width: 38%;
	height: 3px;
}

.title-text span:before {
	left: 2%;
}

.title-text span:after {
	right: 2%;
}

.sub1 {
	margin-top: 10px;
	display: inline;
}

.sub2 {
	margin-top: 10px;
	display: inline;
}

.sub0 {
	margin-top: 10px;
	margin-bottom: 200px;
	float: right;
}

p {
	font-size: 80%;
	color: red;
	font-family: 'Noto Sans TC';
}
.img{
	 border: 5px solid rgb(18, 150, 132);
	 width:500px;
	 margin: auto;
	 margin-bottom: 15px;
}
.img img{
	 width:500px;
	 height: 350px;
}
.p1{
	font-size:120%;
	font-family: 'Noto Sans TC';
}
#summernoteDIV{
	margin:auto;
 
}
#summernoteDIV img {
	max-width:600px;
}
.divAS1 {
            border: 15px groove rgb(0, 179, 149);
/*             margin:auto; */
        }
.divAS12 {
            margin: auto;
            margin-top: 5px;
            text-align: center;
            font-size: 80%;
        }
        
.divAS12 span{
            margin-right: 5px;
        }
 .divAS13 {
            margin-top: 5px;
            text-align: center;
            font-size: 120%;
        }
.divAS11 {
            text-align: center; 
            margin: auto;
            margin-top: 5px;
/*             width: 500px; */
/*             height: 400px; */
/*             border: 5px solid rgb(0, 179, 149); */
        }
.divAS11 img{
            width: 500px;
            height: 350px;
            margin: auto;
         border: 5px solid rgb(0, 179, 149); 
        }
.imguse {
            width: 490px;
        }
.divAS14 {
            margin-top: 15px;
            margin-bottom: 15px;
/*             width: 900px; */
            text-align: center;
            font-size: 80%;
            margin: auto; 
        }
        
.divAS14 span{
            margin-right: 15px;
        }
        
        
.divAS15 {
			border: 2px solid rgb(0, 179, 149); 
            text-align: center;
            font-size: 120%;
            margin: auto;
            width: 750px;
            margin-bottom: 15px;
        }
#changeCityContent img{
/* 			width: 400px; */
			max-width:550px;
}

</style>
</head>

<body>

  	<div id="container">

		<h2 class="title-text">
			<span> <input type="button" value=" Add Blog "
				id="buttonFade0" class="btn btn-info fa-1x btn-lg">
			</span>
		</h2>

		<p class="p1">*以下為必填資訊</p>
				
		<form id="form" action="<c:url value="/Blog/BlogNew.controller"/>" method="POST"
			enctype="multipart/form-data">
			<input name="memberID" type="hidden" value="${user.memberID}">
			<input name="blogReleaseTime" type="hidden" value="${BeanSNum[0][0].blogReleaseTime}">
			<input name="blogSNum" type="hidden" value="${BeanSNum[0][0].blogSNum}">
			
			
			
			<p>*選擇您推薦城市</p>
			<div class="input-group mb-3">
					
				<div class="input-group-prepend col-auto ">
					<label class="input-group-text a1" for="inputGroupSelect01"
						name="blogNation">國家</label>
				</div>
				<select name="blogNation" class="custom-select"
					id="inputGroupSelect01"
					onchange="changeCollege(this.selectedIndex)">
					<option selected>請選擇...</option>
				</select>

				<div class="input-group-prepend col-auto">
					<label class="input-group-text a1" for="inputGroupSelect02"
						name="blogCity">城市</label>
				</div>
				<select name="blogCity" class="custom-select"
					id="inputGroupSelect02">
					<option selected>請選擇...</option>
				</select>
			</div>
			<p>*編輯您的標題(限50字內)</p>
			<div class="input-group mb-3">
				<div class="input-group-prepend col-auto">
					<label id="title" class="input-group-text a1" for="blogTitle" name="blogTitle">標題</label>
				</div>
				<input  name="blogTitle" maxlength="50" id="blogTitle" type="text"
					class="form-control" aria-label="Default"
					aria-describedby="inputGroup-sizing-default" required>
			</div>
			<p>*選擇您的封面</p>
			<div class="input-group mb-3">
				<div class="input-group-prepend col-auto">
					<span class="input-group-text a1">封面</span>
				</div>
				<div class="custom-file">
					<input name="blogCover" type="file" accept="image/*"
						class=" text-center center-block file-upload" id="inputGroupFile01"> 
				</div>
			</div>
				<div class="text-center img">
				<img name="blogPic" id="idCover" class="img-thumbnail avatar" src="<c:url value="/Images/Blog/onload.jpg"/>" alt="avatar">
				</div>
				
			<p>*編輯您的內容</p>	
			<div id="summernoteDIV">
			<textarea name="summernote" id="summernote" rows="10" cols="80">
        	</textarea>
			</div>
			
			<div class="sub0">
				<div class="sub2">
					<button id="preview" type="button" class="btn btn-outline-warning btn-lg a1" data-toggle="modal" data-target=".bd-example-modal-lg">預覽</button>
					
					
					<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
					      
					      
					      
			<div class="divAS1">
			<h4 class="title-text">
						<span><button id="changeKeyword" type="button"
								class="btn btn-info fa-1x hot2">預覽</span>
				</h4>
                <div class="divAS12">
                    <span id="changeNation" href="#" class="a1 border1 distance">亞洲</span>
                    <span class="a1 border1 distance">瀏覽次數(<span id="changeBlogViews" href="#"> 999</span>)</span> 
                    <span id="changeBlogCity" href="#" class="a1 distance">香港</span>

                </div>
                <div class="divAS13">
                    <span id="changeBlogTitle" class="a3">【香港】2018香港迪士尼終極攻略，交通、門票、事前準備、攻園須知整理，照著這篇玩就對了！</span>
                </div>
                <div class="divAS11">
                    
                        <img id="changeBlogPic" class="imguse" src="${pageContext.request.contextPath}/Images/Blog/articla1.jpg" alt="article">
                    
                </div>
                <div class="divAS14">
                    <span id="changeBlogDate" class="border1 distance a1">2018-09-28</span>
                    <span class="distance a1">by</span>
                    <span id="changeMemberName2" href="#" class="a1 ">Kobe</span>
                </div>
				<h4 class="title-text">
						<span><button id="changeKeyword" type="button"
								class="btn btn-info fa-1x hot2">Article</span>
				</h4>
                <div class="divAS15">
                    <div id="changeCityContent">一、奧蘭多迪士尼簡介 Source：KKday 奧蘭多迪士尼是全球最大的迪士尼度假區，總共有魔幻王國（Magic Kingdom）、未來世界（Epcot）、好萊塢影城（Hollywood studios）和動物王國（Animal
                        Kingdom）四大主題樂園，因此也被稱為Disney World。而這次編輯會以魔幻王國為主來介紹唷～ 二、怎麼前往奧蘭多迪士尼？ 美國大眾交通工具並不發達，一般以自駕或搭計程車為主，如果你預計在奧蘭多住宿，奧蘭多的飯店幾乎都有往返奧蘭多各大遊樂園的接駁車服務。
                        a. Magical Express 第一種方式適合選擇住在Disney Resort的人，只要住迪士尼飯店就可以享有免費接駁車的服務，在行前會收到一封訂房確認以及Magical Express搭乘的說明書裡面會有詳細指示。重點來說，下飛機後，前往B
                        side搭乘Magical Express就對了。 b. 巴士 Lynx 第二種則是適合沒有開車但想要自行前往迪士尼的朋友。Lynx以熊掌為標誌，是奧蘭多居民主要使用的大眾交通工具，往環球影城可搭乘Links
                        50 或56，單程2$。 官網路線圖 如果要轉乘其他巴士，可以跟司機要轉乘卡，一個小時內轉車免費。 三、什麼時候開園 迪士尼開放時間會隨季節有所不同，以魔幻王國（Magic Kingdom）為例，旺季假日大約會從早上9點到晚上11點，平日或淡季時段則大多是早上9點到晚上6點或8點，迪士尼的官網會公布營業時間，建議可以事先上網查詢（迪士尼會提早2-3個月前公告開園時間），迪士尼官網上的行事曆會詳細列出每個日期的開園時間以及是否有
                        Extra Magic Hour。 一般來說，迪士尼的淡旺季並不是以月份區分，因為一個月之中可能也會好幾個尖峰（Peak)時段，大多是落在假日或是連假（像是萬聖節、感恩節、聖誕節等），如果想一路玩到半夜，就要避掉平日等時段，但票價會貴一些，人潮也會比較多。
                        奧蘭多迪士尼開園時間 四、最好幾點去排隊？入園前需注意什麼？ Source：KKday 建議要比開園時間提早至少一個半小時到園區，因為需要先停車或搭園內專車到樂園門口、入園前還要先安檢，更何況先排隊就能愈快排到想玩的設施。
                        還有入園前，強烈建議要先讀過遊玩攻略或是先熟悉迪士尼地圖，不然到入園後才研究就太慢了！而且許多時間都浪費掉了~ 入園前的小撇步：在等待入園的時間，可先將迪士尼的官方app下載到手機裡，這個app可以告訴你遊樂設施的地點、廁所、飲水機、餐廳等位置資訊、設施的排隊等候時間、迪士尼人物會在幾點在哪裡出現、煙火幾點施放等各種強大資訊！
                        iTunes 載點 Android載點 五、奧蘭多迪士尼怎麼玩？哪些一定要玩到？ 善用Fast Pass排熱門設施 奧蘭多迪士尼的門票一次可以預約3個快速通關，現在的FP不用抽票了，則是用以下兩種方式來登記Fast
                        Pass： 1. 手機APP登記 Source：KKday 奧蘭多迪士尼的門票的背面有QR code，須先開啟APP掃描QR code將票卡與APP綁定才行。預約完成的FP就會顯示在APP裡，想取消或更改只要在APP的主選單重新預約就可以，非常便利！
                        2. 在設施附近的FastPass Kiosk 登記</div>
                </div>

                <h3 class="title-text">
                    <span>
                        <input type="button" value=" END " id="buttonFade0" class="btn btn-info fa-1x btn-lg">
                    </span>
                </h3>
            </div>
					      
					      
					    </div>
					  </div>
					</div>
				</div>

				<div class="sub1">
					<button id="go" type="submit" class="btn btn-outline-success a5 btn-lg" >送出</button>
				</div>
			</div>
			
			
		</form>
	</div>

    <script>
        $('#summernote').summernote({
            placeholder: '編輯您的網誌...',
            tabsize: 2,
            height: 1000,
//             width:900,
            lang: 'zh-tw',
            toolbarContainer : "#toolbar"
        });
        
        var colleges = [ '台灣', '日本', '韓國', '美國', '德國' ];
		var collegeSelect = document.getElementById("inputGroupSelect01");
		var inner = "";
		for (var i = 0; i < colleges.length; i++) {
			inner = inner + '<option value='+colleges[i]+'>' + colleges[i]
					+ '</option>';
		}
		collegeSelect.innerHTML = inner;

		var sectors = new Array();
		sectors[0] = [ '台北', '台中', '台南', '高雄' ];
		sectors[1] = [ '東京', '大阪', '沖繩', '北海道' ];
		sectors[2] = [ '首爾', '釜山', '大邱', '濟州島' ];
		sectors[3] = [ '紐約', '洛杉磯','舊金山', '邁阿密' ];
		sectors[4] = [ '柏林', '漢堡', '慕尼黑', '法蘭克福' ];

		function changeCollege(index) {
			var Sinner = "";
			for (var i = 0; i < sectors[index].length; i++) {
				Sinner = Sinner + '<option value='+sectors[index][i]+'>'
						+ sectors[index][i] + '</option>';
			}
			var sectorSelect = document.getElementById("inputGroupSelect02");
			sectorSelect.innerHTML = Sinner;
		}
		changeCollege(document.getElementById("inputGroupSelect01").selectedIndex);
		
		
		
		
		$(document).ready(function() {

			$('body').on('click','#confirmB',function(){
				$('body').on('click','#confirmBB',function(){
	 				window.location.href = "${pageContext.request.contextPath}/Blog/BlogIndex.jsp";
				})
			})
			
			//preview---------------------------
				$("#preview").click(function(){
					$("#changeNation").text($('#inputGroupSelect01').val());
					$("#changeBlogCity").text($("#inputGroupSelect02").val());
					$("#changeBlogTitle").text($("#blogTitle").val());
					$("#changeBlogPic").attr("src",$("#idCover").attr("src"));
					$("#changeCityContent").html($('#summernote').summernote('code'));
				})
				
			//--------------------------
			var readURL = function(input) {
		        if (input.files && input.files[0]) {
		            var reader = new FileReader();
		            reader.onload = function (e) {
		                $('#idCover').attr('src', e.target.result);
		            }
		            reader.readAsDataURL(input.files[0]);
		        }
		    }   
		    $(".file-upload").on('change', function(){
		        readURL(this);
		    });
		    
		    if($("#inputGroupFile01").val()==""){
		    	$('#go').addClass("disabled").attr("type","button");
		    	
		    }
		   
		    
			<c:if test="${not empty BeanSNum}">
			$('#buttonFade0').val('Edit Blog');
			$('#inputGroupSelect01 option[value="${BeanSNum[0][1].nation}"]').prop("selected",true);
			changeCollege(document.getElementById("inputGroupSelect01").selectedIndex);
			$('#inputGroupSelect02 option[value="${BeanSNum[0][0].blogCity}"]').prop("selected",true);
			
			$('#blogTitle').val("${BeanSNum[0][0].blogTitle}");
			$('#inputGroupFile01').attr("file","data:image/png;base64,${BeanSNum[0][0].blogCoverToBase64}");
			$('#idCover').attr("src","data:image/png;base64,${BeanSNum[0][0].blogCoverToBase64}");
			var markupStr = '${BeanSNum[0][0].blogContext}';
			$('#summernote').summernote('code', markupStr);
			
			
        	$('#go').removeClass("disabled").attr("type","submit");
        	$('#go').html('保存');
			</c:if>
		});
    </script>
    <script type="text/javascript">
    
	 if($('#go').click(function(){
	    	if($("#go").hasClass("disabled")){
// 	    		alert('記得上傳封面喔!!!');
// 	    		swal("資料尚未齊全", "請上傳封面圖片", "error");
	    		swal({
	    			  title: "資料尚未齊全",
	    			  text: "請上傳封面圖片",
	    			  type: "error",
	    			  confirmButtonText: "OK",
	    			  confirmButtonColor:"#0bb739"
	    			});
	    	}
	    	if(!$("#go").hasClass("disabled")){
// 	    		alert('更新成功!!!');
// 	    		swal("資料更新成功", "將導向網誌首頁", "error");
// 	    		swal({
// 	    			  title: "成功!",
// 	    			  text: "將導向網誌首頁",
// 	    			  type: "success",
// 	    			  confirmButtonText: "<span id='confirmBu'>GO<span>"
// 	    			});
	    		
	    		//---------------------------test
	    		 //自訂預設值
	            swal.setDefaults({
	                confirmButtonText: "確定",
	                cancelButtonText: "取消"
	            });
	            //swal.resetDefaults();//清空自訂預設值
	            $(function () {
// 	                $("#go").click(function () {
	                    //confirm dialog範例
	                    swal({
	                        title: "確定送出？",
	                        html: "按下確定後資料會自動存檔",
	                        type: "question",
	                        showCancelButton: true,//顯示取消按鈕
	                        confirmButtonText:"<span id='confirmB'>回至首頁</span>"
	                    }).then(
	                        function (result) {
	                            if (result.value) {
	                                //使用者按下「確定」要做的事
// 	                                swal("完成!", "資料已經送出將回到首頁", "success");
// 	                                window.location.href = "${pageContext.request.contextPath}/Blog/BlogIndex.jsp";
									 swal({
					                    title: "完成!",
					                    html: "資料已經送出將回到首頁",
					                    type: "success",
						    			confirmButtonText:"<span id='confirmBB'>回至首頁</span>"
					                })
	                            } else if (result.dismiss === "cancel")
	                            {
	                                 //使用者按下「取消」要做的事
	                                swal("取消", "您可重新輸入資料", "error");
	                            }//end else  
	                        });//end then 
// 	                });
	            });
	    	}
		   }))
    	
    $("#inputGroupFile01").change(function(){
    	if($("#inputGroupFile01").val()!=""){
        	$('#go').removeClass("disabled").attr("type","submit");
        }
    	
    })
//     alert('user before if = ' + ${user.memberID});
    </script>
</body>

</html>