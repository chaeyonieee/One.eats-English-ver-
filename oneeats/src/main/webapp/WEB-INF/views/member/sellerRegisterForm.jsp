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
    <title>Business Member Registration</title>
    <style>
      .redText {
        color: red;
      }
      .blueText {
        color: green;
      }
      .fade {
        display: none;
      }
      .fade.active {
        display: inherit;
      }

      a.active {
        background-color: rgb(226, 226, 226);
        border-top: 4px solid #fcf75e;
      }
      .brd-lightgreen {
        border: 0.5px;
        border-style: solid;
        border-color: #fcf75e;
      }
      .sellermain-wrap {
        max-width: 600px;
        margin: auto;
      }
      .seller_registerForm_wrap {
        max-width: 600px;
        margin: auto;
      }
      .seller_registerForm_header {
        max-width: 600px;
      }
      .sellermain-wrap .main-wrap {
        padding: 8px;
      }

      .sellermain-wrap .main-wrap a {
        min-width: 120px;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .seller_registerForm_wrap .main-wrap {
        min-height: auto;
      }
    </style>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />

    <!-- next 주소 api 스크립트 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      function execDaumPostCode() {
        new daum.Postcode({
          oncomplete: function (data) {
            var addr = ""; // 주소 변수
            var extraAddr = ""; // Additional Information 변수

            if (data.userSelectedType === "R") {
              addr = data.roadAddress;
            } else {
              addr = data.jibunAddress;
            }

            if (data.userSelectedType === "R") {
              if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }

              if (data.buildingName !== "" && data.apartment === "Y") {
                extraAddr +=
                  extraAddr !== ""
                    ? ", " + data.buildingName
                    : data.buildingName;
              }

              if (extraAddr !== "") {
                extraAddr = " (" + extraAddr + ")";
              }

              document.getElementById("address_extra_input").value = extraAddr; //Additional Information
            } else {
              document.getElementById("address_extra_input").value = "";
            }

            document.getElementById("h_input_zipcode").value = data.zonecode; // 우편번호
            document.getElementById("address_input").value = addr;

            document.getElementById("address_detail_input").focus(); // 상세주소
          },
        }).open();
      }
    </script>
    <!--next 주소 api 스크립트 종료-->

    <script>
      var check_map = new Map([
        ["id", false],
        ["pwd", false],
        ["pwd_confirm", false],
        ["phone", false],
        ["busNo", false],
      ]);
      var pwd_input_text = "";
      var pwd_check_text = "-1";
      var contextPath = "${contextPath}";
      $(document).ready(function () {
        $(".nav-link").click(function () {
          $(".nav-link").removeClass("active");
          $(this).addClass("active");

          $(".tab-pane").removeClass("show active");

          $($(this).attr("href")).addClass("show active");

          var num = $(this).attr("value");
          $("a.tab-menu").removeClass("active");
          $("#register" + num).addClass("active");
        });
      });

      function fn_bus_inzung() {
        var inzung_bunho = $("input[name=busNo]").val();
        var regex = /[^0-9]/;
        if (regex.test(inzung_bunho)) {
          alert("Please enter the correct verification code");
          return false;
        }

        var path = contextPath + "/busInzung.do";
        $.ajax({
          type: "post",
          async: true,
          dataType: "text",
          data: {
            bunho: inzung_bunho,
          },
          url: path,
          success: function (data, textStatus) {
            if (data == "success") {
              alert("You have been verified.");
              $("input[name=busNo]").attr("readonly", "readonly");
              check_map.set("busNo", true);
            } else if (data == "fail") {
              alert("Authentication failed.");
            } else {
              alert("An error of unknown cause occurred");
            }
          },
          error: function (xhr, status, error) {
            alert("Error occurred");
          },
          complete: function (data) {
            // alert("The process has been successfully completed.");
          },
        });
      }
    </script>
    <script src="${contextPath}/js/registerForm.js"></script>
  </head>
  <body>
    <form
      method="post"
      id="registerForm"
      action="${contextPath}/member/sellerRegister.do"
    >
      <br />
      <br />
      <br />
      <div class="main-container">
        <div class="sellermain-wrap">
          <div class="textsize-3 textbold">
            <div class="mainline"></div>

            <div class="seller_registerForm_header">
              <div class="row">
                <div class="col">
                  <c:choose>
                    <c:when test="${empty registerResult}">
                      <a id="register1" class="tab-menu active"
                        >Business Verification</a
                      >
                    </c:when>
                    <c:otherwise>
                      <a id="register1" class="tab-menu"
                        >Business Verification</a
                      >
                    </c:otherwise>
                  </c:choose>
                </div>
                <div class="col">
                  <a id="register2" class="tab-menu">Agree to Terms</a>
                </div>
                <div class="col">
                  <a id="register3" class="tab-menu">Enter Information</a>
                </div>
                <div class="col">
                  <c:choose>
                    <c:when test="${empty registerResult}">
                      <a id="register4" class="tab-menu"
                        >Registration Complete</a
                      >
                    </c:when>
                    <c:otherwise>
                      <a id="register4" class="tab-menu active"
                        >Registration Complete</a
                      >
                    </c:otherwise>
                  </c:choose>
                </div>
              </div>
            </div>

            <br />
            <hr class="line-black" />
            <div class="seller_registerForm_wrap">
              <c:choose>
                <c:when test="${empty registerResult}">
                  <div
                    class="busNo-container brd-lightgreen tab-pane fade show active"
                    role="tabpanel"
                    id="tab1"
                  >
                    <div class="main-wrap">
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <span class="textsize-3">Welcome to One.EATS.</span>
                          <hr class="line-gray" />
                          <span class="textsize-2"
                            >This is the Business Member Registration
                            page.</span
                          >
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col input-group">
                          <input
                            class="form-control"
                            name="busNo"
                            maxlength="10"
                            placeholder="Business registration number, 10 digits"
                            value="${busNo}"
                          />
                          <div class="input-group-append">
                            <button
                              onclick="fn_bus_inzung()"
                              type="button"
                              class="bg-lightgreen textsize-2 border-0"
                            >
                              Verification
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <div
                            class="text-center textsize-1"
                            style="font-size: 16px"
                          >
                            To join as a Business Member, Business registration
                            certificate verification is required.

                            <br />
                            Please prepare your Business registration
                            certificate in advance.
                          </div>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <a
                            href="#tab2"
                            class="nav-link btn-long bg-lightgreen textsize-2 border-0"
                            role="tab"
                            data-toggle="tab"
                            value="2"
                          >
                            Next
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div
                    class="agreement-container tab-pane fade"
                    role="tabpanel"
                    id="tab2"
                  >
                    <div class="main-wrap">
                      <div class="row">&nbsp;</div>
                      <div class="row agreement_box_grid">
                        <div class="col">
                          <div class="row toggle-btn border-bottom">
                            <div class="col agreement_box_col">
                              <input
                                class="text-left"
                                type="checkbox"
                                id="allcheck"
                              /><span>Total agree to the Terms</span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <br />
                      <div class="row agreement_box_grid">
                        <div class="col">
                          <div class="row toggle-btn border-bottom">
                            <div class="col" style="font-size: 16px">
                              [Mandatory] Service Usage agree to the Terms
                            </div>
                            <div class="float-right">
                              <img
                                class="agreement_arrow_icon"
                                src="${contextPath}/img/icon/downarrow.png"
                                alt=""
                              />
                            </div>
                          </div>
                          <div class="row toggle-content">
                            <div class="col-md">
                              <div class="row">
                                <div class="col" style="font-size: 16px">
                                  Terms of Use Content <br />
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md agreement_box_col">
                              <span style="font-size: 16px"
                                >Agree to the terms and conditions of the
                                content.</span
                              >
                              <input
                                class="req_checkbox check_box"
                                type="checkbox"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <br />
                      <div class="row agreement_box_grid">
                        <div class="col">
                          <div class="row toggle-btn border-bottom">
                            <div class="col" style="font-size: 16px">
                              [Mandatory] Agree to the collection and use of
                              personal information
                            </div>
                            <div class="float-right">
                              <img
                                class="agreement_arrow_icon"
                                src="${contextPath}/img/icon/downarrow.png"
                                alt=""
                              />
                            </div>
                          </div>
                          <div class="row toggle-content">
                            <div class="col-md">
                              <div class="row">
                                <div class="col" style="font-size: 16px">
                                  Terms of Use Content <br />
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md agreement_box_col">
                              <span style="font-size: 16px"
                                >Agree to the terms and conditions of the
                                content.</span
                              >
                              <input
                                class="req_checkbox check_box"
                                type="checkbox"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <br />
                      <div class="row agreement_box_grid">
                        <div class="col select-check">
                          <div class="row border-bottom">
                            <div class="col" style="font-size: 16px">
                              [Optional] Consent to receive information and
                              benefits such as urgent Discount Price<br />
                            </div>
                          </div>
                          <div class="row">
                            <div class="col agreement_box_col">
                              <input
                                type="checkbox"
                                name="sms_agreement"
                                class="check_box"
                                value="yes"
                              />
                              <span>SMS</span>
                              <input
                                class="check_box"
                                type="checkbox"
                                name="email_agreement"
                                value="yes"
                              /><span>Email</span>
                            </div>
                          </div>
                        </div>
                      </div>
                      <br />
                      <div class="row agreement_box_grid">
                        <div class="col agreement_box_col">
                          <span style="font-size: 16px"
                            >[Mandatory] I am over 14 years old.</span
                          ><input
                            class="req_checkbox check_box"
                            type="checkbox"
                          />
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <a
                            class="btn-long bg-lightgreen nav-link btn-long bg-lightgreen textsize-2 border-0"
                            href="#tab1"
                            role="tab"
                            data-toggle="tab"
                            value="1"
                          >
                            Previous
                          </a>
                        </div>
                        <div class="col">
                          <a
                            class="btn-long bg-lightgreen nav-link btn-long bg-lightgreen textsize-2 border-0"
                            href="#tab3"
                            role="tab"
                            data-toggle="tab"
                            value="3"
                          >
                            Next
                          </a>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">&nbsp;</div>
                    </div>
                  </div>
                  <div
                    class="form-container tab-pane fade"
                    role="tabpanel"
                    id="tab3"
                  >
                    <div class="main-wrap">
                      <div class="row">
                        <div class="col textsize-3 textbold text-center">
                          Member Registration
                          <div class="line-black"></div>
                          <br />
                          <br />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="textbold textsize-2 text-left">
                            <span>ID<span class="textcolor-red">*</span></span>
                          </div>
                        </div>
                        <div class="col-md input-group">
                          <input
                            class="form-control"
                            id="id"
                            name="id"
                            placeholder="Please enter your ID"
                            type="text"
                            value="${id}"
                            required
                          />
                          <div class="input-group-append">
                            <button
                              class="bg-lightgreen border-0 textsize-2 textbold"
                              type="button"
                              onclick="checkDuplicateId()"
                            >
                              Confirmation
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_id">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="textbold textsize-2 text-left">
                            <span>
                              Password<span class="textcolor-red">*</span>
                            </span>
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            id="pwd"
                            name="pwd"
                            placeholder="8-12 characters including letters, numbers, and special characters"
                            value="${pwd}"
                            type="password"
                            required
                          />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_pwd">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="text-left textsize-2 textbold">
                            <span>
                              Password Confirm<span class="textcolor-red"
                                >*</span
                              >
                            </span>
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            placeholder="Please re-enter the password"
                            id="pwd_confirm"
                            type="password"
                            required
                          />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_pwd_confirm">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="text-left textsize-2 textbold">
                            <span
                              >Name<span class="textcolor-red">*</span></span
                            >
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            id="name"
                            name="name"
                            placeholder="Please enter your name"
                            value="${name}"
                            type="text"
                            required
                          />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md" id="errmsg_name">&nbsp;</div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="text-left textsize-2 textbold">
                            <span>Email</span>
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            id="email"
                            name="email"
                            placeholder="Please enter your email"
                            value="${email}"
                            type="text"
                          />
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_email">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3 d-flex align-items-center">
                          <div class="text-left textsize-2 textbold">
                            <span
                              >Phone Number
                              <span class="textcolor-red">*</span></span
                            >
                          </div>
                        </div>
                        <div class="col-md input-group">
                          <input
                            class="form-control"
                            id="phone"
                            name="phone"
                            placeholder="Please enter your Phone Number"
                            type="text"
                            value="${phone}"
                            required
                          />
                          <div class="input-group-append">
                            <button
                              class="bg-lightgreen border-0 textsize-2 textbold"
                              onclick="fn_open_inzung_row()"
                              style="height: 38px"
                              type="button"
                            >
                              verification
                            </button>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md">
                          <span id="errmsg_phone">&nbsp;</span>
                        </div>
                      </div>
                      <div class="row toggle-content inzung_row">
                        <div class="col">
                          <div class="row">
                            <div class="col input-group">
                              <input
                                class="form-control"
                                id="inzung"
                                name="inzung_bunho"
                                placeholder="Please enter the verification code"
                                type="text"
                              />
                              <div class="input-group-append">
                                <button
                                  onclick="fn_phone_inzung()"
                                  type="button"
                                  class="border-0 textsize-2 textbold"
                                >
                                  Verification
                                </button>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md">
                              <span id="errmsg_inzung">&nbsp;</span>
                            </div>
                          </div>
                          <br />
                          <div class="row">
                            <div class="col">
                              If you haven't received the verification code,
                              <br />
                              Please confirm whether there is a communication
                              provider or phone number block.
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col-md-3 text-left textsize-2 textbold">
                          <span class="">Address</span>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <input
                        type="hidden"
                        id="h_input_zipcode"
                        placeholder="Zipcode"
                        name="zipCode"
                        value="${zipCode}"
                      />
                      <div class="row">
                        <div class="col">
                          <input
                            class="form-control textsize-2"
                            name="address"
                            type="text"
                            id="address_input"
                            placeholder="Address"
                            value="${address}"
                            readonly
                          />
                        </div>
                        <div class="col">
                          <input
                            class="form-control"
                            type="text"
                            id="address_extra_input"
                            placeholder="Additional Information"
                            readonly
                          />
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <input
                            class="form-control"
                            name="address_detail"
                            type="text"
                            id="address_detail_input"
                            value="${address_detail}"
                            placeholder="Please enter the detailed address."
                          />
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <button
                            type="button"
                            onclick="execDaumPostCode()"
                            class="bg-lightgreen btn-long border-0 textsize-2 textbold"
                          >
                            Search Address
                          </button>
                        </div>
                      </div>

                      <br />
                      <div class="row">
                        <div class="col-md-3">
                          <div class="text-left textsize-2 textbold">
                            <span>Gender</span>
                          </div>
                        </div>
                        <div class="col-md select-radio">
                          <input type="radio" name="gender" value="m" /><span
                            class="textsize-2"
                            >Male</span
                          >
                          <input type="radio" name="gender" value="w" /><span
                            class="textsize-2"
                            >Female</span
                          >
                          <input
                            type="radio"
                            name="gender"
                            value="no"
                            checked
                          /><span class="textsize-2">Not selected</span>
                        </div>
                      </div>
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col-md-3">
                          <div class="text-left textsize-2 textbold">
                            <span>Date of birth</span>
                          </div>
                        </div>
                        <div class="col-md">
                          <input
                            class="form-control"
                            name="birth"
                            placeholder="  YYYY  -  MM  -  DD"
                            type="date"
                            value="${birth}"
                          />
                        </div>
                      </div>
                      <br />
                      <div class="line"></div>
                      <br />
                      <div class="row">
                        <div class="col">
                          <a
                            class="btn-long bg-lightgreen nav-link btn-long bg-lightgreen textsize-2 border-0"
                            href="#tab2"
                            role="tab"
                            data-toggle="tab"
                            value="2"
                          >
                            Previous
                          </a>
                        </div>
                        <div class="col">
                          <button
                            type="submit"
                            class="bg-lightgreen textsize-2 border-0 btn-long textbold"
                          >
                            Member Registration Complete
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </c:when>
                <c:otherwise>
                  <div
                    class="brd-lightgreen tab-pane fade show active"
                    role="tabpanel"
                    id="tab4"
                  >
                    <div class="main-wrap">
                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <span class="textsize-3"
                            >Welcome to One.EATS as a member.</span
                          ><br />
                          <span class="textsize-2"
                            >Experience a variety of benefits after logging
                            in.</span
                          >
                        </div>
                      </div>

                      <div class="row">&nbsp;</div>
                      <div class="row">
                        <div class="col">
                          <button
                            type="button"
                            onclick="location.href='${contextPath}/member/loginForm.do'"
                            class="bg-lightgreen btn-long border-0 textsize-2"
                          >
                            Login
                          </button>
                        </div>
                        <div class="row">&nbsp;</div>
                        <div class="row">&nbsp;</div>
                      </div>
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <br />
        </div>
      </div>
    </form>
  </body>
</html>
