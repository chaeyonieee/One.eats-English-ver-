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
<title>Login Page</title>
<style>
    :root{
	--body-background-color: #f5f6f7;
	--font-color: #4e4e4e;
	--border-gray-color : #dadada;
	--naver-green-color: #04c75a;
	--naver-green-border-color: #06b350;
}




</style>
<c:choose>
	<c:when test = "${result=='loginFailed' }">
	<script>
	window.onload=function(){
		alert("ID or password is incorrect. Please login again");
	}
	</script>
	</c:when>
	</c:choose>
</head>
<body>
<form method = "post" action = "${contextPath}/member/pwdSearch.do">
<br>
<br>
<br>
<div class="main-container">
    <div class="main-wrap">
    <header>
        <div class="textbold textsize-4">
            Search Password
            <br>
        </div>
        <br>
    </header>
        <div>
            Name 
            <br>
            <input class ="brd-lightgray btn-round margin btn-midlong textsize-1 "name ="name" placeholder="Please enter the name" type="text"></input>
            
        </div>
        <div>
            ID 
            <br>
            <input class ="brd-lightgray btn-round margin btn-midlong textsize-1 " name="id" placeholder=" Please enter your ID" type="text"></input>
            
        </div>
        <div class="margin_bottom_plus">
            Phone Number 
            <br>
        </div>
        <div>
        <input class ="brd-lightgray btn-round margin1 btn-midlong-input textsize-1 " placeholder="Please enter your phone number" name = "phone" type="text" style="margin-left: 1px;"></input>
        &nbsp
        <button class = "btn-fatfat-mina bg-lightgreen textsize-0 border-0 margin btn-round textbold" style="margin-right: 5px;">
            verification code Request
        </button><br>
    </div>
        <input class ="brd-lightgray btn-round btn-midlong bg-lightgray border-0 textsize-1 margin-id " placeholder="Please enter the verification code." type="text" style="margin-left: 5px;"></input>
        <div>
            <span class = "textsize-0  textcolor-red btn-midlong textbold">If you haven't received the verification code,Please confirm whether there is a communication provider or phone number block. Confirm해 주세요.</span><br>
            </div>
       <br>

        <button type ="submit" class = "btn-midlong bg-lightgreen textsize-1 textbold input btn-round textcolor-white border-0">
             Confirm</button>
    </div>
</div>
<br>
<br>
<br>
<br>  
</body>
</html>
<table>

</table>
</form>
</body>
</html>