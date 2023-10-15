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
        $("#notice_category_select").change(function () {
          $(this).closest("form").submit();
        });
      });
    </script>
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        Notice
        <div style="float: right">
          <form
            id="notice_category_form"
            action="${contextPath}/community/notice/noticeList.do"
          >
            <select id="notice_category_select" name="category">
              <option value="all">Category</option>
              <option value="Payment">Payment</option>
              <option value="Order">Order</option>
              <option value="Event">Event</option>
            </select>
          </form>
        </div>
      </div>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="noticeList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md-2">Category</div>
          <div class="col-md">Title</div>
          <div class="col-md-3">Date of creation</div>
        </div>
        <hr class="line-black" />
        <div
          class="row noticeList-title"
          onclick="location.href='${contextPath}/community/notice/noticeDetail.do';"
        ></div>

        <!--Notice 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty noticeVO}">
            <c:forEach var="notice" items="${noticeVO}">
              <div
                class="row noticeList-title"
                onclick="location.href='${contextPath}/community/notice/noticeDetail.do?noticeNo=${notice.noticeNo}';"
              >
                <div class="col-md-2">${notice.category}</div>
                <div class="col-md text-left">${notice.title}</div>
                <div class="col-md-3">${notice.creDate}</div>
              </div>
              <hr class="line-gray" />
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <a
                href="${contextPath}/community/notice/noticeList.do?section=${section-1}&pageNum=1&category=${category}"
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
                href="${contextPath}/community/notice/noticeList.do?section=${section}&pageNum=${i}&category=${category}"
                class="btn-2 btn-square bg-white btn-border"
                >${((section-1)*10)+i}</a
              >
            </li>
          </c:forEach>
          <c:if test="${section*100<totalNoticeNum}">
            <li class="li-btn">
              <a
                href="${contextPath}/community/notice/noticeList.do?section=${section+1}&pageNum=1&category=${category}"
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
