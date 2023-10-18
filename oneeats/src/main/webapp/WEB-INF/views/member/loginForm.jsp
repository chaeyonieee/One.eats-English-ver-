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
    <title>Login page</title>

    <style></style>
    <script>
      $(function () {
        fnInit();
      });

      function frm_check() {
        saveid();
      }

      function fnInit() {
        var cookieid = getCookie("saveid");
        console.log(cookieid);
        if (cookieid != "") {
          $("input:checkbox[id='saveId']").prop("checked", true);
          $("#logId").val(cookieid);
        }
      }

      function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + 0);
        if (todayDate > expiredays) {
          document.cookie =
            name +
            "=" +
            escape(value) +
            "; path=/; expires=" +
            expiredays +
            ";";
        } else if (todayDate < expiredays) {
          todayDate.setDate(todayDate.getDate() + expiredays);
          document.cookie =
            name +
            "=" +
            escape(value) +
            "; path=/; expires=" +
            todayDate.toGMTString() +
            ";";
        }

        console.log(document.cookie);
      }

      function getCookie(Name) {
        var search = Name + "=";
        console.log("search : " + search);

        if (document.cookie.length > 0) {
          // 쿠키가 설정되어 있다면
          offset = document.cookie.indexOf(search);
          console.log("offset : " + offset);
          if (offset != -1) {
            // 쿠키가 존재하면
            offset += search.length;
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset);
            console.log("end : " + end);
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1) end = document.cookie.length;
            console.log("end위치  : " + end);

            return unescape(document.cookie.substring(offset, end));
          }
        }
        return "";
      }

      function saveid() {
        var expdate = new Date();
        if ($("#saveId").is(":checked")) {
          expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
          setCookie("saveid", $("#logId").val(), expdate);
        } else {
          expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
          setCookie("saveid", $("#logId").val(), expdate);
        }
      }
    </script>
  </head>
  <body>
    <form
      method="post"
      action="${contextPath}/member/login.do"
      onsubmit="return frm_check();"
    >
      <br />
      <br />
      <br />
      <div class="main-container">
        <div class="main-wrap">
          <div class="row">
            <div class="col text-center textbold textsize-4">Login</div>
          </div>
          <br />
          <div class="row">
            <div class="col">
              <div>
                <input
                  class="textsize-2 form-control input-tall"
                  placeholder="Enter your ID"
                  id="logId"
                  name="id"
                  type="text"
                />
              </div>
            </div>
          </div>

          <br />

          <div class="row">
            <div class="col">
              <div>
                <input
                  class="textsize-2 form-control input-tall"
                  placeholder="Enter Password (8-12, upper and lower letters+num+special characters)"
                  name="pwd"
                  type="password"
                />
              </div>
            </div>
          </div>
          <br />
          <div class="row textsize-2">
            <div class="col-md-4 col-lg-4 text-left">
              <input
                type="checkbox"
                id="saveId"
                name="checkId"
                style="margin-top: 5px"
                class="bg-lightgreen"
              />

              <span class="text">ID Saving </span>
            </div>
            <div class="col-md col-lg text-right">
              <a href="${contextPath}/member/idSearchForm.do">Search ID</a>
              /
              <a href="${contextPath}/member/idSearchForm.do"
                >Search PWD</a
              >
              /
              <a href="${contextPath}/member/registerTypeSelect.do"
                >Member Registration</a
              >
            </div>
          </div>
          <br />
          <div class="row">
            <div class="col text-center">
              <button
                type="submit"
                class="bg-lightgreen textcolor-black textsize-3 textbold border-0 btn-long"
              >
                Login
              </button>
            </div>
          </div>
          <br />

          <div class="row">
            <div class="col">
              <a
                id="kakao-btn"
                class="d-flex justify-content-center align-items-center"
                href="${contextPath}/kakao/loginForm.do"
              >
                <img src="${contextPath}/img/icon/kakao.png" />
                KAKAO Login
              </a>
            </div>

            <div class="col">
              <a
                id="naver-btn"
                class="d-flex justify-content-center align-items-center"
                href="${contextPath}/naver/loginForm.do"
              >
                <img src="${contextPath}/img/icon/naver.png" />
                NAVER Login
              </a>
            </div>
          </div>
          <div class="row">&nbsp;</div>
        </div>
      </div>
    </form>
  </body>
</html>
