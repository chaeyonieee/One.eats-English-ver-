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

    <!--bootstrap-->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <!-- Css Styles -->
    <link
      rel="stylesheet"
      href="${contextPath}/css/elegant-icons.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/nice-select.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/jquery-ui.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/owl.carousel.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/slicknav.min.css"
      type="text/css"
    />
    <link
      rel="stylesheet"
      href="${contextPath}/css/style.css"
      type="text/css"
    />
    <link rel="stylesheet" href="${contextPath}/css/common.css" />
    <!-- Js Plugins -->
    <script src="${contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${contextPath}/js/bootstrap.min.js"></script>
    <script src="${contextPath}/js/jQueryRotate.js"></script>

    <!--추가한 js-->
    <script src="${contextPath}/js/common.js"></script>

    <!--추가한 css-->

    <link rel="stylesheet" href="${contextPath}/css/font.css" />
    <link rel="stylesheet" href="${contetPath}/css/notice-window.css" />
  </head>
  <body>
    <!-- Page Preloder -->
    <!-- <div id="preloder">
      <div class="loader"></div>
    </div> -->
    <div id="top"></div>
    <div id="container">
      <div id="header" class="container-md" style="margin-bottom: 18px">
        <tiles:insertAttribute name="header" />
      </div>
      <div class="container-md">
        <div id="sidebar-left">
          <tiles:insertAttribute name="side" />
        </div>
        <div id="content">
          <tiles:insertAttribute name="body" />
        </div>
      </div>
      <div id="footer">
        <tiles:insertAttribute name="footer" />
      </div>
    </div>

    <div class="modal-overlay">
      <div
        id="alert_window"
        class="btn-round border-dark bg-white text-center modal-content m-0"
      >
        <div class="modal-body">
          <span id="alert_message"
            >This is an <br />
            Notification Message.</span
          >
        </div>
        <div class="btn-group modal-footer p-0 m-0">
          <button
            id="cancel-button"
            class="btn textcolor-lightgray border-0 m-0"
            onclick="closeModal();"
          >
            Cancle
          </button>
          <button id="confirm-button" class="btn textcolor-green border-0 m-0">
            Confirm
          </button>
        </div>
      </div>
    </div>

    <div class="fixed_quick_menu">
      <div class="btn_grid">
        <div class="row">
          <div class="col">
            <a href="#top">
              <img
                class="btn_square"
                src="${contextPath}/img/icon/uparrow.png"
                alt=""
              />
            </a>
          </div>
        </div>
        <div class="row">
          <div
            id="sidebar-open-btn"
            class="col text-center"
            onclick="fn_openSideBar();"
          >
            <i class="bi bi-window-sidebar textsize-4"></i>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <a href="#bottom">
              <img
                class="btn_square"
                src="${contextPath}/img/icon/downarrow.png"
                alt=""
              />
            </a>
          </div>
        </div>
      </div>
    </div>
    <div id="bottom"></div>
  </body>
  <script src="${contextPath}/js/jquery.nice-select.min.js"></script>
  <script src="${contextPath}/js/jquery-ui.min.js"></script>
  <script src="${contextPath}/js/jquery.slicknav.js"></script>
  <script src="${contextPath}/js/mixitup.min.js"></script>
  <script src="${contextPath}/js/owl.carousel.min.js"></script>
  <script src="${contextPath}/js/main.js"></script>
</html>
