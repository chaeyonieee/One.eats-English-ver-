<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>OrderCancle</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- OrderCancle -->
    <div class="div-p">
      <p class="p-1 textsize-2 text-left textcolor-black textbold">
        OrderCancle
      </p>
    </div>

    <hr class="linebold" style="margin: 0" />

    <!-- Buyer's Information -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>Buyer's Information</span>
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">Name</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                name="orderer_name"
                value="${order.orderer_name}"
              />${order.orderer_name}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Phone Number
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                name="orderer_phone"
                value="${order.orderer_phone}"
              />
              ${order.orderer_phone}
            </dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- Refund Information -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>Refund Information</span>
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              PaymentPrice
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                value="${order.total_price}"
              />${order.total_price} yen
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Expected refund price
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                value="${order.total_price-order.shippingfee}"
              />
              ${order.total_price} yen
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Means of refund
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              <input
                type="hidden"
                value="${order.payment_type}"
              />${order.payment_type}
            </dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- CancleProduct -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>CancleProduct</span>
      </div>
      <c:forEach var="cancel" items="${orderCancel}">
        <div class="div-t2">
          <div class="div-left2" style="margin: 5px 0px">
            <img
              class="img-1"
              src="${contextPath}/download.do?imageFileName=${cancel.goodsImg}&path=goodsNo${cancel.goodsNo}"
              alt="Product메인"
            />
            <div class="div-dl">
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  ${cancel.goodsName}
                </dt>
              </dl>
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  ¥${cancel.goodsPrice} | ${cancel.weight}g ${cancel.goods_qty}
                </dt>
              </dl>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>

    <hr class="linebold" style="margin: 0" />
    <div class="row">
      <div class="col">
        <form id="cancel_form">
          <input type="hidden" name="orderNo" id="" value="${order.orderNo}" />
          <input type="hidden" name="paymentKey" value="${paymentKey}" />
          <input type="hidden" name="paymentType" id="${order.payment_type}" />
          <select name="cancel_reason" id="" required>
            <option value="">Please select the reason for Order Cancel</option>
            <option value="You've already ordered a similar product">
              You've already ordered a similar product
            </option>
          </select>
          <c:choose>
            <c:when test="${order.payment_type=='Virtual Account'}">
              For Virtual Account Payment, please enter your account
              <select name="bank" id="" class="form-control">
                <option value="20">WORRI</option>
                <option value="37">JEONBUK</option>
                <option value="39">KYOUNGNAM</option>
                <option value="32">BUSAN</option>
                <option value="45">SAEMAUL</option>
                <option value="88">SHINHAN</option>
                <option value="71">POSTBANK</option>
              </select>
              <input
                type="text"
                name="accountNumber"
                class="form-control"
                placeholder="Account number (without hyphen)"
                required
              />
              <input
                type="text"
                name="holderName"
                class="form-control"
                placeholder="Account holder"
                required
              />
            </c:when>
          </c:choose>
        </form>
      </div>
    </div>
    <!-- OrderCancle버튼 -->
    <div class="div-btn">
      <button
        class="btn-4 btn-regular bg-lightgreen textcolor-white textbold border-0"
        onclick='fn_openalert("Do you want to cancle the order?","${contextPath}/toss/orderCancel.do",fn_cancel)'
        type="button"
      >
        Cancle
      </button>
    </div>
  </body>
  <script>
    function fn_cancel(url) {
      $("#cancel_form").attr("action", url).submit();
    }
  </script>
</html>
