<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib uri
="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix ="c"
uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>sidebar</title>
    <link rel="stylesheet" href="${contextPath}/css/side.css" />

    <script>
      var rotateArray = new Array(0, 0, 0, 0, 0);
      $(document).ready(function () {
        var currentPath = window.location.pathname;
        var lastSlashIndex = currentPath.lastIndexOf("/");
        var secondLastSlashIndex = currentPath.lastIndexOf(
          "/",
          lastSlashIndex - 1
        );
        var selectedSideMenu = currentPath.substring(
          secondLastSlashIndex + 1,
          lastSlashIndex
        );
        $("#menu_" + selectedSideMenu).addClass("selected_menu");
        console.log(selectedSideMenu);
      });
    </script>
    <script src="${contextPath}/js/side.js"></script>
  </head>
  <body>
    <input id="h_selectedSideMenu" type="hidden" value="" />
    <div class="row">
      <div class="col-lg">
        <div style="text-align: left" class="textsize-2 textcolor-black border">
          <div
            style="
              width: 100%;
              height: 50px;
              display: flex;
              align-items: center;
              margin-top: 12px;
              margin-left: 4px;
            "
          >
            <span class="textsize-3 textbold"
              >&nbsp;&nbsp;Customer Service</span
            >
          </div>
          <ul class="ul_menus" style="margin-left: 16px">
            <li id="menu_notice">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/community/notice/noticeList.do"
                    >Notice</a
                  >
                  <img
                    src="${contextPath}/img/icon/next.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
              </div>
            </li>

            <li id="menu_mostQnA">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/community/mostQnA/mostQnAList.do"
                    >Frequently Asked Questions</a
                  >
                  <img
                    src="${contextPath}/img/icon/next.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
              </div>
            </li>
            <li id="menu_oneQnA">
              <div style="margin-right: 12px">
                <div class="textbold" style="width: 100%">
                  <a href="${contextPath}/community/oneQnA/oneQnAList.do"
                    >1:1 Inquiry
                  </a>
                  <img
                    src="${contextPath}/img/icon/next.png"
                    alt=""
                    style="width: 10px; float: right"
                  />
                </div>
              </div>
            </li>
          </ul>

          <div
            style="
              width: 90%;
              height: auto;
              margin-left: auto;
              margin-right: auto;
              margin-top: 24px;
              margin-bottom: 16px;
              padding: 12px;
            "
            class="bg-lightgray text-left textcolor-black"
            onclick="location.href='#';"
          >
            <span class="textsize-1 textbold"
              >If you want a quick response?</span
            >
            <br />
            <span class="textsize-1">Chatbot Consultation → </span>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
