<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Order Detail</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- Order Details -->
    <div class="div-p">
      <p class="p-1 textsize-2 text-left textcolor-black textbold">
        Order Details
      </p>
      <div class="div-sib textsize-1">
        <button
          class="btn-3 textcolor-black border-0"
          onclick='fn_openalert("Do you want to cancle the order?","${contextPath}/mypage/orderCancel.do?orderNo=${order.orderNo}")'
          type="button"
        >
          Order Cancle
        </button>
      </div>
    </div>

    <hr class="linebold" style="margin: 0" />

    <!-- Order일, Order번호 -->
    <div class="div-tot">
      <div class="div-t11 textbold textcolor-black textsize-1">
        <span>${order.orderDate} Order</span>
        <span style="float: right">Order Number ${order.orderNo}</span>
      </div>
    </div>

    <hr class="linebold" style="margin: 0" />

    <!-- Payment Information -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>Payment Information</span>
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Product Price
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.payment_price}yen
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Product Discount Amount
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              -${order.discount_price}yen
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Shipping Fee
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.shippingfee}yen
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">Rewards액</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.point_price}원
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Payment Method
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.payment_type}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Total PaymentPrice
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.total_price}yen
            </dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- Order Information -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>Order Information</span>
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Order Number
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">${order.orderNo}</dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Name of the purchaser
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.orderer_name}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Payment date and time
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">${order.orderDate}</dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- Order Information -->
    <div class="div-tot">
      <div class="div-t1 textsize-1 textcolor-white">
        <span class="textcolor-black textbold">Order Information</span>
        <span>${order.delivery_status}</span>
        <a
          class="bg-lightgreen border-0 textsize-1 float-right btn-5 d-flex align-items-center justify-content-center"
          href="https://tracker.delivery/#/kr.epost/1111111111111"
          target="_blank"
          >Order Inquiry</a
        >
      </div>
      <div class="div-t2">
        <div class="div-left">
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">Recipient</dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.receiver_name}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Phone Number
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.receiver_phone}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Order Address
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.receiver_address}
            </dd>
          </dl>
          <dl class="dl-dt">
            <dt class="dt-1 textsize-1 textbold textcolor-black">
              Order Request
            </dt>
            <dd class="dd-1 textsize-1 textcolor-black">
              ${order.receiver_comment}
            </dd>
          </dl>
        </div>
      </div>
    </div>

    <!-- ProductOrderList -->
    <div class="div-tot">
      <div class="div-t1 textbold textcolor-black textsize-1">
        <span>ProductOrderList</span>
      </div>
      <c:forEach var="detail" items="${orderDetail}">
        <div class="div-t2">
          <div class="div-left2">
            <a
              href="${contextPath}/goods/goodsDetail.do?goodsNo=${detail.goodsNo}"
              ><img
                class="img-1"
                src="${contextPath}/download.do?imageFileName=${detail.goodsImg}&path=goodsNo${detail.goodsNo}"
                alt="Product메인"
            /></a>
            <div class="div-dl">
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  <a
                    href="${contextPath}/goods/goodsDetail.do?goodsNo=${detail.goodsNo}"
                    >${detail.goodsName}</a
                  >
                </dt>
              </dl>
              <dl class="dl-dt">
                <dt class="dt-2 textsize-1 textcolor-black">
                  ￦${detail.goodsPrice} | ${detail.weight}g ${detail.goods_qty}
                </dt>
              </dl>
            </div>
          </div>
          <div class="div-right">
            <span class="span-1 textsize-1 textcolor-black"
              >${detail.delivery_status}</span
            >
          </div>
        </div>
      </c:forEach>
    </div>

    <hr class="linebold" />
  </body>
</html>
