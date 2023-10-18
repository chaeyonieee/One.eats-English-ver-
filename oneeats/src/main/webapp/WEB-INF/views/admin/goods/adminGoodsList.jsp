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
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/css/list.css" />
  </head>
  <body>
    <div class="div-p">
      <p class="textsize-2 text-left textcolor-black textbold">ProductList</p>
      <div class="div-sib textsize-1">
        <form
          method="get"
          action="${contextPath}/admin/goods/adminGoodsList.do"
        >
          <select name="goods_search_type">
            <option value="all">Total</option>
            <option value="creDate">Registration Date</option>
            <option value="name">Product Name</option>
          </select>
          <input type="text" name="goods_search_word" placeholder="search.." />
          <button
            class="btn-1 bg-lightgreen textcolor-white border-0"
            type="submit"
          >
            Search
          </button>
        </form>
      </div>
    </div>
    <table border="0" class="textcolor-black textsize-1">
      <tr>
        <th>Number</th>
        <th>Registration Date</th>
        <th>Product Name</th>
        <th style="text-align: right">Registration Hot Deal
        <th style="text-align: right">Modify</th>
        <th style="text-align: right">Delete</th>
      </tr>
      <c:forEach var="goods" items="${goodsList}">
        <c:choose>
          <c:when test="${goods.goodsNo != preGoodsNo}">
            <tr>
              <div class="th-1">
                <td>${goods.goodsNo}</td>
                <td>${goods.creDate}</td>
                <td>
                  <a
                    href="${contextPath}/goods/goodsDetail.do?goodsNo=${goods.goodsNo}"
                  >
                    ${goods.name}</a
                  >
                </td>
                <td style="text-align: right">
                  <a
                    href="${contextPath}/admin/hotdeal/adminHotDealForm.do?goodsNo=${goods.goodsNo}"
                    >Registration Hot Deal</a
                  >
                </td>

                <td style="text-align: right">
                  <a
                    href="${contextPath}/admin/goods/adminGoodsModForm.do?goodsNo=${goods.goodsNo}"
                    >Modify</a
                  >
                </td>
                <td style="text-align: right">
                  <a
                    href="javascript:void(0)"
                    onclick='fn_openalert("Do you want to delete the product?","${contextPath }/admin/goods/deleteAdminGoods.do?goodsNo=${goods.goodsNo}")'
                    >Delete</a
                  >
                </td>
              </div>
            </tr>
          </c:when>
        </c:choose>
        <c:set var="preGoodsNo" value="${goods.goodsNo}" />
      </c:forEach>
    </table>
    <button
      style="font-size: 12px; margin-top: 22px; float: right"
      class="btn-1 bg-lightgreen textcolor-white border-0"
      type="button"
      onclick="location.href='${contextPath}/admin/goods/adminGoodsForm.do'"
    >
      Product 추가
    </button>
    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <button
              class="btn-2 btn-square bg-white btn-border"
              onclick="location.href='${contextPath}/admin/goods/adminGoodsList.do?&category=${category}&section=${section-1}&pageNum=1'"
            >
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/prev.png"
                alt="prev"
              />
            </button>
          </li>
        </c:if>
        <!-- 페이징을 위한 변수. 페이지 버튼이 어디서 끝나야 하는지. -->
        <c:set var="endPage" value="1" />
        <c:if test="${not empty totalGoodsNum && totalGoodsNum>0}">
          <!-- Recipe는 한 페이지당 6개, 섹션당 60개이므로 이런 식이 된다.-->
          <c:set
            var="result"
            value="${(totalGoodsNum - (section-1)*100) div 10}"
          />
          <c:set var="endPage" value="${Math.ceil(result)}" />
        </c:if>
        <c:forEach begin="1" end="${endPage}" var="i">
          <li class="li-btn">
            <button
              class="btn-2 btn-square bg-white btn-border"
              onclick="location.href='${contextPath}/admin/goods/adminGoodsList.do?category=${category}&section=${section}&pageNum=${i}'"
            >
              ${(section-1)*10+i}
            </button>
          </li>
        </c:forEach>
        <c:if test="${totalGoodsNum > (section)*100}">
          <li class="li-btn">
            <button
              class="btn-2 btn-square bg-white btn-border"
              onclick="location.href='${contextPath}/admin/goods/adminGoodsList.do?category=${category}&section=${section+1}&pageNum=1'"
            >
              <img
                width="20px"
                height="20px"
                src="${contextPath}/img/icon/next.png"
                alt="next"
              />
            </button>
          </li>
        </c:if>
      </ul>
    </div>
  </body>
</html>
