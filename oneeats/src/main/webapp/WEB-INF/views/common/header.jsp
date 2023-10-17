<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Header</title>

    <link rel="stylesheet" href="${contextPath}/css/header.css" />
    <style>
      div.row div.nice-select {
        width: 100%;
      }
      .margin {
        margin-top: 4px;
        margin-left: 40px;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <div class="bg-gray">
        <div style="float: right" class="textsize-1 textcolor-black">
          <c:if test="${isLogOn==true and memberInfo.type =='Admin'}">
            <a href="${contextPath}/admin/main/adminMain.do"
              >Admin Menu&nbsp&nbsp</a
            >
          </c:if>

          <c:if test="${isLogOn==true and memberInfo.type =='Business'}">
            <a href="${contextPath}/seller/main/sellerMain.do"
              >Business Menu&nbsp&nbsp</a
            >
          </c:if>
          <c:choose>
            <c:when test="${isLogOn==true and not empty memberInfo }">
              <a href="${contextPath}/member/logout.do">Logout</a>
              &nbsp;&nbsp;
              <a href="${contextPath}/mypage/myPageMain.do">MyPage</a>
              &nbsp;&nbsp;
              <a href="${contextPath}/community/notice/noticeList.do"
                >Customer Service</a
              >
            </c:when>

            <c:otherwise>
              <a href="${contextPath}/member/registerTypeSelect.do">Sign Up</a
              >&nbsp; &nbsp;
              <a href="${contextPath}/member/loginForm.do">Login</a>
              &nbsp;&nbsp;
              <a href="${contextPath}/community/notice/noticeList.do">C&S</a>
            </c:otherwise>
          </c:choose>
        </div>
      </div>
      <div class="row">&nbsp;</div>
      <div class="row">
        <div class="col-3">
          <a href="${contextPath}/main/mainPage.do">
            <img
              src="${contextPath}/img/logo2.jpg"
              alt="Logo"
              style="width: 100%; height: auto"
            />
          </a>
        </div>
        <div class="col-1">&nbsp;</div>
        <div class="col-6">
          <div class="row">
            <div class="col-md">
              <form action="${contextPath}/goods/search.do">
                <div class="row vertical-align">
                  <div class="col-md-2 p-0">
                    <select name="filter_type" id="">
                      <option value="all">Total</option>
                      <option value="Product Name">Product Name</option>
                      <option value="Seller">Seller</option>
                      <option value="Country of origin">
                        Country of origin
                      </option>
                    </select>
                  </div>
                  <div class="col-md p-0">
                    <!-- Search bar content -->
                    <div class="input-group">
                      <input
                        type="text"
                        class="form-control"
                        name="filter_word"
                      />
                      <div class="input-group-append">
                        <button
                          style="background-color: #dd2124"
                          class="textcolor-white border-0"
                          type="submit"
                        >
                          Search
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="row">&nbsp;</div>
          <div class="row">
            <div class="col-md">
              <a href="${contextPath}/main/mainPage.do">Home</a>
            </div>
            <div class="col-md">
              <a href="${contextPath}/goods/goodsList.do?category=best">Best</a>
            </div>
            <div class="col-md">
              <a href="${contextPath}/goods/hotDealList.do">Hot Deal</a>
            </div>
            <div class="col-md">
              <a href="${contextPath}/community/recipe/recipeList.do">Recipe</a>
            </div>
          </div>
        </div>
        <div class="col-2">
          <div class="row margin">
            <div
              class="col d-flex align-items-center justify-content-center textsize-3"
            >
              <a href="${contextPath}/main/cart.do">
                <i class="bi bi-cart4"></i>
              </a>
            </div>
            <div
              class="col d-flex align-items-center justify-content-center textsize-3"
            >
              <a href="${contextPath}/mypage/mypageBookmarkList.do">
                <i class="bi bi-heart"></i>
              </a>
            </div>
            <div class="col">&nbsp;</div>
          </div>
          <div class="row">&nbsp;</div>
        </div>
      </div>
    </div>
  </body>
</html>
