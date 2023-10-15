<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> <%@ taglib prefix
="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Notice List</title>
    <script>
      $(document).ready(function () {
        $("#admin_notice_category_select").change(function () {
          $(this).closest("form").submit();
        });
      });
    </script>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        Notice
        <div style="float: right">
          <form
          id="admin_notice_category_form"
          action="${contextPath}/admin/community/notice/adminNoticeList.do"
        >
          <select id="admin_notice_category_select" name="category">
            <option value="all">Category</option>
            <option value="Payment">Payment</option>
            <option value="Order">Order</option>
            <option value="Event">Event</option>
          </select>
        </div>
      </div>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="noticeList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md-2">Category</div>
          <div class="col-md">Title</div>
          <div class="col-md-2">Date of creation</div>
          <div class="col-md-1">Modify</div>
          <div class="col-md-1">Delete</div>
        </div>

        <!--Notice 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty noticeList}">
            <c:forEach var="notice" items="${noticeList}">
              <hr class="line-gray" />
              <div class="row noticeList-title" 
              onclick="location.href='${contextPath}/community/notice/noticeDetail.do?noticeNo=${notice.noticeNo}';">
                <div class="col-md-2">${notice.category}</div>
                <div class="col-md text-left">${notice.title}</div>
                <div class="col-md-2">${notice.creDate}</div>
                <div class="col-md-1">
                  <a
                    href="${contextPath}/admin/community/notice/adminNoticeMod.do?noticeNo=${notice.noticeNo}"
                    >Modify</a
                  >
                </div>
                <div class="col-md-1">
                  <a
                    href="${contextPath}/admin/community/notice/admindeleteNotice.do?noticeNo=${notice.noticeNo}"
                  >
                    Delete
                  </a>
                </div>
              </div>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

      <!--Write 버튼-->
      <div class="row">
        <div class="col">
          <div style="float: right">
            <button
            type="button"
              class="btn-toform"
              onclick="location.href='${contextPath}/admin/community/notice/adminNoticeForm.do'"
            >
              Write
            </button>
          </div>
        </div>
      </div>

      <!--페이지 버튼-->
      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/community/notice/adminNoticeList.do?section=${section-1}&pageNum=1&category=${category}"
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
            value="${Math.ceil((totalNoticeNum - (section-1)*100) div 10)}"
          />
          <c:if test="${end>10}">
            <c:set var="end" value="10" />
          </c:if>
          <c:forEach begin="1" end="${end}" var="i">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/community/notice/adminNoticeList.do?section=${section}&pageNum=${i}&category=${category}"
                class="btn-2 btn-square bg-white btn-border"
                >${((section-1)*10)+i}</a
              >
            </li>
          </c:forEach>
          <c:if test="${section*100<totalNoticeNum}">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/community/notice/adminNoticeList.do?section=${section+1}&pageNum=1&category=${category}"
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
    </section>
  </body>
</html>
