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
    <title>Login page</title>
    <style>
      .fade {
        display: none;
      }
      .fade.active {
        display: inherit;
      }

      .nav-link.active {
        background-color: rgb(226, 226, 226);
      }
    </style>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />

    <script>
      var contextPath = "${contextPath}";
      var check_map = new Map([
        ["phone1", false],
        ["phone2", false],
      ]);

      function changeMessage(elname, str, clr) {
        $("#errmsg_" + elname).removeClass();
        $("#errmsg_" + elname).addClass(clr + "Text");
        if (str.length < 1) {
          $("#errmsg_" + elname).html("&nbsp;");
        } else {
          $("#errmsg_" + elname).text(str);
        }
      }
      function fn_phone_inzung(num) {
        var phone_text = $("#phone" + num).val();
        var inzung_bunho = $("#inzung" + num).val();

        $.ajax({
          type: "post",
          async: true,
          dataType: "text",
          data: {
            bunho: inzung_bunho,
            phone: phone_text,
          },
          url: contextPath + "/phoneInzung.do",
          success: function (data, textStatus) {
            if (data == "success") {
              changeMessage("inzung" + num, "You have been verified.", "blue");
              $("#phone" + num).attr("readonly", "readonly");
              $("#inzung" + num).attr("readonly", "readonly");
              check_map.set("phone" + num, true);
            } else if (data == "fail") {
              changeMessage("inzung" + num, "Not authenticated.", "red");
            } else {
              changeMessage(
                "inzung" + num,
                "An error of unknown cause occurred",
                "red"
              );
            }
          },
          error: function (xhr, status, error) {
            alert("An error occurred");
          },
          complete: function (data) {
            // alert("The process has been successfully completed.");
          },
        });
      }

      function fn_open_inzung_row(num) {
        var phone_text = $("#phone" + num).val();
        var regex = /[^a-zA-Z0-9]/;
        phone_text = phone_text.replace(/-/g, "");

        if (phone_text.length < 8 || regex.test(phone_text)) {
          alert("Please enter a phone number");
          $("#phone" + num).focus();
        } else {
          $("#phone" + num).val(phone_text);
          $(".inzung_row" + num).show();
        }
      }

      $(document).ready(function () {
        $(".nav-link").click(function () {
          $(".nav-link").removeClass("active");
          $(this).addClass("active");

          // Hide all tab content
          $(".tab-pane").removeClass("show active");

          $($(this).attr("href")).addClass("show active");
        });

        $("#registerForm1").submit(function (event) {
          event.preventDefault();
          if (check_map.get("phone1") == false) {
            alert("Please verify your phone number.");
            return false;
          }
          $(this).unbind("submit").submit();
        });

        $("#registerForm2").submit(function (event) {
          if (check_map.get("phone2") == false) {
            alert("Please verify your phone number.");
            return false;
          }
          $(this).unbind("submit").submit();
        });
      });
    </script>
  </head>
  <body>
    <br />
    <br />
    <br />
    <div class="main-container">
      <div class="main-wrap">
        <div class="row textsize-3 textbold text-center">
          <div class="col-md">
            <a
              id="id_search_btn"
              class="nav-link active"
              role="tab"
              data-toggle="tab"
              href="#tab1"
              aria-selected="true"
              >Search ID</a
            >
          </div>

          <div class="col-md">
            <a
              id="pw_search_btn"
              class="nav-link"
              role="tab"
              data-toggle="tab"
              href="#tab2"
              aria-selected="false"
              >Search Password</a
            >
          </div>
        </div>
        <hr class="line-black" />
        <br />

        <div
          class="id_search_form tab-pane fade show active"
          role="tabpanel"
          id="tab1"
        >
          <form
            action="${contextPath}/member/idSearch.do"
            method="post"
            id="registerForm1"
          >
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">Name</div>
              <div class="col-md">
                <input
                  class="form-control"
                  name="name"
                  placeholder="Please enter your name"
                  type="text"
                />
              </div>
            </div>
            <br />
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">Phone Number</div>
              <div class="col-md input-group">
                <input
                  class="form-control"
                  id="phone1"
                  name="phone"
                  placeholder="Please enter your phone number"
                  type="text"
                />
                <div class="input-group-append">
                  <button
                    type="button"
                    class="bg-lightgray border-0"
                    onclick="fn_open_inzung_row(1)"
                  >
                    Request verification code
                  </button>
                </div>
              </div>
            </div>
            <br />
            <div class="row inzung_row1 toggle-content">
              <div class="col">
                <div class="row">
                  <div class="col-md-3"></div>
                  <div class="col-md input-group">
                    <input
                      class="form-control"
                      id="inzung1"
                      placeholder="Please enter the verification code."
                      type="text"
                    />
                    <div class="input-group-append">
                      <button
                        type="button"
                        onclick="fn_phone_inzung(1)"
                        class="bg-lightgreen border-0"
                      >
                        Verification code Confirm
                      </button>
                    </div>
                  </div>
                </div>
                <br />
                <div id="errmsg_inzung1"></div>
                <div class="row">
                  <div class="col">
                    <span class="textsize-0 textcolor-red"></span>
                      you haven't received the verification code, <br />
                      Please confirm whether there is a communication provider or phone number block.</span
                    ><br />
                  </div>
                </div>
              </div>
            </div>
            <br />
            <button type="submit" class="btn-long bg-lightgreen border-0">
              Confirm
            </button>
          </form>
        </div>

        <div class="pw_search_form tab-pane fade" role="tabpanel" id="tab2">
          <form
            action="${contextPath}/member/pwdSearch.do"
            method="post"
            id="registerForm2"
          >
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">ID</div>
              <div class="col-md">
                <input
                  class="form-control"
                  name="id"
                  placeholder="Please enter your ID."
                  type="text"
                />
              </div>
            </div>
            <br />
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">Name</div>
              <div class="col-md">
                <input
                  class="form-control"
                  name="name"
                  placeholder="Please enter the name"
                  type="text"
                />
              </div>
            </div>
            <br />
            <div class="row text-left textbold">
              <div class="col-md-3 d-flex align-items-center">
                Phone Number
              </div>
              <div class="col-md input-group">
                <input
                  class="form-control"
                  id="phone2"
                  name="phone"
                  placeholder="Please enter your phone number"
                  type="text"
                />
                <div class="input-group-append">
                  <button
                    type="button"
                    class="bg-lightgray border-0"
                    onclick="fn_open_inzung_row(2)"
                  >
                    Request verification code
                  </button>
                </div>
              </div>
            </div>
            <br />
            <div class="row inzung_row2 toggle-content">
              <div class="col">
                <div class="row">
                  <div class="col-md-3"></div>
                  <div class="col-md input-group">
                    <input
                      class="form-control"
                      id="inzung2"
                      placeholder="Please enter the verification code."
                      type="text"
                    />
                    <div class="input-group-append">
                      <button
                        class="bg-lightgray border-0"
                        type="button"
                        onclick="fn_phone_inzung(2)"
                      >
                        Verification Code Confirm
                      </button>
                    </div>
                  </div>
                </div>
                <br />
                <div id="errmsg_inzung2"></div>
                <div class="row">
                  <div class="col">
                    <span class="textsize-0 textcolor-red btn-midlong textbold"
                      >If you haven't received the verification code, <br />
                     Please confirm whether there is a communication provider or phone number block.
                    </span
                    ><br />
                  </div>
                </div>
              </div>
            </div>
            <br />
            <button type="submit" class="btn-long bg-lightgreen border-0">
              Confirm
            </button>
          </form>
        </div>
      </div>
    </div>
    <br />
    <br />
    <br />
    <br />
  </body>
</html>
