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
    <title>Notice Write</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">Notice</div>
      <hr class="line-black" />
      <form
        action="${contextPath}/admin/community/notice/adminNotideDetailMod.do?noticeNo=${notice.noticeNo}"
        method="post"
      >
        <div class="noticeForm_grid">
          <div class="row noticeForm_title">
            <div class="col textcolor-black textbold text-left textsize-2">
              <div class="input-group">
                <input
                  name="title"
                  type="text"
                  class="form-control"
                  placeholder="Please enter a title."
                  value="${notice.title}"
                  required
                />
              </div>
            </div>
          </div>
          <hr class="line-black" />
          <div class="row vertical-align">
            <div class="col-md-2 textcolor-black textbold text-left textsize-3">
              Category
            </div>
            <div class="col-md">
              <select name="category" value="${notice.category}" id="">
                <option value="Payment">Payment</option>
                <option value="Order">Order</option>
                <option value="Order">Order</option>
              </select>
            </div>
            <div class="col-md text-left textsize-1 textcolor-black">
              Date of creation: ${notice.creDate}
            </div>
          </div>

          <hr class="line-black" />
          <div class="row noticeForm_content">
            <div class="col textcolor-black text-left textsize-2">
              <textarea
                name="content"
                class="form-control"
                id=""
                rows="10"
                placeholder="Please enter the contents."
                required
              >
${notice.content}</textarea
              >
            </div>
          </div>
          <hr class="line-black" />
          <div class="row">
            <div class="col-md"></div>
            <div class="col-md-4">
              <button
                class="btn-cancel"
                onclick="location.href='${contextPath}/admin/community/notice/adminNoticeList.do'"
                type="reset"
              >
                cancel
              </button>
              &nbsp;
              <button class="btn-write" onclick="" type="submit">Write</button>
            </div>
          </div>
        </div>
      </form>
    </section>
  </body>
</html>
