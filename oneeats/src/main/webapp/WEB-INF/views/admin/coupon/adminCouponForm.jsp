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
    <title>Admin Coupon Registration</title>
    <link rel="stylesheet" href="${contextPath}/css/minzy2.css" />
  </head>
  <body>
    <!-- Coupon Registration -->
    <form method="post" action="${contextPath}/admin/coupon/adminAddCoupon.do">
      <div class="div-p2">
        <p class="p-1 textsize-2 text-left textcolor-black textbold">
          Registration
        </p>
      </div>

      <hr class="linebold" />

      <table class="textcolor-black textsize-2">
        <tr>
          <th>Coupon Name</th>
          <td>
            <input type="text" name="name" placeholder="Enter a coupon name" />
          </td>
        </tr>
        <tr>
          <th>Discount Amount</th>
          <td>
            <input
              type="text"
              name="discount_price"
              placeholder="Enter a discount amount."
            />
          </td>
        </tr>
        <tr>
          <th>Usage Conditions</th>
          <td>
            <select name="condition">
              <option value="Select a usage conditions">
                Select a usage conditions
              </option>
              <option value="During Sign-Up">During Sign-Up</option>
              <option value="On purchases of 3000yen or more">
                On purchases of 3000yen or more
              </option>
              <option value="On purchases of 5000yen or more">
                On purchases of 5000yen or more
              </option>
            </select>
          </td>
        </tr>
        <tr>
          <th>Usage Location</th>
          <td>
            <input type="text" name="adminName" value="${memberInfo.name}" />
          </td>
        </tr>
        <tr>
          <th>Expiration Date</th>
          <td>
            <input
              type="date"
              name="expDate"
              placeholder="Enter a expiration date"
            />
          </td>
        </tr>
        <tr>
          <th>Coupon Code</th>
          <td>
            <input type="text" name="couponCode" placeholder="Enter a coupon
            code" />
          </td>
        </tr>
      </table>

      <hr class="linebold" />

      <!-- 버튼 -->
      <div class="div-btn">
        <button
          class="btn-1 btn-regular bg-white textcolor-black textbold btn-border"
          type="reset"
        >
          Rewrite
        </button>
        <button
          class="btn-1 btn-regular bg-lightgreen textbold border-0"
          type="submit"
        >
          Coupon Registration
        </button>
      </div>
    </form>
  </body>
</html>
