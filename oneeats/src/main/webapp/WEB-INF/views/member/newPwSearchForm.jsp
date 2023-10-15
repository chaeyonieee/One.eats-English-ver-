<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />
    <meta charset="UTF-8" />
    <title>Search Password</title>
    <style>
      .redText {
        color: red;
      }
      .blueText {
        color: green;
      }
    </style>

    <script>
      var check_map = new Map([
        ["pwd", false],
        ["pwd_confirm", false],
      ]);

      var pwd_input_text = "";
      var pwd_check_text = "-1";
      var contextPath = "${contextPath}";

      function changeMessage(elname, str, clr) {
        $("#errmsg_" + elname).removeClass();
        $("#errmsg_" + elname).addClass(clr + "Text");
        if (str.length < 1) {
          $("#errmsg_" + elname).html("&nbsp;");
        } else {
          $("#errmsg_" + elname).text(str);
        }
      }
      $(document).ready(function () {
        $("#pwd").on("input", function () {
          var puttedText = $(this).val();
          pwd_input_text = puttedText;
          var regex = /[^a-zA-Z0-9!@#$%^&*()]/;
          var regex2 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).+$/;
          if (puttedText.length < 8) {
            changeMessage("pwd", "Password is too short.", "red");
          } else if (puttedText.length > 12) {
            changeMessage("pwd", "Password is too long.", "red");
          } else if (regex.test(puttedText)) {
            changeMessage(
              "pwd",
              "Password can only contain letters, numbers, or special characters (!@#$%^&()).",
              "red"
            );
          } else if (!regex2.test(puttedText)) {
            changeMessage(
              "pwd",
              "Password must contain at least one letter, one number, and one special character.",
              "red"
            );
          } else {
            if (pwd_check_text != "-1" && pwd_check_text != puttedText) {
              changeMessage("pwd_confirm", "Passwords do not match.", "red");
              check_map.set("pwd_confirm", false);
            } else {
              changeMessage("pwd_confirm", "", "blue");
              check_map.set("pwd_confirm", true);
            }
            changeMessage("pwd", "", "blue");
            check_map.set("pwd", true);
          }
        });

        $("#pwd_confirm").on("input", function () {
          var puttedText = $(this).val();
          var regex = /[^a-zA-Z0-9!@#~]/;
          pwd_check_text = puttedText;
          if (puttedText != pwd_input_text) {
            changeMessage("pwd_confirm", "Passwords do not match.", "red");
            check_map.set("pwd_confirm", false);
          } else {
            changeMessage("pwd_confirm", "", "blue");
            check_map.set("pwd_confirm", true);
          }
        });
      });

      $("#registerForm").submit(function (event) {
        event.preventDefault();

        for (let [key, value] of check_map) {
          console.log(key, value);
          if (value == false) {
            alert("Please re-enter.");
            $("#" + key).focus();
            return false;
          }
        }

        $(this).unbind("submit").submit();
      });
    </script>
  </head>
  <body>
    <form method="post" action="${contextPath}/member/updatePw.do">
      <br />
      <br />
      <br />
      <div class="main-container">
        <div class="main-wrap">
          <div class="row">
            <div class="col textbold textsize-4 text-center">
              <span>Search Password</span>
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">
            <div class="col-md-3">Register a new password</div>
            <div class="col-md">
              <input
                class="form-control"
                id="pwd"
                name="pwd"
                placeholder="Please enter a new password."
                type="password"
              />
            </div>
          </div>

          <div class="row">
            <div class="col">
              <div id="errmsg_pwd">&nbsp;</div>
            </div>
          </div>

          <div class="row">
            <div class="col-md-3">New Password Confirm</div>
            <div class="col-md">
              <input
                id="pwd_confirm"
                class="form-control"
                placeholder="Please re-enter the new password."
                type="password"
              />
            </div>
          </div>
          <div class="row">
            <div class="col">
              <div id="errmsg_pwd_confirm">&nbsp;</div>
            </div>
          </div>

          <div class="row">
            <div class="col">
              <button
                type="submit"
                class="bg-lightgreen textbold border-0 btn-long"
              >
                Confirm
              </button>
            </div>
          </div>
        </div>
      </div>
      <br />
      <br />
    </form>
  </body>
</html>
