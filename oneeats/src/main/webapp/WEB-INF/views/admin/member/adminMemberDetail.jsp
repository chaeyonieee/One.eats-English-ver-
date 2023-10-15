<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="${contextPath}/css/community.css" />
    <meta charset="UTF-8" />
    <title>Membership Registration Selection Page</title>
    <style></style>
  </head>
  <body>
    <section>
      <div class="row vertical-align">
        <div class="col-md textsize-3 text-left textbold textcolor-black">
          Member Information
        </div>
      </div>
      <hr class="line-black" />

      <div class="adminMemberDetail_grid text-left textcolor-black textsize-2">
        <div class="row">
          <div class="col-md-2 textbold">Type</div>
          <div class="col-md">${adminMember.type}</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">ID</div>
          <div class="col-md">${adminMember.id}</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">Password</div>
          <div class="col-md">${adminMember.pwd}</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">Name</div>
          <div class="col-md">${adminMember.name}</div>
        </div>

        <div class="row">
          <div class="col-md-2 textbold">NickName</div>
          <div class="col-md">${adminMember.nickname}</div>
        </div>

        <div class="row">
          <div class="col-md-2 textbold">Registration Date</div>
          <div class="col-md">${adminMember.creDate}</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">Date of birth</div>
          <div class="col-md">${adminMember.birth}</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">Gender</div>
          <div class="col-md">${adminMember.gender}</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">Email</div>
          <div class="col-md">${adminMember.email}</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">Phone Number</div>
          <div class="col-md">${adminMember.phone}</div>
        </div>
        <div class="row">
          <div class="col-md-2 textbold">Consent to receive</div>
          <div class="col-md">
            <input
              type="checkbox"
              id="emailCheckbox"
              value="${adminMember.email_agreement}"
              disabled
            />
            Email &nbsp;
            <input
              type="checkbox"
              id="smsCheckbox"
              value="${adminMember.sms_agreement}"
              disabled
            />
            SMS
          </div>
        </div>
      </div>
      <hr class="line-black" />
      <div style="float: right">
        <button
          class="btn-tolist"
          onclick="location.href='${contextPath}/admin/member/adminMemberList.do'"
        >
          Back to list
        </button>
      </div>
    </section>
  </body>

  <!-- 수신동의여부 체크 -->
  <script>
    var emailValue = "${adminMember.email_agreement}";
    var smsValue = "${adminMember.sms_agreement}";

    if (emailValue === "yes") {
      document.getElementById("emailCheckbox").checked = true;
    }

    if (smsValue === "yes") {
      document.getElementById("smsCheckbox").checked = true;
    }
  </script>
</html>
