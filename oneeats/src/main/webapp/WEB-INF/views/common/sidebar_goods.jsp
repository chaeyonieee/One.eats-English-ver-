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
    <title>사이드바</title>
    <link rel="stylesheet" href="${contextPath}/css/side.css" />
    <script>
      var rotateArray = new Array(0, 0, 0, 0, 0);
    </script>
    <script src="${contextPath}/js/side.js"></script>
    <!--최근 본 Product을 바꾸기 위한 코드-->
    <script>
      var currentViewQuickGoodsNum = 1;
      var quickGoodsListNum = parseInt("${quickGoodsListNum}");
      function fn_nextQuickGoods(num) {
        if (num == quickGoodsListNum) {
          $("#quick_goods_" + num).addClass("div_hidden");
          $("#quick_goods_" + 1).removeClass();
          currentViewQuickGoodsNum = 1;
        } else {
          $("#quick_goods_" + num).addClass("div_hidden");
          $("#quick_goods_" + (num + 1)).removeClass();
          currentViewQuickGoodsNum++;
        }
        $("#cur_goods_num").text(currentViewQuickGoodsNum);
      }
      function fn_prevQuickGoods(num) {
        if (num == 1) {
          $("#quick_goods_" + num).addClass("div_hidden");
          $("#quick_goods_" + quickGoodsListNum).removeClass();
          currentViewQuickGoodsNum = quickGoodsListNum;
        } else {
          $("#quick_goods_" + num).addClass("div_hidden");
          $("#quick_goods_" + (num - 1)).removeClass();
          currentViewQuickGoodsNum--;
        }
        $("#cur_goods_num").text(currentViewQuickGoodsNum);
      }
    </script>
    <style>
      .div_hidden {
        display: none;
      }
    </style>
  </head>
  <body>
    <div class="row" style="margin-top: 80px">
      <div class="col-lg">
        <div class="textsize-2 border text-left">
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
                  onclick="fn_slideToggle(1);"
                >
                  Ugly Product
                  <img
                    id="arrow_1"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_1" style="margin-left: 12px; margin-top: 12px">
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
                  onclick="fn_slideToggle(2)"
                >
                  Meal kit
                  <img
                    id="arrow_2"
                    src="${contextPath}/img/icon/uparrow.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
                <ul id="category_2" style="margin-left: 12px; margin-top: 12px">
                  <li>
                    <a href="${contextPath}/goods/goodsList.do?category=zzigae"
                      >Stew/ Soup/ Steamed</a
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
        </div>
      </div>
    </div>
    <div>&nbsp;</div>
    <div class="row">
      <div class="col-lg text-left">
        <div class="sidebar__item" style="margin-top: 86px">
          <h4 style="font-size: 20px">Price</h4>
          <div class="price-range-wrap">
            <div
              class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
              data-min="0"
              data-max="${maxPrice}"
            >
              <div class="ui-slider-range ui-corner-all ui-widget-header"></div>
              <span
                tabindex="0"
                class="ui-slider-handle ui-corner-all ui-state-default"
                style="left: 0%"
              ></span>
              <span
                tabindex="0"
                class="ui-slider-handle ui-corner-all ui-state-default"
                style="left: 100%"
              ></span>
              <div
                class="ui-slider-range ui-corner-all ui-widget-header"
                style="width: 100%; left: 0%"
              ></div>
            </div>
            <div class="range-slider">
              <div class="price-input">
                <input type="text" id="minamount" />
                <input type="text" id="maxamount" class="text-right" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="sidebar__item">
      <div class="latest-product__text">
        <h4 style="font-size: 20px" class="text-left">
          Recently Viewed Product
        </h4>
        <div class="">
          <div class="">
            <ul>
              <!--   There is no product. -->
              <c:choose>
                <c:when test="${ empty quickGoodsList }">
                  <strong>There is no product.</strong>
                </c:when>
                <c:otherwise>
                  <form name="frm_sticky">
                    <c:forEach
                      var="item"
                      items="${quickGoodsList }"
                      varStatus="itemNum"
                    >
                      <c:choose>
                        <c:when test="${itemNum.count==1 }">
                          <div
                            id="quick_goods_1"
                            onclick="location.href='${contextPath}/goods/goodsDetail.do?goodsNo=${item.goodsNo}'"
                          >
                            <img
                              width="110"
                              height="110"
                              id="img_sticky"
                              src="${contextPath}/download.do?imageFileName=${item.img1}&path=goodsNo${item.goodsNo}"
                            />
                            <div class="quick_item_row">
                              <div class="quick_item_name textbold textsize-2">
                                ${item.name}
                              </div>
                              <div class="quick_item_price">
                                ￦${item.price}
                              </div>
                            </div>
                            <input
                              type="hidden"
                              name="h_goods_id"
                              value="${item.goodsNo}"
                            />
                            <input
                              type="hidden"
                              name="h_goods_fileName"
                              value="${item.img1}"
                            />
                            <br />
                          </div>
                        </c:when>
                        <c:otherwise>
                          <div
                            id="quick_goods_${itemNum.count}"
                            class="div_hidden"
                            onclick="location.href='${contextPath}/goods/goodsDetail.do?goodsNo=${item.goodsNo}'"
                          >
                            <img
                              class="img_hidden"
                              width="110"
                              height="110"
                              id="img_sticky"
                              src="${contextPath}/download.do?imageFileName=${item.img1}&path=goodsNo${item.goodsNo}"
                            />
                            <div class="quick_item_name textbold textsize-2">
                              ${item.name}
                            </div>
                            <div class="quick_item_price">￦${item.price}</div>
                            <input
                              type="hidden"
                              name="h_goods_id"
                              value="${item.goodsNo}"
                            />
                            <input
                              type="hidden"
                              name="h_goods_fileName"
                              value="${item.img1}"
                            />
                            <br />
                          </div>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </form>
                </c:otherwise>
              </c:choose>
            </ul>
          </div>
        </div>
        <div>
          <c:choose>
            <c:when test="${ empty quickGoodsList }">
              <h5>&nbsp; &nbsp; &nbsp; &nbsp; 0/0 &nbsp;</h5>
            </c:when>
            <c:otherwise>
              <h5>
                <a onClick="fn_prevQuickGoods(currentViewQuickGoodsNum);">
                  Previous
                </a>
                &nbsp;
                <span id="cur_goods_num">1</span>/${quickGoodsListNum} &nbsp;
                <a onClick="fn_nextQuickGoods(currentViewQuickGoodsNum);">
                  next
                </a>
              </h5>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
    </div>
  </body>
</html>
