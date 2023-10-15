<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <style>
      .main-wrap {
        min-height: 600px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 36px;
        font-weight: 600px;
      }
    </style>
  </head>
  <body>
    <div class="main-wrap">
      <div class="row">
        <div class="col">
          <span style="font-size: 52px"
            ><i class="bi bi-exclamation-square"></i
          ></span>
          <br />
          Sorry. <br />
          An error has occurred. <br />
          Error Code : ${statusCode}
        </div>
      </div>
    </div>
  </body>
</html>
