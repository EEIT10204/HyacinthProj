<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet"> 
 
  <link rel="stylesheet" type="text/css" href="../css/flexslider.css" />
  <link rel="stylesheet" type="text/css" href="../css/reset.css" />
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <link rel="stylesheet" href="../css/style.css">
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="../js/jquery-3.3.1.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script src="../js/jquery.flexslider.js"></script>
  
  
<title>Insert title here</title>
</head>

<script>
//DOM load event
window.addEventListener("DOMContentLoaded",	() => {
	
	const cube = document.querySelector(".cube"),
		  imageButtons = document.querySelector(".image-buttons");
	let cubeImageClass = cube.classList[1];

	//Add click event listener to image buttons container
	imageButtons.addEventListener("click", e => {
		
		//Get node type and class value of clicked element
		const targetNode = e.target.nodeName,
			  targetClass = e.target.className;

		//Check if image input has been clicked and isn't the currently shown image
		if (targetNode === "INPUT" && targetClass !== cubeImageClass) {
			
			console.log(`Show Image: ${targetClass.charAt(11)}`);

			//Replace previous cube image class with new class
			cube.classList.replace(cubeImageClass, targetClass);

			//Update cube image class variable with new class
			cubeImageClass = targetClass;	
			
		}
		
	});
	
});


$( function() {
    $( "#tabs" ).tabs();
  } );
  
</script>

<body>

<h1>3D Cube Image Gallery</h1>

<div class="cube-container">

	<div class="cube initial-position">

		<img class="cube-face-image image-1" src="https://images.unsplash.com/photo-1445810694374-0a94739e4a03?w=300&h=300&fit=crop">
		
		<img class="cube-face-image image-2" src="https://images.unsplash.com/photo-1515260268569-9271009adfdb?w=300&h=300&fit=crop">
		
		<img class="cube-face-image image-3" src="https://images.unsplash.com/photo-1506045412240-22980140a405?w=300&h=300&fit=crop">
		
		<img class="cube-face-image image-4" src="https://images.unsplash.com/photo-1514041181368-bca62cceffcd?w=300&h=300&fit=crop">
		
		<img class="cube-face-image image-5" src="https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=300&h=300&fit=crop">
		
		<img class="cube-face-image image-6" src="https://images.unsplash.com/photo-1486334803289-1623f249dd1e?w=300&h=300&fit=crop">

	</div>

</div>

<h2>Click the images below to rotate the cube</h2>

<div class="image-buttons">

	<input type="image" class="show-image-1" src="https://images.unsplash.com/photo-1445810694374-0a94739e4a03?w=100&h=100&fit=crop"></input>

	<input type="image" class="show-image-2" src="https://images.unsplash.com/photo-1515260268569-9271009adfdb?w=100&h=100&fit=crop"></input>

	<input type="image" class="show-image-3" src="https://images.unsplash.com/photo-1506045412240-22980140a405?w=100&h=100&fit=crop"></input>

	<input type="image" class="show-image-4" src="https://images.unsplash.com/photo-1514041181368-bca62cceffcd?w=100&h=100&fit=crop"></input>

	<input type="image" class="show-image-5" src="https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?w=100&h=100&fit=crop"></input>

	<input type="image" class="show-image-6" src="https://images.unsplash.com/photo-1486334803289-1623f249dd1e?w=100&h=100&fit=crop"></input>

</div>


<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Taiwan</a></li>
    <li><a href="#tabs-2">American</a></li>
    <li><a href="#tabs-3">England</a></li>
    <li><a href="#tabs-4">France</a></li>
    <li><a href="#tabs-5">Italy</a></li>
    <li><a href="#tabs-6">New York</a></li>
  </ul>
  <div id="tabs-1">11111111111</div>
  <div id="tabs-2">22222222222222222222</div>
  <div id="tabs-3">3333333333</div>
  <div id="tabs-4">4444444444444</div>
  <div id="tabs-5">4444444444444</div>
 </div>
</body>
</html>