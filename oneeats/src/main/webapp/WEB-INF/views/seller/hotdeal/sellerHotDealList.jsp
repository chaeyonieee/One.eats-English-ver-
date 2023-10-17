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
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/css/list.css" />
  </head>
  <body>
    <div class="div-p">
      <p class="textsize-2 text-left textcolor-black textbold">Hot DealList</p>
      <div class="div-sib textsize-1">
        <form
          method="post"
          action="${contextPath}/seller/hotdeal/sellerHotDealList.do"
        >
          <select name="hotdeal_search_type">
            <option value="all">Total</option>
            <option value="creDate">Registration Date</option>
            <option value="name">Hot DealProduct Name</option>
          </select>
          <input
            type="text"
            name="hotdeal_search_word"
            placeholder="search.."
          />
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
        <th>Hot Deal Number</th>
        <th>Hot Deal Registration Date</th>
        <th>Hot Deal Name</th>
        <th style="text-align: right">Modify</th>
        <th style="text-align: right">Delete</th>
      </tr>
      <c:forEach var="hotdeal" items="${HotDealList}">
        <tr>
          <td>${hotdeal.hotdealNo}</td>
          <td>${hotdeal.creDate}</td>
          <td>
            <a
              href="${contextPath}/goods/hotdealDetail.do?hotdealNo=${hotdeal.hotdealNo}"
            >
              ${hotdeal.name}</a
            >
          </td>
          <td style="text-align: right">
            <a
              href="${contextPath}/seller/hotdeal/sellerHotDealModForm.do?hotdealNo=${hotdeal.hotdealNo}"
              >Modify</a
            >
          </td>
          <td style="text-align: right">
            <a
              href="javascript:void(0)"
              onclick='fn_openalert("Do you want to delete the Hot Deal?","${contextPath }/seller/hotdeal/deleteHotdealGoods.do?hotdealNo=${hotdeal.hotdealNo}")'
              >Delete</a
            >
          </td>
        </tr>
      </c:forEach>
    </table>

    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <button
              class="btn-2 btn-square bg-white btn-border"
              onclick="location.href='${contextPath}/seller/hotdeal/sellerHotDealList.do?&category=${category}&section=${section-1}&pageNum=1'"
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
        <c:if test="${not empty totalHotDealNum && totalHotDealNum>0}">
          <!-- Recipe는 한 페이지당 6개, 섹션당 60개이므로 이런 식이 된다.-->
          <c:set
            var="result"
            value="${(totalHotDealNum - (section-1)*100) div 10}"
          />
          <c:set var="endPage" value="${Math.ceil(result)}" />
        </c:if>
        <c:forEach begin="1" end="${endPage}" var="i">
          <li class="li-btn">
            <button
              class="btn-2 btn-square bg-white btn-border"
              onclick="location.href='${contextPath}/seller/hotdeal/sellerHotDealList.do?category=${category}&section=${section}&pageNum=${i}'"
            >
              ${(section-1)*10+i}
            </button>
          </li>
        </c:forEach>
        <c:if test="${totalHotDealNum > (section)*100}">
          <li class="li-btn">
            <button
              class="btn-2 btn-square bg-white btn-border"
              onclick="location.href='${contextPath}/seller/hotdeal/sellerHotDealList.do?category=${category}&section=${section+1}&pageNum=1'"
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
