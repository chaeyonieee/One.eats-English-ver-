<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Footer</title>
  </head>
  <body>
    <!-- Footer Section Begin -->
    <footer class="footer spad">
      <div class="container-xl">
        <div class="row justify-content-md-center">
          <div class="col-lg-4">
            <div class="footer__about">
              <div class="footer__about__logo">
                <a href="#"
                  ><img
                    src="${contextPath}/img/logo.png"
                    alt=""
                    style="filter: grayscale(100%); max-width: 300px"
                /></a>
              </div>
              <div class="textcolor-black text-left">
                <p>
                  OneEATS advocates for the symbiosis between small farms and
                  single-person households. Enjoy sustainability and
                  eco-friendly produce, along with perfectly portioned meal kits
                  for a healthier you and a greener world!
                </p>
                <br />
                <p>since 2023.</p>
              </div>
            </div>
          </div>
          <div class="col-lg-4 text-left">
            <p class="textsize-3 textbold">Directions</p>
            <p class="textsize-1 textcolor-black">Address: Tokyo, Japan</p>
            <img src="${contextPath}/img/banner/map.PNG" alt="" width="100%" />
          </div>
          <div class="col-lg-4 text-left">
            <p class="textsize-3 textbold">Customer Service</p>
            <p class="textsize-1 textcolor-black">
              Operating Hours: Weekdays 9:00 AM to 6:00 PM<br />
              (Closed on weekends and holidays)
            </p>
            <p class="textsize-1 textcolor-gray">
              Corporate Name : OneEATS<br />
              Business Registration Number: 123-45-67890 <br />
              Online Sales License: No. 2023-Beppu-12345 <br />
              FAX: 070-1234-5678
            </p>

            <p>&nbsp;</p>
            <div class="row">
              <a href="">
                <img src="" alt="" />
              </a>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <!-- Footer Section End -->
  </body>
</html>
