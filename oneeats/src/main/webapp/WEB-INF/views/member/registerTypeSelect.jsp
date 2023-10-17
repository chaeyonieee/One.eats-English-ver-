<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Member Registration select page</title>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />
  </head>
  <body>
    <br />
    <br />
    <br />
    <div class="main-container">
      <div class="main-wrap">
        <div class="row">
          <div class="col text-center textsize-4 textbold">
            Member Registration
          </div>
        </div>
        <br />
        <div class="row">
          <div class="col">
            Finding it tedious to enter your ID, Password, Name, and mobile
            number? <br />
            Register as a member in just 1 second with KAKAOTALK or NAVER.
            <br />
          </div>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
          <a
            id="kakao-btn"
            class="d-flex justify-content-center align-items-center"
            href="${contextPath}/kakao/registerForm.do"
          >
            <img src="${contextPath}/img/icon/kakao.png" />
            KAKAOTALK Login
          </a>
        </div>
        <div class="row">&nbsp;</div>
        <div class="row">
          <a
            id="naver-btn"
            class="d-flex justify-content-center align-items-center"
            href="${contextPath}/naver/registerForm.do"
          >
            <img src="${contextPath}/img/icon/naver.png" />
            NAVER Login
          </a>
        </div>

        <br />
        <br />
        <div class="row">
          <div class="col text-center">
            <p class="textsize-2 margin1">
              ----------------------OR----------------------
            </p>
          </div>
        </div>
        <br />
        <div class="row">
          <div class="col text-center">
            <a
              id="register-btn"
              class="bg-lightgray d-flex justify-content-center align-items-center"
              href="${contextPath}/member/registerForm.do"
            >
              Member Registration with ID/PW input required
            </a>
          </div>
        </div>
        <br />
        <div class="row">
          <div class="col">
            <p class="textsize-1 margin1">Are you a corporate customer?</p>
            <p class="textsize-1"></p>
            <a
              class="textbold"
              href="${contextPath}/member/sellerRegisterForm.do"
              >Business Quick Sign-Up</a
            >
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
