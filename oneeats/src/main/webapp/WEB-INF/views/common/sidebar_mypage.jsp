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
    </script>
    <script src="${contextPath}/js/side.js"></script>
  </head>
  <body>
    <div class="row">
      <div class="col-lg">
        <div class="textsize-2 textcolor-black border text-left">
          <div id="side_menu_title">
            <span>&nbsp;&nbsp;MyPage</span>
          </div>
          <ul class="ul_menus">
            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_slideToggle(1);"
                >
                  Member Information
                  <img
                    id="arrow_1"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_1" style="margin-left: 12px; margin-top: 12px">
                  <li>
                    <a href="${contextPath}/mypage/myPageMain.do"
                      >Edit the profile</a
                    >
                  </li>
                  <li>
                    <a href="${contextPath}/mypage/mypageMemberMod.do"
                      >Member Information Modify</a
                    >
                  </li>
                  <li>
                    <a href="${contextPath}/mypage/myAddress.do"
                      >Order Address Management</a
                    >
                  </li>
                </ul>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/mypage/orderList.do">Order History</a>
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/mypage/mypageBookmarkList.do"
                    >Wishlist</a
                  >
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/community/oneQnA/oneQnAList.do"
                    >1:1 Inquiry History</a
                  >
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/mypage/mypageReviewList.do"
                    >Product Review</a
                  >
                </div>
              </div>
            </li>
            <li>
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/mypage/couponSearch.do"
                    >View Coupon/Rewards</a
                  >
                </div>
              </div>
            </li>
          </ul>
        </div>
        <div class="text-left textsize-2 textcolor-red">
          <a
            href="javascript:void(0)"
            onclick='fn_openalert("Do you really want to deactivate your account?","${contextPath}/mypage/deleteMember.do")'
            >Withdraw</a
          >
        </div>
      </div>
    </div>
  </body>
</html>
