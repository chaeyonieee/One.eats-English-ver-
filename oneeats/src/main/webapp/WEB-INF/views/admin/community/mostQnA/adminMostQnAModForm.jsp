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
    <title>Frequently Asked Questions Modify</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <script src="${contextPath}/js/textareaToInput.js"></script>
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        Frequently Asked Questions
      </div>
      ${mostQnA.category}
      <hr class="line-black" />
      <form
        action="${contextPath}/admin/community/mostQnA/modMostQnA.do"
        method="post"
      >
        <input type="hidden" value="${mostQnA.qnaNo}" name="qnaNo" />
        <div class="mostQnAForm_grid">
          <div class="row mostQnAForm_title">
            <div class="col textcolor-black textbold text-left textsize-3">
              <div class="input-group">
                <input
                  name="title"
                  type="text"
                  class="form-control"
                  placeholder="Please enter a title."
                  value="${mostQnA.title}"
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
                <c:forEach items="${['Payment', 'Order', 'Order']}" var="i">
                  <c:choose>
                    <c:when test="${i==mostQnA.category}">
                      <option value="${i}" selected>${i}</option>
                    </c:when>
                    <c:otherwise>
                      <option value="${i}">${i}</option>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>
              </select>
            </div>
          </div>

          <hr class="line-black" />
          <div class="row mostQnAForm_content">
            <div class="col textcolor-black text-left textsize-2">
              <textarea
                class="form-control s_textarea"
                id=""
                rows="10"
                placeholder="Please enter the contents."
                required
              >
${mostQnA.content}</textarea
              >
              <input type="hidden" name="content" id="h_input" />
            </div>
          </div>
          <hr class="line-black" />
          <div class="row">
            <div class="col-md"></div>
            <div class="col-md-4">
              <button
                class="btn-cancel"
                onclick="location.href='${contextPath}/admin/community/mostQnA/adminMostQnAList.do'"
                type="reset"
              >
                Cancle
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
