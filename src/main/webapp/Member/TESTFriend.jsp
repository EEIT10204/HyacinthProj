<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<c:url value="/sendFriendReq.controller"/>" method="post">
		<input type="text" name="memberID_A" />
		
		<input type="text" name="memberID_B"/>
		
		<button type="submit">go測試送邀請</button>
	
	</form>
	<form action="<c:url value="/rejectFriendReq.controller" />" method="post">
		<input type="text" name="memberID_A" />
		
		<input type="text" name="memberID_B"/>
		
		<button type="submit">go測試刪邀請</button>
		<p>${rejectFriendResult}</p>
	
	</form><form action="<c:url value="../showFriendList.controller" />" method="post">
		<input type="text" name="memberID_A" />
		<button type="submit">go測試搜尋好友列表</button>
		<p>${friendList[0].memberID},${friendList[0].memberPic} | ${friendList[1].memberID},${friendList[1].memberName}</p>
	</form>
	
	</form><form action="<c:url value="/deleteFriend.controller" />" method="post">
		<input type="text" name="memberID_A" />
		
		<input type="text" name="memberID_B"/>
		<button type="submit">go測試刪除好友</button>
		<p>${deleteResult}</p>
	</form>
	
	
</body>
</html>