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
    <title>Business Order/Payment</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- Search창 -->
    <form method="post" action="${contextPath}/seller/order/sellerOrderList.do">
      <div class="div-p2">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">
          Order/Payment
        </p>
        <div class="div-sib textsize-1">
          <select name="order_search_type">
            <option value="all">Total</option>
            <option value="orderNo">Order Number</option>
            <option value="orderer_name">purchaser</option>
            <option value="orderer_id">ID</option>
          </select>
          <input
            type="search"
            name="order_search_word"
            placeholder="search.."
          />
          <button
            class="btn-1 bg-lightgreen  border-0"
            type="submit"
          >
            Search
          </button>
        </div>
      </div>
    </form>

    <hr class="linebold" />

    <!-- Order/Order -->
    <table class="textcolor-black textsize-1">
      <tr>
        <th>Order Number</th>
        <th style="width: 20%">Payment date and time</th>
        <th>purchaser</th>
        <th>ID</th>
        <th style="width: 20%">Order History</th>
        <th>Order Status</th>
        <th style="width: 10%">cancel</th>
      </tr>
      <c:forEach var="sellerOrder" items="${sellerOrderList}">
        <c:choose>
          <c:when test="${sellerOrder.orderNo != preOrderNo}">
            <tr style="border-top: 1px solid #b3b3b3">
              <td>${sellerOrder.orderNo}</td>
              <td>${sellerOrder.orderDate}</td>
              <td>${sellerOrder.orderer_name}</td>
              <td>${sellerOrder.orderer_id}</td>
              <td>
                <a
                  href="${contextPath}/mypage/orderDetail.do?orderNo=${sellerOrder.orderNo}"
                >
                  <c:if test="${sellerOrder.gun>1}">
                    ${sellerOrder.goodsName} and ${sellerOrder.gun-1} more
                  </c:if>
                  <c:if test="${sellerOrder.gun==1}">
                    ${sellerOrder.goodsName}
                  </c:if>
                </a>
              </td>
              <td>${sellerOrder.delivery_status}</td>
              <td>
                <a
                  href="javascript:void(0)"
                  onclick='fn_openalert("Do you want to cancel the order?","${contextPath}/seller/order/sellerOrderCancel.do?orderNo=${sellerOrder.orderNo}")'
                  >cancel</a
                >
              </td>
            </tr>
          </c:when>
        </c:choose>
        <c:set var="preOrderNo" value="${sellerOrder.orderNo}" />
      </c:forEach>
    </table>

    <hr class="linebold" />

    <!-- 페이징 -->
    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <a
              href="${contextPath}/seller/order/sellerOrderList.do?section=${section-1}&pageNum=1"
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
          value="${Math.ceil((totalOrderNum - (section-1)*100)/ 10)}"
        />
        <c:if test="${end>10}">
          <c:set var="end" value="10" />
        </c:if>
        <c:forEach begin="1" end="${end}" var="i">
          <li class="li-btn">
            <a
              href="${contextPath}/seller/order/sellerOrderList.do?section=${section}&pageNum=${i}"
              class="btn-2 btn-square bg-white btn-border"
              >${((section-1)*10)+i}</a
            >
          </li>
        </c:forEach>
        <c:if test="${section*100<totalOrderNum}">
          <li class="li-btn">
            <a
              href="${contextPath}/seller/order/sellerOrderList.do?section=${section+1}&pageNum=1"
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
