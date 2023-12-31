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
    <title>Admin Coupon List</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy.css" />
  </head>
  <body>
    <!-- Search창 -->
    <form method="post" action="${contextPath}/admin/coupon/adminCouponList.do">
      <div class="div-p">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">
          Coupon List
        </p>
        <div class="div-sib textsize-1">
          <select name="coupon_search_type">
            <option value="all">Total</option>
            <option value="couponNo">Number</option>
            <option value="name">Name</option>
            <option value="memberName">Location</option>
          </select>
          <input
            type="search"
            name="coupon_search_word"
            placeholder="search.."
          />
          <button
            class="btn-1  border-0 bg-lightgreen"
            type="submit"
          >
            Search
          </button>
        </div>
      </div>
    </form>

    <hr class="linebold" />

    <!-- Coupon List -->
    <table class="textcolor-black textsize-1">
      <tr>
        <th style="width: 10%">Number</th>
        <th>Registration Date</th>
        <th style="width: 30%">Coupon Name</th>
        <th>Usage Location</th>
        <th>Expiration Date</th>
        <th style="width: 10%">Delete</th>
      </tr>

      <c:forEach var="adminCoupon" items="${adminCouponList}">
        <tr style="border-top: 1px solid #b3b3b3">
          <td>${adminCoupon.couponNo}</td>
          <td>${adminCoupon.creDate}</td>
          <td>${adminCoupon.name}</td>
          <td>${adminCoupon.memberName}</td>
          <td>${adminCoupon.expDate}</td>
          <td>
            <a
              href="javascript:void(0)"
              onclick='fn_openalert(" Do you want to delete the coupon?","${contextPath}/admin/coupon/deleteCoupon.do?couponNo=${adminCoupon.couponNo}")'
              >Delete</a
            >
          </td>
        </tr>
      </c:forEach>
    </table>

    <hr class="linebold" />

    <button
      style="font-size: 12px; margin-top: 22px; float: right"
      class="btn-2 bg-lightgreen border-0"
      type="button"
      onclick="location.href='${contextPath}/admin/coupon/adminCouponForm.do'"
    >
      Registration
    </button>

    <!-- 페이징 -->
    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <a
              href="${contextPath}/admin/coupon/adminCouponList.do?section=${section-1}&pageNum=1"
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
          value="${Math.ceil((totalCouponNum - (section-1)*100)/ 10)}"
        />
        <c:if test="${end>10}">
          <c:set var="end" value="10" />
        </c:if>
        <c:forEach begin="1" end="${end}" var="i">
          <li class="li-btn">
            <a
              href="${contextPath}/admin/coupon/adminCouponList.do?section=${section}&pageNum=${i}"
              class="btn-2 btn-square bg-white btn-border"
              >${((section-1)*10)+i}</a
            >
          </li>
        </c:forEach>
        <c:if test="${section*100<totalCouponNum}">
          <li class="li-btn">
            <a
              href="${contextPath}/admin/coupon/adminCouponList.do?section=${section+1}&pageNum=1"
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
