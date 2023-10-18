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
    <meta charset="UTF-8" />
    <title>Member Registration Select Page</title>
    <style>
      .box {
        width: 100px;
        height: 24px;
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
    <form method="post" action="${contextPath}/member/loginForm.do">
      <br />
      <br />
      <br />
      <div class="main-container">
        <div class="sellermain-wrap">
          <div class="textsize-3 textbold">
            <div class="mainline"></div>
            <br />
            <br />
            <div class="textsize-2">
              <div class="box">Sign up</div>
              <div class="box">Agree to Terms</div>
              <div class="box">Enter Information</div>
              <div
                class="box"
                style="border-top: solid 5px; border-color: #FCF75E"
              >
                Registration Complete
              </div>
            </div>
            <br />
            <br />
            <div class="brd-lightgreen btn-round">
              <br />
              <br />
              <div class="serve-wrap">
                <span class="textsize-2">Welcome to One.EATS as a member.</span
                ><br />
                <span class="textsize-1"
                  >Experience a variety of benefits after logging in.</span
                >
                <br /><br />
                <button
                  class="btn-midlong bg-lightgreen textsize-1 border-0 btn-round"
                >
                  To Go Login
                </button>
                <br /><br />
              </div>
            </div>
            <br />
            <br />
            <br />
            <br />
          </div>
        </div>
      </div>
    </form>
  </body>
</html>
