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
    <title>List of frequently asked questions</title>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
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
            action="${contextPath}/admin/community/mostQnA/adminMostQnAList.do"
          >
            <select id="mostQnA_category_select" name="category">
              <option value="">category</option>
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
          <div class="col-md-2"></div>
          <div class="col-md-2">category</div>
          <div class="col-md">Title</div>
          <div class="col-md-1">Modify</div>
          <div class="col-md-1">Delete</div>
        </div>
        <hr class="line-black" />

        <!--Frequently Asked Questions 리스트를 넣을 곳-->
        <c:choose>
          <c:when test="${not empty mostQnAList}">
            <c:forEach var="mostQnA" items="${mostQnAList}">
              <div class="mostQnAList_rows">
                <div class="row toggle-btn mostQnAList-title">
                  <div class="col-md-2">${mostQnA.qnaNo}</div>
                  <div class="col-md-2">${mostQnA.category}</div>
                  <div class="col-md">${mostQnA.title}</div>
                  <div class="col-md-1">
                    <a
                      href="${contextPath}/admin/community/mostQnA/adminMostQnAModForm.do?qnaNo=${mostQnA.qnaNo}"
                      >Modify</a
                    >
                  </div>
                  <div class="col-md-1">
                    <a
                      onClick="fn_openalert('Do you want to delete?','${contextPath}/admin/community/mostQnA/deleteQnA.do?qnaNo=${mostQnA.qnaNo}')"
                      >Delete</a
                    >
                  </div>
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

      <!--Write 버튼-->
      <div class="row">
        <div class="col">
          <div style="float: right">
            <button
              class="btn-toform"
              onclick="location.href='${contextPath}/admin/community/mostQnA/adminMostQnAForm.do'"
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
          <c:if test="${section*10<totalMostQnANum}">
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
