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
    <title>Frequently Asked Questions List</title>
    <script>
      $(document).ready(function () {
        $("#mostQnA_category_select").change(function () {
          $(this).closest("form").submit();
        });
      });
    </script>
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        Frequently Asked Questions
        <div style="float: right">
          <form
            id="mostQnA_category_form"
            action="${contextPath}/community/mostQnA/mostQnAList.do"
          >
            <select id="mostQnA_category_select" name="category">
              <option value="">Category</option>
              <option value="Payment">Payment</option>
              <option value="Order">Order</option>
              <option value="Order">Order</option>
            </select>
          </form>
        </div>
      </div>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />
      <div class="mostQnAList_grid textcolor-black text-center">
        <div class="row header-row textbold">
          <div class="col-md-2">Number</div>
          <div class="col-md-2">Category</div>
          <div class="col-md">Title</div>
        </div>
        <hr class="line-black" />

        <!--Frequently Asked Questions 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty mostQnAList}">
            <c:forEach var="mostQnA" items="${mostQnAList}" varStatus="loop">
              <div class="mostQnAList_rows">
                <div class="row toggle-btn mostQnAList-title">
                  <div class="col-md-2">${mostQnA.qnaNo}</div>
                  <div class="col-md-2">${mostQnA.category}</div>
                  <div class="col-md">${mostQnA.title}</div>
                </div>
                <div
                  class="row toggle-content mostQnAList-content"
                  style="margin-top: 12px"
                >
                  <div
                    class="col-md"
                    style="padding: 12px; margin-left: 12px; margin-right: 12px"
                  >
                    <div class="bg-lightgray text-left" style="padding: 12px">
                      ${mostQnA.content}
                    </div>
                  </div>
                </div>
              </div>
              <c:if test="${loop.index!=mostQnAList.size()-1}">
                <hr class="line-gray" />
              </c:if>
            </c:forEach>
          </c:when>
        </c:choose>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <a
                href="${contextPath}/community/mostQnA/mostQnAList.do?section=${section-1}&pageNum=1"
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
            value="${Math.ceil((totalMostQnANum - (section-1)*100) div 10)}"
          />
          <c:if test="${end>10}">
            <c:set var="end" value="10" />
          </c:if>
          <c:forEach begin="1" end="${end}" var="i">
            <li class="li-btn">
              <a
                href="${contextPath}/community/mostQnA/mostQnAList.do?section=${section}&pageNum=${i}"
                class="btn-2 btn-square bg-white btn-border"
                >${((section-1)*10)+i}</a
              >
            </li>
          </c:forEach>
          <c:if test="${section*100<totalMostQnANum}">
            <li class="li-btn">
              <a
                href="${contextPath}/community/mostQnA/mostQnAList.do?section=${section+1}&pageNum=1"
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
