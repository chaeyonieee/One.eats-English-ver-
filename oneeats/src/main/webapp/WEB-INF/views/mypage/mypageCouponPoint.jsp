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
    <link rel="stylesheet" href="${contextPath}/css/mina.css" />
   
  </head>
  <body>
    <form method="post" action="${contextPath}/mypage/couponNum.do">
      <div class="div-p">
        <br />
        <p class="textsize-2 text-left textcolor-black textbold">
          Coupon/Rewards &nbsp
          <span class="textsize-1 textcolor-lightgray"
            >You can easily confirm the history of your owned Coupons & Rewards at a glance.</span
          >
        </p>
        <hr class="linebold" />
        <br />
        <span class="textbold" style="text-align: left">Coupon</span>
        <div class="btn-border one_div">
          <div>
            <br />
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

            <input
              style="border-color: lightgray"
              class="brd-lightgray btn-coupon btn-midlong-input textsize-1"
              placeholder="Please enter the Coupon number."
              type="text"
              name="couponCode"
            />
            <button
              type="submit"
              class="btn-couponsubmit bg-lightgreen textsize-0 border-0 margin textbold textsize-1"
             >
      Registration
            </button>
            <br />
            <span class="textsize-1 textcolor-red">
              &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
              If the Coupon includes a hyphen '-', please be sure to enter the hyphen '-'.</span
            >
            <br />
          </div>
        </div>
        <br />
        <table class="coupontd">
          <tr class="coupontr textbold">
            <td style="width: 200px; text-align: left">&nbsp&nbspCoupon Name</td>
            <td style="width: 170px">Feature</td>
            <td>Earn Discount Price</td>
            <td>Validity Period</td>
            <td>Usage Status</td>
          </tr>
          <c:forEach var="item" items="${couponDetail}" varStatus="status">
          <tr class="coupontr">
            <td style="width: 200px; text-align: left">
              &nbsp&nbsp${item.name}
            </td>
            <td style="width: 170px">Coupon</td>
            <td>${item.discount_price}</td>
            <td>${item.expDate}</td>
            <td>${item.condition}</td>
          </tr>
          </c:forEach>
        </table>
        <div>
          <ul class="ul-li">
            <c:if test="${section>1}">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section=${section-1}&pageNum=1"
                  class="btn-2 btn-square bg-white btn-border"
                >
                  <img
                    width="20px"
                    height="20px"
                    src="${contextPath}/img/icon/prev.png"
                    alt="prev"
                  />
                </a>
              </li>
            </c:if>
            <c:set
              var="end"
              value="${Math.ceil((totalCouponListNum - (section-1)*30) div 3)}"
            />
            <c:if test="${end>10}">
              <c:set var="end" value="10" />
            </c:if>
            <c:forEach begin="1" end="${end}" var="i">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section=${section}&pageNum=${i}"
                  class="btn-2 btn-square bg-white btn-border"
                  >${((section-1)*10)+i}</a
                >
              </li>
            </c:forEach>
            <c:if test="${section*30 < totalCouponListNum}">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section=${section+1}&pageNum=1"
                  class="btn-2 btn-square bg-white btn-border"
                >
                  <img
                    width="20px"
                    height="20px"
                    src="${contextPath}/img/icon/next.png"
                    alt="next"
                  />
                </a>
              </li>
            </c:if>
          </ul>
        </div>
      </form>
    </section>
        <br />
        <br />
<br>
        <section>
          <form>
        <div style="width:750px; height: 80px; text-align: center;">
          <div class ="pointd textsize-1"> 
            <div style="margin-top: 20px;" class ="textbold">
            Current Rewards<br>
            <c:set var = "total" value = "0" />
        <c:forEach var="point" items="${pointList}" varStatus="status">     
        <tr>
        <td>${result.amount}<td>
        </tr>
        <c:set var= "total" value="${total + point.amount}"/>
        </c:forEach>
        <c:out value="${total}"/>yen
           </div>
          </div>
         </div>
        <br>
        <table class="coupontd">
          
          <tr class="coupontr textbold">
            <td style="width: 200px; text-align: left">&nbsp&nbspContent</td>
            <td style="width: 170px">Date</td>
            <td>Expiration Date</td>
            <td>Price</td>
          </tr>
          <c:forEach var="item" items="${pointDetail}" varStatus="status">
          <tr class="coupontr">
            <td style="width: 200px; text-align: left">
              &nbsp&nbsp${item.name}
            </td>
            <td style="width: 170px">${item.creDate}</td>
            <td>${item.finishDate}</td>
            <td>${item.amount}point</td>
          </tr>
        </c:forEach>
       
        </table>

        <div>
          <ul class="ul-li">
            <c:if test="${section1>1}">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section1=${section1-1}&pageNum1=1"
                  class="btn-2 btn-square bg-white btn-border"
                >
                  <img
                    width="20px"
                    height="20px"
                    src="${contextPath}/img/icon/prev.png"
                    alt="prev"
                  />
                </a>
              </li>
            </c:if>
            <c:set
              var="end"
              value="${Math.ceil((totalPointListNum - (section1-1)*30) div 3)}"
            />
            <c:if test="${end>10}">
              <c:set var="end" value="10" />
            </c:if>
            <c:forEach begin="1" end="${end}" var="i">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section1=${section1}&pageNum1=${i}"
                  class="btn-2 btn-square bg-white btn-border"
                  >${((section1-1)*10)+i}</a>
              </li>
            </c:forEach>
            <c:if test="${section1*30<totalPointListNum}">
              <li class="li-btn">
                <a
                  href="${contextPath}/mypage/couponSearch.do?section1=${section1+1}&pageNum1=1"
                  class="btn-2 btn-square bg-white btn-border"
                >
                  <img
                    width="20px"
                    height="20px"
                    src="${contextPath}/img/icon/next.png"
                    alt="next"
                  />
                </a>
              </li>
            </c:if>
          </ul>
        </div>
        <br><br>
        <br>
    </form>
    </section>
  </body>
</html>