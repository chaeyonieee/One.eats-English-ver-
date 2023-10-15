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
    <title>Notice Detail</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">Notice</div>
      <hr class="line-black" />
      <div class="noticeDetail_grid">
        <div class="row noticeDetail_title">
          <div class="col textcolor-black textbold text-left textsize-3">
            ${notice.title}
          </div>
        </div>
        <hr class="line-black" />
        <div class="row noticeDetail_info">
          <div class="col textcolor-black text-left textsize-2">
            <span>Category: ${notice.category}</span>
            &nbsp;
            <span>Date of creation: ${notice.creDate}</span>
          </div>
        </div>
        <hr class="line-gray" />
        <div class="row noticeDetail_content">
          <div class="col textcolor-black text-left textsize-2">
            ${notice.content}
          </div>
        </div>
        <hr class="line-black" />

        <div class="row">
          <div class="col noticeDetail_prevNotice">
            <div class="textcolor-black text-left textsize-2">
              <a
                href="${contextPath}/community/notice/noticeDetail.do?noticeNo=${noticeBefore.noticeNo}"
                >Previous Notice | ${noticeBefore.title}</a
              >
            </div>
          </div>
        </div>
        <hr class="line-black" />
        <div class="row">
          <div class="col noticeDetail_nextNotice">
            <div class="textcolor-black text-left textsize-2">
              <a
                href="${contextPath}/community/notice/noticeDetail.do?noticeNo=${noticeAfter.noticeNo}"
              >
                Next Notice | ${noticeAfter.title}</a
              >
            </div>
          </div>
        </div>

        <hr class="line-black" />
      </div>
      <div style="float: right">
        <button
          class="btn-tolist"
          onclick="location.href='${contextPath}/community/notice/noticeList.do'"
        >
          Back to list
        </button>
      </div>
    </section>
  </body>
</html>
