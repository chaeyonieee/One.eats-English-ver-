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
        action="${contextPath}/admin/community/notice/adminNoticeAddList.do"
        method="post"
      >
        <div class="noticeForm_grid">
          <div class="row noticeForm_title">
            <div class="col textcolor-black textbold text-left textsize-3">
              <div class="input-group">
                <input
                  name="title"
                  type="text"
                  class="form-control"
                  placeholder="Please enter a title."
                  required
                />
              </div>
            </div>
          </div>
          <hr class="line-black" />
          <div class="row vertical-align">
            <div class="col-md-2 textcolor-black textbold text-left textsize-2">
              카테고리
            </div>
            <div class="col-md">
              <select name="category" id="">
                <option value="Payment">Payment</option>
                <option value="Order">Order</option>
                <option value="Event">Event</option>
              </select>
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
              ></textarea>
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
                Cancle
              </button>
              &nbsp;
              <button class="btn-write" type="submit">Write</button>
            </div>
          </div>
        </div>
      </form>
    </section>
  </body>
</html>
