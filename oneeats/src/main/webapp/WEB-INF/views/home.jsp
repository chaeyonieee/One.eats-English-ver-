<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <a href="${contextPath}/admin/main/adminMain.do">Admin 메인페이지로</a>
    <a href="${contextPath}/seller/main/sellerMain.do">Business 메인페이지로</a>
    <div class="bg-green">초록색 배경</div>
    <div class="bg-white">하얀색 배경</div>
    <div class="bg-lightgreen">연두 배경</div>
    <div class="bg-deepgray">진회색 배경</div>
    <div class="bg-lightgray">연회색 배경</div>
    <div class="bg-black">블랙 배경</div>
    <button class="bg-lightgreen btn-regular textcolor-white border-0">
     To Pay
    </button>
    <p>정사각 버튼</p>
    <button class="btn-squre">1</button>
    <br />
    <p>큰버튼</p>
    <button class="btn-big">1</button>
    <br />
    <p>보통 버튼</p>
    <button class="btn-regular">2</button>
    <br />
    <p>작은 버튼</p>
    <button class="btn-small">3</button>
    <br />
    <p>짧둥 버튼</p>
    <button class="btn-fat">4</button>
    <br />
    <p>더 짧둥 버튼</p>
    <button class="btn-fatfat">5</button>
    <br />
    <p>긴 버튼</p>
    <button class="btn-long">6</button>
    <br />
    <p>둥그런 버튼</p>
    <button class="btn-big btn-round bg-lightgreen">동글</button>

    <p>글씨 사이즈1</p>
    <p class="textsize-1">테스트용 문장입니다.</p>
    <br />
    <p>글씨 사이즈2</p>
    <p class="textsize-2">테스트용 문장입니다.</p>
    <br />
    <p>글씨 사이즈3</p>
    <p class="textsize-3">테스트용 문장입니다.</p>
    <br />
    <p>글씨 사이즈4</p>
    <p class="textsize-4">테스트용 문장입니다.</p>
    <br />
    <p>글씨 사이즈5</p>
    <p class="textsize-5">테스트용 문장입니다.</p>
    <br />
    <p>글씨 사이즈6</p>
    <p class="textsize-6">테스트용 문장입니다.</p>
    <br />

    <p>굵은 글씨</p>
    <p class="textbold textsize-4">굵은 문장</p>
    <br />
    <p>영어 폰트</p>
    <p class="text-eng">Hello! world!</p>
    <br />

    <p>한글 폰트</p>
    <p class="text-kr">안녕하세요</p>

    <br />

    <div style="background-color: #cccccc">
      <p class="textcolor-black">검은 글씨</p>
      <p class="textcolor-white">하얀 글씨</p>
      <p class="textcolor-red">빨간 글씨</p>
      <p class="textcolor-lightgreen">연두색 글씨</p>
      <p class="textcolor-green">초록색 글씨</p>
      <p class="textcolor-lightgray">연회색글씨</p>
    </div>
    <br />
    <div style="background-color: #cccccc">
      <p>정사각1</p>
      <img src="img/logo.png" alt="" class="imgsize-square1 border" />
      <br />
      <br />
      <p>정사각2</p>
      <img src="img/logo.png" alt="" class="imgsize-square2 border" />
      <br />
      <br />
      <p>정사각3</p>
      <img src="img/logo.png" alt="" class="imgsize-square3 border" />
      <br />
      <br />
      <p>정사각4</p>
      <img src="img/logo.png" alt="" class="imgsize-square4 border" />
      <br />
      <br />
      <p>긴 거</p>
      <img src="img/logo.png" alt="" class="imgsize-long border" />
      <br />
      <br />
      <p>배너</p>
      <img src="img/logo.png" alt="" class="imgsize-banner border" />
      <br />
      <br />
      <p>메인</p>
      <img src="img/logo.png" alt="" class="imgsize-main border" />
      <br />
      <br />
    </div>

    <div>
      <button
        class="open-alert"
        onclick="fn_openalert('테스트 알림<br>입니다!!!!!!','${contextPath}/home.do')"
      >
        알림창 띄워보기
      </button>
    </div>
  </body>
</html>
