<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix
="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Review List</title>

    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <form action="${contextPath}/seller/community/sellerReviewList.do">
        <div class="row vertical-align">
          <div class="col-md-2 textsize-3 text-left textbold textcolor-black">
            Review
          </div>
          <div class="col-md"></div>
          <div class="col-md-2 p-0 justify-content-end d-flex">
            <select name="filter_type">
              <option value="all">Total</option>
              <option value="goodsName">Product Name</option>
              <option value="goodsNo">Product ID</option>
              <option value="memberId">Created ID</option>
              <option value="content">Content</option>
            </select>
          </div>
          <div class="col-md-4 p-0">
            <div class="input-group">
              <input type="text" name="filter_word" class="form-control" />
              <div class="input-group-append">
                <button
                  class="bg-lightgreen textcolor-white border-0 textsize-2"
                  style="width: 60px"
                  type="submit"
                >
                  Search
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="reviewList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md-1">Number</div>
          <div class="col-md-2">Product ID</div>
          <div class="col-md-6">Product Name</div>
          <div class="col-md-2">Created ID</div>
          <div class="col-md-1">Delete</div>
        </div>
        <hr class="line-black" />

        <!--Review 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty reviewList}">
            <c:forEach var="review" items="${reviewList}" varStatus="loop">
              <c:if test="${loop.index>0}">
                <hr class="line-gray" />
              </c:if>
              <div class="row reviewList-title">
                <div class="col-md-1">${review.reviewNo}</div>
                <div class="col-md-2">${review.goodsNo}</div>
                <div
                  class="col-md-8"
                  onClick="location.href='${contextPath}/goods/goodsDetail.do?goodsNo=${review.goodsNo}'"
                >
                  <div class="row" style="border-bottom: gray">
                    <div class="col-md-9 text-left">${review.goodsName}</div>
                    <div class="col-md-3">${review.memberId}</div>
                  </div>
                  <div class="row">
                    <div class="col text-left">
                      <c:set var="temp" value="${Math.ceil(review.star)}" />
                      <c:forEach begin="1" end="${Math.floor(review.star)}">
                        <i class="bi bi-star-fill review-star"></i>
                      </c:forEach>
                      <c:if test="${temp>review.star}">
                        <i class="bi bi-star-half review-star"></i>
                      </c:if>
                      <br />
                      ${review.content}
                    </div>
                  </div>
                </div>
                <div class="col-md-1">
                  <a
                    onClick="fn_openalert('Do you want to delete?','${contextPath}/seller/community/review/deleteReview.do?reviewNo=${review.reviewNo}');"
                    >Delete</a
                  >
                </div>
              </div>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

      <!--페이지 버튼-->
      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <button
                class="btn-2 btn-square bg-white btn-border"
                onclick="location.href='${contextPath}/seller/community/sellerReviewList.do?section=${section-1}&pageNum=1&filter_type=${filter_type}&filter_word=${filter_word}'"
              >
                <i class="bi bi-arrow-left"></i>
              </button>
            </li>
          </c:if>
          <c:set
            var="end"
            value="${Math.ceil((totalReviewsNum - (section-1)*numForPage*10) div numForPage)}"
          />
          <c:if test="${end>10}">
            <c:set var="end" value="10" />
          </c:if>
          <c:forEach begin="1" end="${end}" var="i">
            <li class="li-btn">
              <button
                class="btn-2 btn-square bg-white btn-border"
                onclick="location.href='${contextPath}/seller/community/sellerReviewList.do?section=${section}&pageNum=${i}&filter_type=${filter_type}&filter_word=${filter_word}'"
              >
                ${((section-1)*10)+i}
              </button>
            </li>
          </c:forEach>
          <c:if test="${section*numForPage*10<totalReviewsNum}">
            <li class="li-btn">
              <button
                class="btn-2 btn-square bg-white btn-border"
                onclick="location.href='${contextPath}/seller/community/sellerReviewList.do?section=${section+1}&pageNum=1&filter_type=${filter_type}&filter_word=${filter_word}'"
              >
                <i class="bi bi-arrow-right"></i>
              </button>
            </li>
          </c:if>
        </ul>
      </div>
    </section>
  </body>
</html>
