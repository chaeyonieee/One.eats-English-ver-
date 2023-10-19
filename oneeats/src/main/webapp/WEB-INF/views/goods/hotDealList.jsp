<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %><%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="zxx">
  <head>
    <meta charset="UTF-8" />
    <meta name="description" content="Ogani Template" />
    <meta name="keywords" content="Ogani, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Product List</title>
  </head>
  <body>
    <!-- Product Section Begin -->
    <section class="product spad">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 col-md-12" style="padding-left: 44px">
            <div class="filter__item">
              <div class="row" style="justify-content: space-around">
                <div class="col-lg-4 col-md-4">
                  <div class="filter__found">
                    <h6><span>There are ${totalHotDealNum} products.</span> </h6>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <c:forEach var="item" items="${hotDealList}">
                <div class="col-lg-4 col-md-6 col-sm-6 product_col">
                  <div class="product__item">
                    <div
                      class="product__item__pic set-bg"
                      data-setbg="${contextPath}/download.do?imageFileName=${item.goodsImg}&path=goodsNo${item.goodsNo}"
                      onclick="location.href='${contextPath}/goods/hotdealDetail.do?hotdealNo=${item.hotdealNo}'"
                    >
                      <ul class="product__item__pic__hover">
                        <li
                          onclick="fn_bookmark('${contextPath}','${item.hotdealNo}')"
                        >
                          <a><i class="fa fa-heart"></i></a>
                        </li>

                        <li
                          onclick="fn_addCartOneItem('${contextPath}','${item.hotdealNo}')"
                        >
                          <a href="#"><i class="fa fa-shopping-cart"></i></a>
                        </li>
                      </ul>
                    </div>
                    <div class="product__item__text">
                      <h6>
                        <a
                          href="${contextPath}/goods/hotdealDetail.do?hotdealNo=${item.hotdealNo}"
                          >${item.name}</a
                        >
                      </h6>
                      <h5>&#8361;${item.discounted_price}</h5>
                      <input
                        type="hidden"
                        class="h_col_goods_price"
                        value="${item.discounted_price}"
                      />
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
            <div class="product__pagination">
              <c:choose>
                <c:when test="${not empty filter_type}">
                  <c:if test="${section>1}">
                    <a
                      href="${contextPath}/goods/search.do?filter_type=${filter_type}&filter_word=${filter_word}&section=${section-1}&pageNum=1"
                    >
                      <i class="fa fa-long-arrow-left"></i>
                    </a>
                  </c:if>
                  <c:set
                    var="end"
                    value="${Math.ceil((totalHotDealNum - (section-1)*120) div 10)}"
                  />
                  <c:if test="${end>10}">
                    <c:set var="end" value="10" />
                  </c:if>
                  <c:forEach begin="1" end="${end}" var="i">
                    <a
                      href="${contextPath}/goods/search.do?filter_type=${filter_type}&filter_word=${filter_word}&section=${section}&pageNum=${i}"
                    >
                      ${i}
                    </a>
                  </c:forEach>

                  <c:if test="${section*120<totalHotDealNum}">
                    <a
                      href="${contextPath}/goods/search.do?filter_type=${filter_type}&filter_word=${filter_word}&section=${section+1}&pageNum=1"
                    >
                      <i class="fa fa-long-arrow-right"></i>
                    </a>
                  </c:if>
                </c:when>

                <c:otherwise>
                  <c:if test="${section>1}">
                    <a
                      href="${contextPath}/hotdeal/hotDealList.do?category=${category}&section=${section-1}&pageNum=1"
                    >
                      <i class="fa fa-long-arrow-left"></i>
                    </a>
                  </c:if>
                  <c:set
                    var="end"
                    value="${Math.ceil((totalHotDealNum - (section-1)*120) div 12)}"
                  />
                  <c:if test="${end>10}">
                    <c:set var="end" value="10" />
                  </c:if>

                  <c:forEach begin="1" end="${end}" var="i">
                    <a
                      href="${contextPath}/hotdeal/hotDealList.do?category=${category}&section=${section}&pageNum=${i}"
                    >
                      ${i}
                    </a>
                  </c:forEach>
                  <c:if test="${section*120<totalHotDealNum}">
                    <a
                      href="${contextPath}/hotdeal/hotDealList.do?category=${category}&section=${section+1}&pageNum=1"
                    >
                      <i class="fa fa-long-arrow-right"></i>
                    </a>
                  </c:if>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Product Section End -->
  </body>
</html>
