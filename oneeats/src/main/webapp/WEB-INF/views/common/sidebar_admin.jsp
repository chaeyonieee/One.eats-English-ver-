<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>sidebar</title>
    <link rel="stylesheet" href="${contextPath}/css/side.css" />

    <script>
      var rotateArray = new Array(0, 0, 0, 0, 0);
      $(document).ready(function () {
        var currentPath = window.location.pathname;
        var lastSlashIndex = currentPath.lastIndexOf("/");
        var secondLastSlashIndex = currentPath.lastIndexOf(
          "/",
          lastSlashIndex - 1
        );
        var selectedSideMenu = currentPath.substring(
          secondLastSlashIndex + 1,
          lastSlashIndex
        );
        if (selectedSideMenu == "goods") {
          if (currentPath.includes("Seller")) {
            selectedSideMenu = "sellerGoods";
          } else {
            selectedSideMenu = "adminGoods";
          }
        }

        $("#menu_" + selectedSideMenu).addClass("selected_menu");
        console.log(selectedSideMenu);
      });
    </script>
    <script src="${contextPath}/js/side.js"></script>
  </head>
  <body>
    <div class="row">
      <div class="col-lg">
        <div style="text-align: left" class="textsize-2 textcolor-black border">
          <div id="side_menu_title">
            <span>&nbsp;&nbsp;Admin Menu</span>
          </div>
          <ul class="ul_menus">
            <li id="menu_member">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/admin/member/adminMemberList.do"
                    >Member</a
                  >
                </div>
              </div>
            </li>

            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_slideToggle(1);"
                >
                  Event
                  <img
                    id="arrow_1"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_1" style="margin-left: 12px; margin-top: 12px">
                  <li id="menu_hotdeal">
                    <a href="${contextPath}/admin/hotdeal/adminHotDealList.do"
                      >Hot Deal</a
                    >
                  </li>
                  <li id="menu_coupon">
                    <a href="${contextPath}/admin/coupon/adminCouponList.do"
                      >Coupon</a
                    >
                  </li>
                </ul>
              </div>
            </li>

            <li id="menu_order">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/admin/order/adminOrderList.do"
                    >Order/Payment</a
                  >
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_slideToggle(2)"
                >
                  Product
                  <img
                    id="arrow_2"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_2" style="margin-left: 12px; margin-top: 12px">
                  <li id="menu_sellerGoods">
                    <a href="${contextPath}/admin/goods/adminSellerGoodsList.do"
                      >Business Product</a
                    >
                  </li>
                  <li id="menu_adminGoods">
                    <a href="${contextPath}/admin/goods/adminGoodsList.do"
                      >Admin Product</a
                    >
                  </li>
                </ul>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_slideToggle(3)"
                >
                  Customer Service
                  <img
                    id="arrow_3"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_3" style="margin-left: 12px; margin-top: 12px">
                  <li id="menu_notice">
                    <a
                      href="${contextPath}/admin/community/notice/adminNoticeList.do"
                      >Notice</a
                    >
                  </li>
                  <li id="menu_mostQnA">
                    <a
                      href="${contextPath}/admin/community/mostQnA/adminMostQnAList.do"
                      >Frequently Asked Questions (FAQ)</a
                    >
                  </li>
                  <li id="menu_oneQnA">
                    <a
                      href="${contextPath}/admin/community/oneQnA/adminOneQnAList.do"
                      >1:1 Inquiry
                    </a>
                  </li>
                </ul>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_slideToggle(4)"
                >
                  Community
                  <img
                    id="arrow_4"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_4" style="margin-left: 12px; margin-top: 12px">
                  <li id="menu_review">
                    <a
                      href="${contextPath}/admin/community/review/adminReviewList.do"
                      >Review</a
                    >
                  </li>
                  <li id="menu_recipe">
                    <a
                      href="${contextPath}/admin/community/recipe/adminRecipeList.do"
                      >Recipe</a
                    >
                  </li>
                </ul>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </body>
</html>
