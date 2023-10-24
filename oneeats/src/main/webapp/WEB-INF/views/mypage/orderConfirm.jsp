<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order하기</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy2.css" />

    <!-- Order Request Direct input 선택했을 때 input창 떠요 -->
    <script>
      $(function () {
        $("#selboxDirect").hide();

        $("#selbox").change(function () {
          if ($("#selbox").val() == "direct") {
            $("#selboxDirect").show();
          } else {
            $("#selboxDirect").hide();
          }
        });
      });
    </script>

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
            } else {
            }
            var zipCode = data.zonecode;
            var choizongzuso = "(" + zipCode + ")" + addr;
            document.getElementById("h_input_zipCode").value = zipCode;
            document.getElementById("address_input").value = choizongzuso;

            document.getElementById("address_detail_input").focus();
          },
        }).open();
      }
    </script>
    <!--next 주소 api 스크립트 끝-->

    <script>
      function fn_changeText(d_price, t_price) {
        $("input[name=discount_price]").val(d_price);
        $("#discount_price_text").text("-" + d_price + "won");
        $("input[name=total_price]").val(t_price);
        $("#total_price_text").text(t_price + "won");
      }
      $(document).ready(function () {
        $("#used_point").on("change", function () {
          var used_point = parseInt($("#used_point").val());
          var original_discount_price = parseInt(
            $("#h_original_discount_price").val()
          );
          var coupon_discount_price = parseInt(
            $("#h_coupon_discount_price").val()
          );
          var payment_price = parseInt($("input[name=payment_price]").val());
          var new_total_price =
            payment_price -
            used_point -
            coupon_discount_price -
            original_discount_price;
          if (new_total_price < 0) {
            alert("Points cannot be use anymore.");
            $(this).val(0);
            used_point = 0;
            new_total_price =
              payment_price -
              used_point -
              coupon_discount_price -
              original_discount_price;
          }
          var new_discount_price =
            used_point + coupon_discount_price + original_discount_price;
          fn_changeText(new_discount_price, new_total_price);
        });

        $("select[name=used_couponId]").on("change", function () {
          var couponNo = $(this).val();
          console.log("couponNo:" + couponNo);
          if (parseInt(couponNo) != 0) {
            $.ajax({
              type: "POST",
              url: "/mypage/selectCoupon.do",
              data: {
                couponNo: couponNo,
              },
              success: function (response) {
                console.log(response);
                var result = response.result;

                if (result == "success") {
                  console.log("success if run");
                  var total_price = parseInt(
                    $("input[name=total_price]").val()
                  );
                  if (parseInt(response.condition) > total_price) {
                    alert(
                      "Coupon Select a usage conditions were not satisfied."
                    );
                  } else {
                    var discount_price = parseInt(response.discount_price);
                    $("#h_coupon_discount_price").val(discount_price);
                    var used_point = parseInt($("#used_point").val());
                    var original_discount_price = parseInt(
                      $("#h_original_discount_price").val()
                    );
                    var payment_price = parseInt(
                      $("input[name=payment_price]").val()
                    );
                    var coupon_discount_price = discount_price;
                    var new_total_price =
                      payment_price -
                      used_point -
                      coupon_discount_price -
                      original_discount_price;
                    if (new_total_price < 0) {
                      alert("Unable to use Coupon.");
                      $(this).val(0);
                      $("#h_coupon_discount_price").val(0);
                      coupon_discount_price = 0;
                      new_total_price =
                        payment_price -
                        used_point -
                        coupon_discount_price -
                        original_discount_price;
                    }
                    var new_discount_price =
                      used_point +
                      coupon_discount_price +
                      original_discount_price;
                    console.log(coupon_discount_price);
                    fn_changeText(new_discount_price, new_total_price);
                  }
                } else {
                  alert("Failed to get Coupon information.");
                }
              },
              error: function (response) {
                alert("An error of unknown cause");
                console.log(response);
              },
            });
          } else {
            var used_point = parseInt($("#used_point").val());
            var original_discount_price = parseInt(
              $("#h_original_discount_price").val()
            );
            var payment_price = parseInt($("input[name=payment_price]").val());
            var coupon_discount_price = 0;
            var new_total_price =
              payment_price -
              used_point -
              coupon_discount_price -
              original_discount_price;
            var new_discount_price =
              used_point + coupon_discount_price + original_discount_price;
            console.log(coupon_discount_price);
            fn_changeText(new_discount_price, new_total_price);
          }
        });
      });
    </script>
  </head>
  <body>
    <!-- Order/Payment -->
    <form
      method="post"
      action="${contextPath}/mypage/newOrder.do"
      id="orderForm"
    >
      <div class="div-p">
        <p class="p-1 extsize-2 text-left textcolor-black textbold">
          Order/Payment
        </p>
      </div>

      <hr class="linebold" />

      <table class="textcolor-black textsize-2">
        <!-- Buyer's Information -->
        <tr class="tr-1">
          <th>Buyer's Information</th>
        </tr>
        <tr>
          <td>Name</td>
          <td>
            <input
              type="text"
              name="orderer_name"
              value="${memberInfo.name}"
              readonly
            />
          </td>
        </tr>
        <tr>
          <td>Phone Number</td>
          <td>
            <input
              type="text"
              name="orderer_phone"
              value="${memberInfo.phone}"
              readonly
            />
          </td>
        </tr>

        <!-- Recipient Information -->
        <tr class="tr-1">
          <th>Recipient Information</th>
        </tr>
        <tr>
          <td>Name</td>
          <td>
            <input
              type="text"
              name="receiver_name"
              value="${memberInfo.name}"
            />
          </td>
        </tr>
        <tr>
          <td>Order Address</td>
          <td>
            <input
              type="hidden"
              id="h_input_zipCode"
              name="zipCode"
              value="${memberInfo.zipCode}"
            />
            <input
              onclick="execDaumPostCode()"
              readonly
              type="text"
              id="address_input"
              name="receiver_address"
              value="(${memberInfo.zipCode}) ${memberInfo.address}"
              placeholder="Address"
            /><br />
            <input
              type="text"
              id="address_detail_input"
              name="receiver_addressDetail"
              value="${memberInfo.address_detail}"
              placeholder="Detailed Address"
            />
          </td>
        </tr>
        <tr>
          <td>Phone Number</td>
          <td>
            <input
              type="text"
              name="receiver_phone"
              value="${memberInfo.phone}"
            />
          </td>
        </tr>
        <tr>
          <td>Order Request</td>
          <td>
            <select id="selbox" name="receiver_comment">
              <option
                value="Please leave it to the security office in the absence"
              >
                Please leave it to the security office in the absence
              </option>
              <option value="Please put it in front of the door">
                Please put it in front of the door
              </option>
              <option value="Please put it in the delivery box">
                Please put it in the delivery box
              </option>
              <option value="direct">Direct input</option>
              <input
                type="text"
                id="selboxDirect"
                name="receiver_comment_direct"
              />
            </select>
          </td>
        </tr>

        <c:set var="used_point" value="${param.used_point}" />
        <!-- Rewards -->
        <tr class="tr-1">
          <th>Rewards</th>
        </tr>
        <tr>
          <td>Retained Rewards</td>
          <td>${memberInfo.point}</td>
        </tr>
        <tr>
          <td>Use Rewards</td>
          <td>
            <c:set var="point_max_value" value="${memberInfo.point}" />
            <c:if test="${point_max_value>total_price}">
              <c:set var="point_max_value" value="total_price" />
            </c:if>
            <input
              type="number"
              id="used_point"
              name="used_point"
              min="0"
              max="${point_max_value}"
              value="0"
            />
          </td>
        </tr>

        <c:set var="used_coupon" value="${param.used_coupon}" />
        <!-- Coupon -->
        <tr class="tr-1">
          <th>Coupon</th>
        </tr>
        <tr>
          <td>Use Coupon</td>
          <td>
            <select name="used_couponId">
              <option value="0" selected>Please choose Coupon</option>
              <c:forEach var="coupon" items="${couponList}">
                <option value="${coupon.couponNo}">
                  ${coupon.name} / ${coupon.discount_price}won Discount Price /
                  ${coupon.condition}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>
        <input type="hidden" id="h_coupon_discount_price" value="0" />

        <!-- Payment Information -->
        <tr class="tr-1">
          <th>Payment Information</th>
        </tr>
        <fmt:parseNumber
          var="percent"
          value="${payment_price*0.05}"
          integerOnly="true"
        />
        <c:set
          var="total_price"
          value="${payment_price-discount_price+shippingFee}"
        />
        <tr>
          <!-- value는 이엘태그로 값 넣어주기! -->
          <td>Product Price</td>
          <td>
            <input
              type="hidden"
              name="payment_price"
              value="${payment_price}"
            />${payment_price} won
          </td>
        </tr>
        <tr>
          <td>Product Discount Price Price</td>
          <td>
            <input
              type="hidden"
              name="discount_price"
              value="${discount_price}"
            /><span id="discount_price_text">-${discount_price} won</span>
            <input
              type="hidden"
              id="h_original_discount_price"
              value="${discount_price}"
            />
          </td>
        </tr>
        <tr>
          <td>Shipping Fee</td>
          <td>
            <input
              type="hidden"
              name="shippingfee"
              value="${shippingfee}"
            />${shippingFee} won
          </td>
        </tr>
        <tr>
          <td>Rewards Point</td>
          <td>
            <input
              type="hidden"
              name="point_price"
              value="${percent}"
            />${percent} won
          </td>
        </tr>
        <tr>
          <td>Total PaymentPrice</td>
          <td>
            <input type="hidden" name="total_price" value="${total_price}" />
            <span id="total_price_text">${total_price} won</span>
          </td>
        </tr>
        <tr>
          <td>Payment Method</td>
          <td>
            <div id="payment-method"></div>
          </td>
        </tr>
      </table>
      <input name="payment_type" type="hidden" />
      <hr class="linebold" style="margin: 0" />
      <br />

      <!-- Order버튼 -->
      <div class="div-btn">
        <button
          class="btn-1 btn-regular bg-white textcolor-black btn-border"
          type="reset"
        >
          Cancle
        </button>
        <button
          class="btn-1 btn-regular bg-lightgreen textbold border-0"
          id="payment-request-button"
          onclick="fn_sendOrderInfo('${contextPath}')"
          type="button"
        >
          To Pay
        </button>
      </div>
    </form>
    <!--토스Payment api-->
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
    <script>
      const paymentWidget = PaymentWidget(
        "test_ck_kYG57Eba3GZb4JRkMzQ8pWDOxmA1",
        // 비Member customerKey
        PaymentWidget.ANONYMOUS
      );

      /**
       * Payment창을 렌더링합니다.
       * @docs https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods%EC%84%A0%ED%83%9D%EC%9E%90-%EA%B2%B0%EC%A0%9C-%EA%B8%88%EC%95%A1
       */
      paymentWidget.renderPaymentMethods("#payment-method", {
        value: "${total_price}",
        currency: "KRW",
        country: "KR",
      });

      function fn_render_widget(price) {
        paymentWidget.renderPaymentMethods("#payment-method", {
          value: price,
          currency: "KRW",
          country: "KR",
        });
      }

      function fn_sendOrderInfo(contextPath) {
        var formData = $("#orderForm").serialize();
        var total_price = $("#orderForm").find("input[name=total_price]").val();
        fn_render_widget(total_price);
        $.ajax({
          type: "POST",
          url: contextPath + "/storeOrderInfo.do",
          data: formData,
          success: function (response) {
            if (response == "success") {
              fn_requestPayment();
            } else {
              alert("Failed to save order information.");
            }
          },
          error: function (response) {
            alert("An error of unknown cause");
            console.log(response);
          },
        });
      }

      function fn_requestPayment() {
        paymentWidget.requestPayment({
          orderId: generateRandomString(),
          orderName: "test Order",
          successUrl: window.location.origin + "/toss/orderSuccess.do",
          failUrl: window.location.origin + "/toss/orderFail.do",
          customerName: "${memberInfo.name}",
        });
      }

      function generateRandomString() {
        return window.btoa(Math.random()).slice(0, 20);
      }
    </script>
    <!--토스Payment api 끝-->
  </body>
</html>
