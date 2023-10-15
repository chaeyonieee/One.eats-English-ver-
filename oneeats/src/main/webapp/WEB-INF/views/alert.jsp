<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix
="c" uri ="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn"
uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <input type="hidden" id="h_msg" value="${redirectMessage}" />
    <input type="hidden" id="h_redirectPage" value="${redirectPage}" />

    <script>
      window.addEventListener("load", function () {
        var h_msgInput = document.getElementById("h_msg");
        var h_msgValue = h_msgInput.value;
        alert(h_msgValue);
        var h_redirectInput = document.getElementById("h_redirectPage");
        var h_redirectValue = h_redirectInput.value;
        window.location.href = h_redirectValue;
      });
    </script>
  </body>
</html>
