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
<title>Member Registration page</title>
<style>
    .box{
    width: 100px; 
    height: 24px;
    display: inline-block;
}
</style>
</head>
<body>
     <form method = "post" action = "${contextPath}/member/sellerRegisterLast.do">
<br>

<div class="main-container">
    <div class="sellermain-wrap">
      <div class="textsize-3 textbold">
        <div class="mainline"></div>
        <br />
        <br />
        <div class="textsize-2">
          <div class="box">가입</div>
          <div class="box">Agree to Terms</div>
          <div class="box" style="border-top: solid 5px; border-color: #a3d060">Enter Information</div>
          <div class="box">Registration Complete</div>
        </div>
            <br>
            <br>
        </div> 
        <div class = " margin1 textbold textsize-1 text-left">ID<span class="textcolor-red">*</span></div>
        <input class =" brd-lightgray btn-round btn-midlong-input textsize-1 border-0.5" name="id" placeholder=" ID를 입력해 주세요." type="text"></input>
            &nbsp
            <button class = "btn-fatfat-mina bg-lightgreen textbold textsize-0 border-0 btn-round">
                Duplicate Confirmation
            </button>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">Password<span class="textcolor-red">*</span></p>
            <input class ="brd-lightgray btn-round btn-midlong  textsize-1 " name="pwd" placeholder=" Password를 입력해 주세요.." type="password"></input>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">Password Confirm<span class="textcolor-red">*</span></p>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1 " placeholder="Please re-enter the password." type="password"></input>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">Name<span class="textcolor-red">*</span></p>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1 " name="name" placeholder="Please enter your name." type="text"></input>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">Email</p>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1 " name="email" placeholder="Please enter your email." type="text"></input>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">Phone Number 번호<span class="textcolor-red">*</span></p>
            <input class ="brd-lightgray btn-round btn-midlong-input textsize-1 " name="phone" placeholder="Please enter your phone number" type="text"></input>
            &nbsp
            <button class = "btn-fatfat-mina bg-lightgreen textsize-0 border-0 margin btn-round textbold">
                verification code rquest
            </button><br>
            <input class ="brd-lightgray btn-round btn-midlong bg-lightgray border-0 textsize-1 margin1 " placeholder="Please enter the verification code." type="text"></input>
            <p class = "textsize-0 margin-id">If you haven't received the verification code, 통신사 수신 차단 혹은 Phone Number 번호</p>
            <p class =" textsize-0 margin-id">Please confirm the blocking status.</p><br>

            <p class = " text-left textsize-1 margin1 textbold">Address</p>
            <button class = "btn-midlong bg-lightgreen margin textsize-1 border-0 btn-round">
               Search Address
            </button>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1 " name ="address"  type="text"></input>
            <input class ="brd-lightgray btn-round btn-midlong textsize-1 " name ="address_detail" placeholder="Please enter the detailed address." type="text"></input>
            <br>
            <p class = " text-left textsize-1 margin1 textbold">Gender</span>
                <div class = "btn-tinylong margin textsize-1 border-0 btn-round">
                 
                <input type="radio" name="gender" value="m"><span class=" textsize-1">Male</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="radio" name="gender" value="w"><span class="textsize-1">Female</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <input type="radio" name="gender" value="no"><span class="textsize-1">Not selected</span>
                </div>
            </p>
            <p class = " text-left  textsize-1 margin1 textbold">Date of birth</p>
            <input class ="brd-lightgray btn-round btn-midlong  textsize-1 " name = "birth" placeholder="  YYYY  /  MM  /  DD" type="date"></input>
            <br>
            <div class="line"></div>
            <br>
            <button type="submit" class = "btn-midlong bg-lightgreen margin textsize-2 border-0 btn-round" >
                Member Registration  Complete
            </button>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            
    </div>
</form>
</body>
</html>