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
    <style>
      #available_reviews_grid img {
        max-width: 100%;
        max-height: 100%;
      }
      #available_reviews_grid > div.row > div {
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: left;
      }

      .point {
        text-align: center;
        margin: 0 auto;
        width: 250px;
        height: 80px;
        padding: 40px 0;
      }

      table {
        margin-left: auto;
        margin-right: auto;
      }

      .table-review {
        width: 500px;
        height: 50px;
        text-align: center;
      }
      .reviewImage {
        width: 100px;
        height: 100px;
        text-align: center;
      }

      div#done_reviews_grid img {
        width: 150px;
        text-align: left;
        padding: 5px;
      }
    </style>
  </head>
  <body>
    <div class="profile-edit-header text-left">
      <br />
      <span class="textsize-3 textbold">리뷰작성</span>
      <hr class="line-black" />
      <br />
      <p class="textsize-1 text-left textcolor-lightgray">
        · 사진후기 150원, 글후기 50원 적립, 동일 상품의 후기는 월 1회만 적립금을
        지급해드립니다. <br />
        · 후기 작성 후 첫 영업일에 적립금이 지급됩니다.
      </p>
      <br /><br />
      <h5 class="textsize-2 reviewdiv">
        작성가능 리뷰 ${totalAvailableReviewsNum} 개
      </h5>
      <br />
      <div id="available_reviews_grid">
        <c:forEach var="item" items="${availableReviewList}" varStatus="status">
          <div class="row">
            <div class="col-md-3">
              <img
                src="${contextPath}/download.do?imageFileName=${item.goodsImg}&path=goodsNo${item.goodsNo}"
              />
            </div>
            <div class="col-md textsize-2 textbold">
              ${item.goodsName} ${item.goods_qty}개 <br />
              ${item.deliveryDate} ${item.delivery_status}
            </div>
            <div class="col-md textsize-2 textbold">
              <button
                class="bg-lightgreen border-0"
                type="button"
                onclick="location.href='${contextPath}/review/writeReview.do?order_seqNo=${item.order_seqNo}'"
              >
                리뷰작성
              </button>
            </div>
          </div>

          <hr class="line-gray" />
        </c:forEach>
        <div>
          <ul class="ul-li">
            <c:if test="${section>1}">
              <li class="li-btn">
                <button
                  class="btn-2 btn-square bg-white btn-border"
                  onclick="fn_loadAvailableReviews('-1','1','${memberInfo.memberNo}')"
                >
                  <i class="bi bi-arrow-left"></i>
                </button>
              </li>
            </c:if>
            <c:set
              var="end"
              value="${Math.ceil((totalAvailableReviewsNum - (section-1)*numForPage*10) div numForPage)}"
            />
            <c:if test="${end>10}">
              <c:set var="end" value="10" />
            </c:if>
            <c:forEach begin="1" end="${end}" var="i">
              <li class="li-btn">
                <button
                  class="btn-2 btn-square bg-white btn-border"
                  onclick="fn_loadAvailableReviews('0','${i}','${memberInfo.memberNo}')"
                >
                  ${((section-1)*10)+i}
                </button>
              </li>
            </c:forEach>
            <c:if test="${section*numForPage*10<totalAvailableReviewsNum}">
              <li class="li-btn">
                <button
                  class="btn-2 btn-square bg-white btn-border"
                  onclick="fn_loadAvailableReviews('1','1','${memberInfo.memberNo}')"
                >
                  <i class="bi bi-arrow-right"></i>
                </button>
              </li>
            </c:if>
          </ul>
        </div>
      </div>
      <br />
      <hr class="line-black" />
      <br />
      <h5 class="textsize-2 reviewdiv">작성한 리뷰 ${totalDoneReviewsNum}개</h5>

      <br />
      <div id="done_reviews_grid">
        <c:forEach var="item" items="${doneReviewList}" varStatus="status">
          <div
            class="row"
            onclick="location.href='${contextPath}/goods/goodsDetail.do?goodsNo=${item.goodsNo}'"
          >
            <div class="col-md-3 reviewImage">
              <img
                src="${contextPath}/download.do?imageFileName=${item.goodsImg}&path=goodsNo${item.goodsNo}"
              />
            </div>
            <div class="col-md textsize-2 textbold">
              ${item.goodsName} 총 수량 ${item.goods_qty}개 <br />
              ${item.deliveryDate} ${item.delivery_status}
            </div>
          </div>
          <hr class="line-gray" />
        </c:forEach>
        <div>
          <ul class="ul-li">
            <c:if test="${section>1}">
              <li class="li-btn">
                <button
                  class="btn-2 btn-square bg-white btn-border"
                  onclick="fn_loadDoneReviews('-1','1','${memberInfo.memberNo}')"
                >
                  <i class="bi bi-arrow-left"></i>
                </button>
              </li>
            </c:if>
            <c:set
              var="end"
              value="${Math.ceil((totalDoneReviewsNum - (section-1)*numForPage*10) div numForPage)}"
            />
            <c:if test="${end>10}">
              <c:set var="end" value="10" />
            </c:if>
            <c:forEach begin="1" end="${end}" var="i">
              <li class="li-btn">
                <button
                  class="btn-2 btn-square bg-white btn-border"
                  onclick="fn_loadDoneReviews('0','${i}','${memberInfo.memberNo}')"
                >
                  ${((section-1)*10)+i}
                </button>
              </li>
            </c:forEach>
            <c:if test="${section*numForPage*10<totalDoneReviewsNum}">
              <li class="li-btn">
                <button
                  class="btn-2 btn-square bg-white btn-border"
                  onclick="fn_loadDoneReviews('1','1','${memberInfo.memberNo}')"
                >
                  <i class="bi bi-arrow-right"></i>
                </button>
              </li>
            </c:if>
          </ul>
        </div>
      </div>
    </div>

    <script>
      var doneSection = 1;
      var avaliableSection = 1;
      function fn_loadAvailableReviews(prev_next, pageNum, memberNo) {
        $.ajax({
          type: "POST",
          url: "/mypage/availableReviews.do",
          dataType: "html",
          data: {
            section: avaliableSection + parseInt(prev_next),
            pageNum: pageNum,
            memberNo: memberNo,
          },
          success: function (response) {
            $("#available_reviews_grid").html(response);
            console.log(response);
            avaliableSection = avaliableSection + parseInt(prev_next);
            $("html, body").animate(
              {
                scrollTop: $("#available_reviews_grid").offset().top,
              },
              500
            );
          },
          error: function (response) {
            alert("원인불명의 에러");
            console.log(response);
          },
        });
      }

      function fn_loadDoneReviews(prev_next, pageNum, memberNo) {
        $.ajax({
          type: "POST",
          url: "/mypage/doneReviews.do",
          dataType: "html",
          data: {
            section: doneSection + parseInt(prev_next),
            pageNum: pageNum,
            memberNo: memberNo,
          },
          success: function (response) {
            $("#done_reviews_grid").html(response);
            console.log(response);
            doneSection = doneSection + parseInt(prev_next);
            $("html, body").animate(
              {
                scrollTop: $("#done_reviews_grid").offset().top,
              },
              500
            );
          },
          error: function (response) {
            alert("원인불명의 에러");
            console.log(response);
          },
        });
      }
    </script>
  </body>
</html>
