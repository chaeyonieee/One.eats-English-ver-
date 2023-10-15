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
    <title>Sidebar</title>
    <link rel="stylesheet" href="${contextPath}/css/side.css" />

    <script>
      var rotate1 = 0;
      var rotate2 = 0;
    </script>
    <script src="${contextPath}/js/side.js"></script>
  </head>
  <body>
    <div class="row">
      <div class="col-lg">
        <div style="text-align: left" class="textsize-2 border">
          <div
            class="textcolor-white"
            style="
              width: 100%;
              height: 50px;
              display: flex;
              align-items: center;
              background-color: #568203;
            "
          >
            <img
              style="margin-left: 16px"
              style="width: 20px"
              src="${contextPath}/img/icon/list.png"
            />
            <span class="textbold">&nbsp;Category</span>
          </div>
          <ul class="ul_menus" style="margin-left: 16px">
            <li>
              <div style="margin-right: 12px">
                <div
                  class="textbold"
                  style="width: 100%"
                  onclick="fn_toggle(1);"
                >
                  Ugly Product
                  <img
                    id="motnan_arrow"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul
                  id="category_motnan"
                  style="margin-left: 12px; margin-top: 12px"
                >
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=vegetable"
                      >Vegetables</a
                    >
                  </li>
                  <li>
                    <a href="${contextPath}/goods/goodsList.do?category=fruit"
                      >Fruits</a
                    >
                  </li>
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=juiceAndJam"
                      >Juice / Homemade Jam</a
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
                  onclick="fn_toggle(2)"
                >
                  Meal kit
                  <img
                    id="meal_arrow"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul
                  id="category_meal"
                  style="margin-left: 12px; margin-top: 12px"
                >
                  <li>
                    <a href="${contextPath}/goods/goodsList.do?category=zzigae">
                      Stew/ Soup/ Steamed</a
                    >
                  </li>
                  <li>
                    <a href="${contextPath}/goods/goodsList.do?category=meal"
                      >Meal/ Appetizers</a
                    >
                  </li>
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=porridge"
                      >Porridge</a
                    >
                  </li>
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=mealReplacement"
                      >Meal Replacement</a
                    >
                  </li>
                  <li>
                    <a
                      href="${contextPath}/goods/goodsList.do?category=sidedish"
                      >Sidedish</a
                    >
                  </li>
                </ul>
              </div>
            </li>
          </ul>
          <div>&nbsp;</div>
        </div>
      </div>
    </div>
  </body>
</html>
