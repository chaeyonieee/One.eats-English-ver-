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
    <title>Member Registration 창</title>

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
      // next 주소 api 스크립트 종료
    </script>

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
        ["id", false],
        ["pwd", false],
        ["pwd_confirm", false],
        ["phone", false],
      ]);

      var pwd_input_text = "";
      var pwd_check_text = "-1";
      var contextPath = "${contextPath}";
      var inzung_interval_id = "";
    </script>
    <link rel="stylesheet" href="${contextPath}/css/loginForm.css" />
    <script src="${contextPath}/js/registerForm.js"></script>
  </head>
  <body>
    <br />
    <form
      id="registerForm"
      method="post"
      action="${contextPath}/member/register.do"
    >
      <br />
      <br />
      <br />
      <div class="main-container">
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
                required
              />
              <div class="input-group-append">
                <button
                  class="bg-lightgreen border-0"
                  type="button"
                  onclick="checkDuplicateId()"
                >
                  Duplicate Confirmation
                </button>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md"><span id="errmsg_id">&nbsp;</span></div>
          </div>
          <div class="row">
            <div class="col-md-3 d-flex align-items-center">
              <div class="textbold textsize-2 text-left">
                <span> Password<span class="textcolor-red">*</span> </span>
              </div>
            </div>
            <div class="col-md">
              <input
                class="form-control"
                id="pwd"
                name="pwd"
                placeholder="8-12 characters including letters, numbers, and special characters"
                type="password"
                required
              />
            </div>
          </div>

          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md"><span id="errmsg_pwd">&nbsp;</span></div>
          </div>
          <div class="row">
            <div class="col-md-3 d-flex align-items-center">
              <div class="text-left textsize-2 textbold">
                <span>
                  Password Confirm<span class="textcolor-red">*</span>
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
                <span>Name<span class="textcolor-red">*</span></span>
              </div>
            </div>
            <div class="col-md">
              <input
                class="form-control"
                id="name"
                name="name"
                placeholder="Please enter your name"
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
                type="text"
              />
            </div>
          </div>
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md"><span id="errmsg_email">&nbsp;</span></div>
          </div>
          <div class="row">
            <div class="col-md-3 d-flex align-items-center">
              <div class="text-left textsize-2 textbold">
                <span>Phone Number<span class="textcolor-red">*</span></span>
              </div>
            </div>
            <div class="col-md input-group">
              <input
                class="form-control"
                id="phone"
                name="phone"
                placeholder="Please enter your Phone Number"
                type="text"
                required
              />
              <div class="input-group-append">
                <button
                  class="bg-lightgreen border-0"
                  onclick="fn_open_inzung_row()"
                  type="button"
                >
                  verification code rquest
                </button>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md"><span id="errmsg_phone">&nbsp;</span></div>
          </div>
          <div class="row toggle-content inzung_row">
            <div class="col">
              <div class="row">
                <div class="col-md-3 d-flex align-items-center">
                  <span>
                    <input type="hidden" id="inzung_time" value="" />
                    Remaining Time <span id="phone_inzung_time_text">5:00</span>
                  </span>
                </div>
                <div class="col-md input-group">
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
                      class="border-0"
                    >
                      Verification
                    </button>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md"><span id="errmsg_inzung">&nbsp;</span></div>
              </div>
              <br />
              <div class="row">
                <div class="col">
                  If you haven't received the verification code, <br />
                  Please confirm whether there is a communication provider or
                  phone number block.
                </div>
              </div>
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">
            <div class="col-md-3 text-left textsize-2 textbold">
              <span class="">Address </span>
            </div>
          </div>

          <div class="row">&nbsp;</div>
          <input
            type="hidden"
            id="h_input_zipcode"
            placeholder="Zipcode"
            name="zipCode"
          />

          <div class="row">
            <div class="col">
              <input
                class="form-control"
                name="address"
                type="text"
                id="address_input"
                placeholder="Address"
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
                class="bg-lightgreen btn-long border-0 btn-border "
              >
                Address Search
              </button>
            </div>
          </div>
          <input type="hidden" id="h_input_zipcode" name="zipCode" />
          <br />
          <div class="row">
            <div class="col-md-3 d-flex align-items-center">
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
              <input type="radio" name="gender" value="no" checked /><span
                class="textsize-2"
                >Not selected</span
              >
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">
            <div class="col-md-3 d-flex align-items-center">
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
              />
            </div>
          </div>

          <br />
          <div class="line"></div>

          <br />
          <div class="agreement-container">
            <div class="row">
              <div
                class="col text-left textsize-2 margin1 textbold select-check"
              ></div>
            </div>
            <br />

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
                  <div class="col">
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
                      <div class="col">Terms of Use Content <br /></div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md agreement_box_col">
                    <span
                      >Agree to the terms and conditions of the content.</span
                    >
                    <input class="req_checkbox check_box" type="checkbox" />
                  </div>
                </div>
              </div>
            </div>
            <br />
            <div class="row agreement_box_grid">
              <div class="col">
                <div class="row toggle-btn border-bottom">
                  <div class="col">
                    [Mandatory] Agree to the collection and use of personal
                    information
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
                      <div class="col">Terms of Use Content <br /></div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md agreement_box_col">
                    <span
                      >Agree to the terms and conditions of the content.</span
                    >
                    <input class="req_checkbox check_box" type="checkbox" />
                  </div>
                </div>
              </div>
            </div>
            <br />

            <div class="row agreement_box_grid">
              <div class="col select-check">
                <div class="row border-bottom">
                  <div class="col">
                    [Optional] Consent to receive information and benefits such
                    as urgent Discount Price<br />
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
                <span>[Mandatory] I am over 14 years old.</span
                ><input class="req_checkbox check_box" type="checkbox" />
              </div>
            </div>
          </div>
          <br />
          <div class="row">
            <div class="col">
              <button
                type="submit"
                class="bg-lightgreen textsize-2 border-0 btn-long btn-border"
              >
                Member Registration Complete
              </button>
            </div>
          </div>
        </div>
      </div>
    </form>

    <br />
  </body>
</html>
