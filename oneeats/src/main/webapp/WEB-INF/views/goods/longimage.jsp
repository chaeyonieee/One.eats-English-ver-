<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <c:choose>
      <c:when
        test="${goods.category == 'Juice / Homemade Jam' || goods.category == 'Fruits' || goods.category == 'Vegetables'}"
      >
        <section
          class="breadcrumb-section set-bg"
          data-setbg="${contextPath}/img/breadcrumb1.jpg"
        >
          <div class="container">
            <div class="row">
              <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                  <h2>${goods.category}</h2>
                  <div class="breadcrumb__option"></div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </c:when>
      <c:otherwise>
        <section
          class="breadcrumb-section set-bg"
          data-setbg="${contextPath}/img/breadcrumb5.png"
        >
          <div class="container">
            <div class="row">
              <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                  <h2>${goods.category}</h2>
                  <div class="breadcrumb__option"></div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </c:otherwise>
    </c:choose>
    <!-- Breadcrumb Section End -->
  </body>
</html>
