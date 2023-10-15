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
    <title>1:1 Inquiry in Detail</title>
    <style>
      .reply_reply {
        width: 100%;
      }
      .reply_level_2 {
        padding-left: 20px;
      }
      .reply_level_3 {
        padding-left: 40px;
      }
      .reply_level_4 {
        padding-left: 60px;
      }
      .reply_level_5 {
        padding-left: 80px;
      }
    </style>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <div class="textsize-3 text-left textbold textcolor-black">
        1:1 Inquiry
      </div>
      <hr class="line-black" />
      <div class="oneQnADetail_grid">
        <div class="row oneQnADetail_title">
          <div class="col textcolor-black textbold text-left textsize-3">
            ${oneQnAList.title}
          </div>
        </div>
        <hr class="line-black" />
        <div class="row oneQnADetail_info">
          <div class="col textcolor-black text-left textsize-2">
            <span>Date of creation: ${oneQnAList.creDate}</span>
          </div>
        </div>
        <hr class="line-gray" />
        <div class="row oneQnADetail_content">
          <div class="col textcolor-black text-left textsize-2">
            ${oneQnAList.content}
          </div>
        </div>
        <br />
        <div class="row">
          <div class="col text-left textbold textsize-2">
            <a onclick="fn_show(1)">→Write a comment</a>
          </div>
        </div>

        <div class="toggle-content hidden_content_1">
          <hr class="line-black" />
          <form
            action="${contextPath}/community/oneQnA/QnAReply.do?qnaNo=${oneQnAList.qnaNo}"
            method="post"
          >
            <div class="row h_reply_form">
              <div class="col">
                <textarea
                  name="content"
                  id=""
                  rows="10"
                  placeholder="Enter a comment..."
                  style="width: 100%"
                ></textarea>
              </div>
            </div>
            <div class="row">
              <div class="col-md"></div>
              <div class="col-md-4">
                <button class="btn-cancel" onclick="fn_show(1)" type="reset">
                  Cancle
                </button>
                &nbsp;
                <button
                  class="btn-write"
                  onclick="location.href='${contextPath}/community/oneQnA/QnAReply.do?qnaNo=${oneQnAList.qnaNo}'"
                  type="submit"
                >
                  Write
                </button>
              </div>
            </div>
          </form>
        </div>

        <hr class="line-black" />
        <div class="row">
          <div class="col text-left textbold textcolor-black textsize-2">
            Comment
          </div>
        </div>
        <hr class="line-black" />
      </div>
      <!--댓글 리스트 예정지-->
      <c:choose>
        <c:when test="${not empty replyList}">
          <c:forEach var="reply" items="${replyList}" varStatus="loop">
            <c:if test="${loop.index>0}">
              <hr class="line-black" />
            </c:if>

            <c:set var="level" value="${reply.level}" />
            <c:if test="${level>5}">
              <c:set var="level" value="5" />
            </c:if>
            <!--댓글 Content-->
            <div class="row oneQnA_reply_row reply_level_${reply.level}">
              <div class="col">
                <div class="row oneQnA_reply_head">
                  <div class="col-md-2">
                    <img
                      src="${contextPath}/download.do?imageFileName=${reply.profile}&path=memberNo${reply.memberNo}"
                      alt="프로필 사진"
                    />
                  </div>
                  <div class="col-md text-left">
                    <span class="textsize-2 textbold textcolor-black"
                      >${reply.memberName}</span
                    >
                    <br />
                    <span class="textsize-1">${reply.creDate}</span>
                  </div>
                </div>
                <div class="row oneQnA_reply_content">
                  <div class="col text-left textcolor-black textsize-2">
                    ${reply.content}
                  </div>
                </div>
                <br />
                <div class="row oneQnA_reply_footer">
                  <div class="col text-left textsize-2">
                    <a onclick="fn_show('${loop.index+2}')">→Write a comment</a>
                  </div>
                </div>
              </div>
            </div>
            <!--댓글 Content 끝-->
            <!--답글 입력 폼-->
            <div class="toggle-content hidden_content_${loop.index+2}">
              <hr class="line-black" />
              <form
                action="${contextPath}/community/oneQnA/DoubleReply.do?qnaNo=${reply.qnaNo}"
                method="post"
              >
                <div class="row h_reply_form">
                  <div class="col">
                    <textarea
                      name="content"
                      class="reply_reply"
                      id=""
                      rows="10"
                      placeholder="Enter a comment..."
                    ></textarea>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md"></div>
                  <div class="col-md-4">
                    <button
                      class="btn-cancel"
                      onclick="fn_show('${loop.index+2}')"
                      type="reset"
                    >
                      Cancle
                    </button>
                    &nbsp;
                    <button class="btn-write" type="submit">Write</button>
                  </div>
                </div>
              </form>
            </div>
            <!--답글 입력 폼 끝-->
          </c:forEach>
        </c:when>
      </c:choose>

      <hr class="line-black" />
      <div style="float: right">
        <button
          class="btn-tolist"
          onclick="location.href='${contextPath}/community/oneQnA/oneQnAList.do'"
        >
          Back to list
        </button>
      </div>
    </section>
  </body>
</html>
