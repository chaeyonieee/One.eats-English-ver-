<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${contextPath}/css/mina.css" />
    <meta charset="UTF-8" />
    <title>ID 찾기</title>
  </head>
  <body>
    <form method="post" action="${contextPath}/member/login.do">
      <br />
      <br />
      <br />
      <div class="main-container">
        <div class="sellermain-wrap">
          <div class="textsize-3 textbold">
            <div class="brd-lightgreen btn-round">
              <br />
              <div class="serve-wrap">
                <span class="textsize-2">We found your ID.</span
                ><br />
                <span class="textsize-1">Please log in after confirming your ID.</span>
                <br /><br />
                <c:forEach var="id" items="${idList}"
                  ><div class="textsize-2 textbold">${id}<br /></div
                ></c:forEach>

                <br />
                <button
                  class="btn-midlong bg-lightgray textsize-1 border-0 margin btn-round"
                >
                  Search Password
                </button>
                <button
                  class="btn-midlong bg-lightgreen textsize-1 border-0 btn-round"
                >
                  Login
                </button>
                <br /><br />
              </div>
            </div>
            <br />
            <br />
            <br />
            <br />
          </div>
        </div>
      </div>
    </form>
  </body>
</html>
