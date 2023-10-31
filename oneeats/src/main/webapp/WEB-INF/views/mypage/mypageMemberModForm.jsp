<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
      isELIgnored="false"%>       
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var = "contextPath" value= "${pageContext.request.contextPath}" />
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/css/mina.css">
<meta charset="UTF-8">
<title>Edit the profile</title>
<style>



</style>

</head>
<body>
    <form method="post" action="${contextPath}/mypage/mypageMemberModInfo.do">
    <div class="content-area">
        <div class="profile-edit-box ">
            <div class="profile-edit-header">
                <h4>Password ReConfirm</h4>
                <p class="align-right-header-font">To protect your information, please confirm your password once again.</p>
                <hr>
                <br>
            </div>
            <div class = "textpoint-center">
            <div class = " textpoint-center textbold textsize-1 text-left">ID  </div>
            <input class ="textpoint-left brd-lightgray btn-round btn-midlong textsize-1 " value="${id}" type="text"></input>
            </div>
            <div class ="textpoint-center">
            <div class = " textpoint-center textbold textsize-1 text-left">Password</div>
             <input class ="textpoint-center brd-lightgray btn-round btn-midlong textsize-1" name ="inputPwd" placeholder="Please enter your current Password." type="password"></input>
            </div>
        </div>
            <button type="reset" class="btn-midlong_2 textsize-1 textbold input btn-round border-0">cancel</button>
            <button type="submit" class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0">Confirm</button>
        </div>
    </div>
</form>
</body>
</html>