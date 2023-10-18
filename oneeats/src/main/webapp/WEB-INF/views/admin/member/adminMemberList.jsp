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
    <title>Member List</title>

    <link rel="stylesheet" href="${contextPath}/css/community.css" />
  </head>
  <body>
    <section>
      <form
        method="post"
        action="${contextPath}/admin/member/adminMemberList.do"
      >
        <div class="row vertical-align">
          <div class="col-md-2 textsize-3 text-left textbold textcolor-black">
            Member
          </div>
          <div class="col-md"></div>

          <div class="col-md-2 p-0 justify-content-end d-flex">
            <select name="adminMember_search_type">
              <option value="all">Total</option>
              <option value="id">ID</option>
              <option value="name">Name</option>
              <option value="type">Type</option>
              <option value="creDate">Registration Date</option>
            </select>
          </div>
          <div class="col-md-4 p-0">
            <div class="input-group">
              <input
                type="search"
                name="adminMember_search_word"
                class="form-control"
              />
              <div class="input-group-append">
                <button
                  class="bg-lightgreen  border-0 textsize-2"
                  style="width: 60px"
                  type="submit"
                >
                  Search
                </button>
              </div>
            </div>
          </div>
        </div>
      </form>

      <div class="clear">&nbsp;</div>
      <hr class="line-black" />

      <div class="memberList_grid textcolor-black text-center">
        <div class="row header-row textbold textsize-1">
          <div class="col-md-2">Number</div>
          <div class="col-md-2">ID</div>
          <div class="col-md-2">NickName</div>
          <div class="col-md-2">Name</div>
          <div class="col-md-2">Type</div>
          <div class="col-md-2">Registration Date</div>
        </div>

        <!--Member 리스트를 넣을 곳-->
        <c:forEach var="member" items="${adminMemberList}">
          <hr class="line-gray" />
          <div
            class="row memberList-title textsize-1"
            onclick="location.href='${contextPath}/admin/member/adminMemberDetail.do?memberNo=${member.memberNo}'"
          >
            <div class="col-md-2">${member.memberNo}</div>
            <div class="col-md-2">${member.id}</div>
            <div class="col-md-2">${member.nickname}</div>
            <div class="col-md-2">${member.name}</div>
            <div class="col-md-2">${member.type}</div>
            <div class="col-md-2">${member.creDate}</div>
          </div>
        </c:forEach>
      </div>
      <hr class="line-black" />
      <div>&nbsp;</div>

      <!-- 페이징 -->
      <div>
        <ul class="ul-li">
          <c:if test="${section>1}">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/member/adminMemberList.do?section=${section-1}&pageNum=1"
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
            value="${Math.ceil((totalMemberNum - (section-1)*100)/ 10)}"
          />
          <c:if test="${end>10}">
            <c:set var="end" value="10" />
          </c:if>
          <c:forEach begin="1" end="${end}" var="i">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/member/adminMemberList.do?section=${section}&pageNum=${i}"
                class="btn-2 btn-square bg-white btn-border"
                >${((section-1)*10)+i}</a
              >
            </li>
          </c:forEach>
          <c:if test="${section*100<totalMemberNum}">
            <li class="li-btn">
              <a
                href="${contextPath}/admin/member/adminMemberList.do?section=${section+1}&pageNum=1"
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
