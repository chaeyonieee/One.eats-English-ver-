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
    <title>Order History</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- Search창 -->
    <form method="post" action="${contextPath}/mypage/orderList.do">
      <div class="div-p">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">
          Order History
        </p>
        <div class="div-sib2 textsize-1">
          <select name="order_search_type" onchange="this.form.submit()">
            <option value="all">Total</option>
            <option value="1month">1Month</option>
            <option value="3month">3Month</option>
            <option value="1year">1Year</option>
          </select>
        </div>
      </div>
    </form>

    <hr class="linebold" />

    <!-- TotalOrder History -->
    <c:forEach var="order" items="${orderList}">
      <c:choose>
        <c:when test="${order.orderNo != preOrderNo}">
          <div class="div-tot">
            <!-- Order일, Order History상세보기 -->
            <div class="div-t1 textbold textcolor-black textsize-1">
              <span>${order.orderDate}</span>
              <a
                style="float: right"
                href="${contextPath}/mypage/orderDetail.do?orderNo=${order.orderNo}"
                >Order History view details</a
              >
            </div>
            <!-- Order History -->
            <div class="div-t2">
              <!-- 왼쪽정보 -->
              <div class="div-left2">
                <img
                  class="img-1"
                  src="${contextPath}/download.do?imageFileName=${order.goodsImg}&path=goodsNo${order.goodsNo}"
                  alt="Product메인"
                />
                <div class="div-dl">
                  <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">
                      Product Name
                    </dt>
                    <c:if test="${order.gun>1}">
                      <dd class="dd-1 textsize-1 textcolor-black">
                        ${order.goodsName} and more ${order.gun-1}
                      </dd>
                    </c:if>
                    <c:if test="${order.gun==1}">
                      <dd class="dd-1 textsize-1 textcolor-black">
                        ${order.goodsName}
                      </dd>
                    </c:if>
                  </dl>
                  <dl class="dl-dt">
                    <dt class="dt-1 textsize-1 textbold textcolor-black">
                      Order Number
                    </dt>
                    <dd class="dd-2 textsize-1 textcolor-black">
                      ${order.orderNo}
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
                      Payment Price
                    </dt>
                    <dd class="dd-1 textsize-1 textcolor-black">
                      ${order.total_price}yen
                    </dd>
                  </dl>
                </div>
              </div>
              <!-- 오른쪽정보 -->
              <div class="div-right">
                <span class="span-1 textsize-1 textcolor-black"
                  >${order.delivery_status}</span
                >
                <button
                  class="btn-3 border-0 textsize-1 textcolor-black"
                  type="button"
                  onclick="location.href='${contextPath}/mypage/orderCancel.do?orderNo=${order.orderNo}'"
                >
                  <span>Cancle</span>
                </button>
              </div>
            </div>
          </div>
        </c:when>
      </c:choose>
      <c:set var="preOrderNo" value="${order.orderNo}" />
    </c:forEach>

    <hr class="linebold" />

    <!-- 페이징 -->
    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <a
              href="${contextPath}/mypage/orderList.do?section=${section-1}&pageNum=1&order_search_type=${order_search_type}"
              class="btn-2 btn-square bg-white btn-border"
            >
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/prev.png"
                alt="prev"
              />
            </a>
          </li>
        </c:if>
        <c:set
          var="end"
          value="${Math.ceil((totalOrderNum - (section-1)*60)/ 6)}"
        />
        <c:if test="${end>10}">
          <c:set var="end" value="10" />
        </c:if>
        <c:forEach begin="1" end="${end}" var="i">
          <li class="li-btn">
            <a
              href="${contextPath}/mypage/orderList.do?section=${section}&pageNum=${i}&order_search_type=${order_search_type}"
              class="btn-2 btn-square bg-white btn-border"
              >${((section-1)*10)+i}</a
            >
          </li>
        </c:forEach>
        <c:if test="${section*60<totalOrderNum}">
          <li class="li-btn">
            <a
              href="${contextPath}/mypage/orderList.do?section=${section+1}&pageNum=1&order_search_type=${order_search_type}"
              class="btn-2 btn-square bg-white btn-border"
            >
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/next.png"
                alt="next"
              />
            </a>
          </li>
        </c:if>
      </ul>
    </div>
  </body>
</html>
