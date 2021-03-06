<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Hyacinth Blog</title>
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
.btnbor{
			border-radius: 10px;
/*             opacity: 0.5; */
}
h4{
	padding-top:5px;
}
.a5 {
	font-family: 'Noto Sans TC';
	font-size: 200%;
	color: #252009;
}
.a5:hover {
	transition-property: all;
	transition-duration: 0.7s;
	transition-delay: 0s;
	transition-timing-function: linear;
	color: rgb(255, 0, 0);
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
	background: #C9CCD3;
	background-image: linear-gradient(-180deg, rgba(255,255,255,0.50) 0%, rgba(0,0,0,0.50) 100%);
	background-blend-mode: lighten;
	border-radius: 50px;
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
            background: #C9CCD3;
 background-image: linear-gradient(-180deg, rgba(255,255,255,0.50) 0%, rgba(0,0,0,0.50) 100%);
 background-blend-mode: lighten;
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
/*             text-align: center; */
            font-size: 120%;
            margin: auto; 
            width: 750px;
            margin-bottom: 15px;
             word-wrap:break-word; 
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
			
			<div class="sub1">
					<span id="hehe123" class="btn btn-outline-secondary a5 btn-lg btnbor" >一鍵輸入</span>
			</div>
			
			
				<div class="sub2">
					<button id="preview" type="button" class="btn btn-warning btn-lg a5" data-toggle="modal" data-target=".bd-example-modal-lg">預覽</button>
					
					
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
						<span><button id="" type="button"
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
					<span id="go" class="btn btn-info a5 btn-lg btnbor" >送出</span>
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

// 			for(var i=0;i<20;i++){
// 				alert(i)
// 				$('body').on('click','#confirmBB',function(){
// 	 				$("#form").submit();
// 				})
// 			}
				
			$('body').on('click','#confirmBB',function(){
 				$("#form").submit();
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
	                        confirmButtonText:"<span id='confirmB'>確定</span>"
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
						    			confirmButtonText:"<span id='confirmBB' class='btn btn-outline-dark' style='size:110%;'>回至首頁</span>"
					                })
					                $('.swal2-styled').css("padding","0");
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
		    
// 		    $("#hehe").click(function(){
// 		    	alert("AAA");
// 		    	$('#blogTitle').val("【北海道滑雪】CP值超高的Top5 滑雪場住宿推薦！這幾家線上訂的到房！");
// 		    	var markupStr = '<h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;"><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">#1&nbsp;</strong><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">適合新手及親子家庭的滑雪場</strong></span></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><a href="https://www.hotelscombined.com.hk/Hotel/Northern_Resort_Annupuri_Niseko.htm?a_aid=134406" rel="noopener" style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: none; vertical-align: baseline; color: rgb(38, 190, 201); line-height: inherit; -webkit-font-smoothing: antialiased !important;">安努普利渡假飯店</a><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;"><br style="text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;">Northern Resort Annupuri Niseko</span></strong></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">★★★</h2><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3347 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy-370x216.jpg 370w" alt="安努普利渡假飯店" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">如果是家族旅遊的話，這個滑雪場最適合不過。從滑雪場可以眺望羊蹄山，可以欣賞著漂亮的景色滑雪。而且設有兒童玩雪樂園，還是免費入場的。當然滑雪場有衣服及用品租借外，如果想學習滑雪，還可以參加滑雪課程。</p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">經過一天疲勞後，還可以在酒店享受露天雪景溫泉，讓身心完全放鬆。</p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3348 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy-370x216.jpg 370w" alt="安努普利渡假飯店 01" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3349 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy-370x216.jpg 370w" alt="安努普利渡假飯店 02" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3350 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy-370x216.jpg 370w" alt="安努普利渡假飯店 03" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;"><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">#2&nbsp;</strong><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">羊蹄山美景</strong>&nbsp;<strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">到市區也很方便</strong></span></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><a href="https://www.hotelscombined.com.hk/Hotel/Ki_Niseko.htm?a_aid=134406" rel="noopener" style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: none; vertical-align: baseline; color: rgb(38, 190, 201); line-height: inherit; -webkit-font-smoothing: antialiased !important;">木二世谷度假酒店</a><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;"><br style="text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;">Ki Niseko</span></strong></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">★★★★</h2><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3351 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy-370x216.jpg 370w" alt="木二世谷度假酒店" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">不論是泡溫泉還是滑雪，都能夠清清楚楚看到羊蹄山。酒店為了方便客人，更有一條直達滑雪場的通道，讓滑雪變得更輕鬆。酒店亦有提供接駁巴來往市中心和便利店，如果不想搭車的話，走路也只需要15分鐘。這間酒店於2016年開幕，是一家非常新穎的酒店，房間設計富有時代感，員工也很貼心，時時刻刻照顧客人的需要。</p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3352 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy-370x216.jpg 370w" alt="木二世谷度假酒店 01" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3353 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy-370x216.jpg 370w" alt="木二世谷度假酒店02" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3354 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy-370x216.jpg 370w" alt="木二世谷度假酒店03" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;"><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">#3&nbsp;</strong><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">價廉物美</strong>&nbsp;<strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">就近新雪谷格蘭比羅夫滑雪場</strong></span></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><a href="https://www.hotelscombined.hk/Hotel/Chalet_Ivy.htm?a_aid=134406" rel="noopener" style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: none; vertical-align: baseline; color: rgb(38, 190, 201); line-height: inherit; -webkit-font-smoothing: antialiased !important;">艾薇小屋酒店</a><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;"><br style="text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;">Chalet Ivy</span></strong></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">★★★★</h2><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3355 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy-370x216.jpg 370w" alt="艾薇小屋酒店" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">這個酒店價錢相對便宜，但設備齊全，亦有提供溫泉和水療養生中心，絕不馬虎。離滑雪場很近，只是幾分鐘的步程，即使抬著滑雪板也不算難走。沿路有很多餐廳和便利店，不用局限留在酒店餐廳用餐。職員們還會建議觀光行程和旅遊資訊，還可以幫助安排呢。</p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3356 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy-370x216.jpg 370w" alt="艾薇小屋酒店 01" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3357 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy-370x216.jpg 370w" alt="艾薇小屋酒店 02" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p>        	';
// 		    	$('#summernote').summernote('code', markupStr);
// 		    })
		     //自訂預設值
        swal.setDefaults({
            confirmButtonText: "確定",
            cancelButtonText: "取消"
        });
        //swal.resetDefaults();//清空自訂預設值
        $(function () {
            $("#hehe123").click(function () {
                //confirm dialog範例
                swal({
                    title: "確定自動輸入？",
                    html: "按下確定後網誌會自動填入內文和標題",
                    type: "question",
                    showCancelButton: true//顯示取消按鈕
                }).then(
                    function (result) {
                        if (result.value) {
                            //使用者按下「確定」要做的事
                            $('#blogTitle').val("【北海道滑雪】CP值超高的Top5 滑雪場住宿推薦！這幾家線上訂的到房！");
					    	var markupStr = '<h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;"><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">#1&nbsp;</strong><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">適合新手及親子家庭的滑雪場</strong></span></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><a href="https://www.hotelscombined.com.hk/Hotel/Northern_Resort_Annupuri_Niseko.htm?a_aid=134406" rel="noopener" style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: none; vertical-align: baseline; color: rgb(38, 190, 201); line-height: inherit; -webkit-font-smoothing: antialiased !important;">安努普利渡假飯店</a><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;"><br style="text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;">Northern Resort Annupuri Niseko</span></strong></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">★★★</h2><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3347 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/02-Copy-370x216.jpg 370w" alt="安努普利渡假飯店" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">如果是家族旅遊的話，這個滑雪場最適合不過。從滑雪場可以眺望羊蹄山，可以欣賞著漂亮的景色滑雪。而且設有兒童玩雪樂園，還是免費入場的。當然滑雪場有衣服及用品租借外，如果想學習滑雪，還可以參加滑雪課程。</p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">經過一天疲勞後，還可以在酒店享受露天雪景溫泉，讓身心完全放鬆。</p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3348 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/03-Copy-370x216.jpg 370w" alt="安努普利渡假飯店 01" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3349 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/04-Copy-370x216.jpg 370w" alt="安努普利渡假飯店 02" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3350 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/05-Copy-370x216.jpg 370w" alt="安努普利渡假飯店 03" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;"><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">#2&nbsp;</strong><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">羊蹄山美景</strong>&nbsp;<strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">到市區也很方便</strong></span></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><a href="https://www.hotelscombined.com.hk/Hotel/Ki_Niseko.htm?a_aid=134406" rel="noopener" style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: none; vertical-align: baseline; color: rgb(38, 190, 201); line-height: inherit; -webkit-font-smoothing: antialiased !important;">木二世谷度假酒店</a><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;"><br style="text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;">Ki Niseko</span></strong></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">★★★★</h2><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3351 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/06-Copy-370x216.jpg 370w" alt="木二世谷度假酒店" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">不論是泡溫泉還是滑雪，都能夠清清楚楚看到羊蹄山。酒店為了方便客人，更有一條直達滑雪場的通道，讓滑雪變得更輕鬆。酒店亦有提供接駁巴來往市中心和便利店，如果不想搭車的話，走路也只需要15分鐘。這間酒店於2016年開幕，是一家非常新穎的酒店，房間設計富有時代感，員工也很貼心，時時刻刻照顧客人的需要。</p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3352 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/07-Copy-370x216.jpg 370w" alt="木二世谷度假酒店 01" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3353 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/08-Copy-370x216.jpg 370w" alt="木二世谷度假酒店02" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3354 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/09-Copy-370x216.jpg 370w" alt="木二世谷度假酒店03" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;"><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">#3&nbsp;</strong><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">價廉物美</strong>&nbsp;<strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;">就近新雪谷格蘭比羅夫滑雪場</strong></span></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><a href="https://www.hotelscombined.hk/Hotel/Chalet_Ivy.htm?a_aid=134406" rel="noopener" style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: none; vertical-align: baseline; color: rgb(38, 190, 201); line-height: inherit; -webkit-font-smoothing: antialiased !important;">艾薇小屋酒店</a><strong style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: bold; outline: 0px; vertical-align: baseline; -webkit-font-smoothing: antialiased !important;"><br style="text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased !important;"><span style="text-rendering: optimizeLegibility; border: 0px; font-family: inherit; font-style: inherit; font-weight: inherit; outline: 0px; vertical-align: baseline; color: rgb(255, 153, 0); -webkit-font-smoothing: antialiased !important;">Chalet Ivy</span></strong></h2><h2 style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 28px; font-weight: inherit; margin-top: 15px; margin-bottom: 15px; outline: 0px; vertical-align: baseline; line-height: 42px; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">★★★★</h2><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3355 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/10-Copy-370x216.jpg 370w" alt="艾薇小屋酒店" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;">這個酒店價錢相對便宜，但設備齊全，亦有提供溫泉和水療養生中心，絕不馬虎。離滑雪場很近，只是幾分鐘的步程，即使抬著滑雪板也不算難走。沿路有很多餐廳和便利店，不用局限留在酒店餐廳用餐。職員們還會建議觀光行程和旅遊資訊，還可以幫助安排呢。</p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3356 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/11-Copy-370x216.jpg 370w" alt="艾薇小屋酒店 01" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p><p style="text-rendering: optimizeLegibility; border: 0px; font-family: Helvetica, &quot;Noto Sans TC&quot;, &quot;Microsoft JhengHei&quot;, sans-serif; font-size: 16px; margin-bottom: 30px; outline: 0px; vertical-align: baseline; line-height: inherit; color: rgb(81, 81, 81); -webkit-font-smoothing: antialiased !important;"><img class="alignnone size-full wp-image-3357 below-entry-meta" src="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy.jpg" sizes="(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 1362px) 62vw, 840px" srcset="https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy.jpg 1000w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy-300x176.jpg 300w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy-768x449.jpg 768w, https://blog.hotelscombined.com.tw/wp-content/uploads/2017/12/12-Copy-370x216.jpg 370w" alt="艾薇小屋酒店 02" width="1000" height="585" style="text-rendering: optimizeLegibility; border: 0px; max-width: 100%; height: auto; display: block; padding-top: 5px; margin-bottom: 40px; -webkit-font-smoothing: antialiased !important;"></p>        	';
					    	$('#summernote').summernote('code', markupStr);
                            swal("完成!", "資料已填入", "success");
                            
                        } else if (result.dismiss === "cancel")
                        {
                             //使用者按下「取消」要做的事
                            swal("取消", "繼續操作", "error");
                        }//end else  
                    });//end then 
            });
        });
		    
		    
		    
//     alert('user before if = ' + ${user.memberID});
    </script>
</body>

</html>