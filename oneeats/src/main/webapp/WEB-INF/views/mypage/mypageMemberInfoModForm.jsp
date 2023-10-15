<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${contextPath}/css/mina.css" />
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />
    <meta charset="UTF-8" />
    <title>Member Registration Select Page</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${contextPath}/js/registerForm.js"></script>
    <script>
      $(document).ready(function(){
	$("input:radio[name='gender']:radio[value='${memberInfo.gender}']").prop('checked', true);
  $("input:radio[name='email_agreement']:radio[value='${memberInfo.email_agreement}']").prop('checked', true);
  $("input:radio[name='sms_agreement']:radio[value='${memberInfo.sms_agreement}']").prop('checked', true);
});
    </script>
    <style>
      .genderdv {
        width: 200px;
        text-align: center;
        display: inline-block;
      }
    </style>
    <c:choose>
      <c:when test="${result=='loginFailed' }">
        <script>
          window.onload = function () {
            alert("ID or password is incorrect. Please login again");
          };
        </script>
      </c:when>
    </c:choose>
    
  </head>
  <body>
    <form method="post" action="${contextPath}/mypage/memberInfoMod.do">
      <div class="content-area">
        <div class="profile-edit-box">
          <div class="profile-edit-header">
            <h4>Member Information Modify</h4>
            <hr />
            <br />
          </div>

          <div class="margin1 textbold textsize-1">
            ID
            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5 text-center"
                type="text"
                name ="id"
                value="${memberInfo.id}"
                readonly
              />
            </div>
          </div>
          <br />

          <div class="textpoint-center textsize-1 margin1 textbold">
            Password

            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 text-center"
                type="password"
                id="pwd"
                value="${memberInfo.pwd}"
                name="pwd"
              />
            </div>
          </div>
  <br>


          <div
            class="textpoint-center textsize-1 margin1 textbold"
            style="margin-right: 15px"
          >
            Password Confirm

            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 text-center"
                type="password"
                id="pwd_confirm"
                value="${memberInfo.pwd}"
              />
            </div>
          </div>
          <br />




          <div class="margin1 textbold textsize-1">
            Name&nbsp&nbsp
            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5 text-center"
                type="text"
                name ="name"
                value="${memberInfo.name}"
              />
            </div>
          </div>
          <br />

          <div class="textsize-1 margin1 textbold">
            Date of birth
            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 text-center"
                placeholder="${memberInfo.birth}"
                value="${memberInfo.birth}"
                type="datetime"
                name="birth"
              />
            </div>
          </div>
          <br />

          <div class="margin1 textbold textsize-1 text-center">
            Gender
            <div class="btn-memberInfo textsize-1">
              <div style="display: flex; justify-content: center">
                <div>
                  <input type="radio"
                  name="gender" 
                  value="m" />
                  <span class="textsize-1">Male</span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                </div>
                <div>
                  <input 
                  type="radio"
                  name="gender" 
                  value="w" /><span class="textsize-1">Female</span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                </div>
                <div>
                  <input type="radio"
                  name="gender" 
                  value="no" 
                  /><span class="textsize-1">Not selected</span>
                </div>
              </div>
            </div>
          </div>
          <br>


          <div class="margin1 textbold textsize-1">
            Phone Number
            <div>
              <input
                class="brd-lightgray btn-round btn-memberInfo textsize-1 border-0.5 margin1 text-center"
                type="text"
                name="phone"
                value="${memberInfo.phone}"
              />
              <br>
          
            </div>
          </div>
 
          <br />

          <div class="margin1 textbold textsize-1 property_margin">
            SMS
            <div>
              <input type="radio"
              name="sms_agreement" 
              value="yes" /><span class="textsize-1">&nbsp&nbsp&nbsp&nbsp&nbspReceive</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <input type="radio"
              name="sms_agreement" 
              value="no" />
              <span class="textsize-1" > &nbsp&nbsp&nbsp&nbsp&nbspNot Receive</span>
            </div>
          </div>

          <div 
          class="margin1 textbold textsize-1 property_margin"
          style="margin-top:20px;" >
            email
            <div>
              <input type="radio" 
              name="email_agreement" 
              value="yes" />
              <span class="textsize-1">&nbsp&nbsp&nbsp&nbsp&nbspReceive</span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              <input type="radio"
              name="email_agreement" 
              value="no"
              />
              <span class="textsize-1" > &nbsp&nbsp&nbsp&nbsp&nbspNot Receive</span>
            </div>
          </div>


        </div>

       

      <br />
      <br />
      <button
        type="reset"
        class="btn-midlong_2 textsize-1 textbold input btn-round border-0"
      >
        Cancle
      </button>
      <button
        type="submit"
        class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0"
      >
        Confirm
      </button>
      <br /><br /><br />
    </form>
  </body>
</html>
