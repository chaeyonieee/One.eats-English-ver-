<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib prefix ="fmt" uri
="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix ="c" uri
="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
       .css-select {
    flex: 1 1 0%;
    font-weight: 500;
    color: rgb(51, 51, 51);
    line-height: 1.36;
    display: -webkit-box;
    overflow: hidden;
    word-break: break-all;
    white-space: normal;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
}

.css-address {
    flex: 1 1 0%;
    font-weight: 500;
    color: rgb(51, 51, 51);
    line-height: 1.36;
    display: -webkit-box;
    overflow: hidden;
    word-break: break-all;
    white-space: normal;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
}

.css-1ccl3pq {
    display: flex;
    padding-top: 6px;
    flex-direction: row;
    color: rgb(0, 0, 0);
    line-height: 20px;
}

.css-1fttcpj {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-flex-direction: column;
    -ms-flex-direction: column;
    flex-direction: column;
}
.div-p {
    padding: 0 12px;
}
      


.img-01 {
        width: 120px;
        height: 120px;
        margin-left: 40px;
        background-color: rgb(245, 245, 245);
      }
.booktext{
  width:200px;
}

.book{
  width:300px;
}
.bookserve{
  width:80px; 
  height:29px; 
  margin-bottom: 5px;
}

    </style>
    </head>
    <body>
  
    <div class="div-p ">
        <br>
        <p class=" textsize-2 text-left textcolor-black textbold">Wish List Product &nbsp <span class ="textsize-1 textcolor-lightgray">History of wishlist Products.</span></p>
    <hr class="linebold">
    <br>
    
      <c:forEach var="item" items="${bookList}" varStatus="status">
        <table>
      <tr>
        <td>
          <a href="${contextPath}/goods/goodsDetail.do?goodsNo=${item.goodsNo}">
          <img
              class="img-01"
              src="${contextPath}/download.do?imageFileName=${item.img1}&path=goodsNo${item.goodsNo}"
              alt="Product 이미지"
            /></a>
        </td>
        <td class ="booktext text-center" >
          <a href="${contextPath}/goods/goodsDetail.do?goodsNo=${item.goodsNo}">${item.name}</a>
         <br>
         <span class = "textsize-1">${item.price}yen</span>
        </td>
        <td>
          <div class=" book text-right">
            <button type="button" class =" bookserve bg-lightgreen textsize-1 border-0 margin btn-round" onclick='fn_addCartOneItem("${contextPath}","${item.goodsNo}")'>Cart</button>
            <br>
            <button type="button" onclick="location.href='${contextPath}/mypage/deleteBook.do?goodsNo=${item.goodsNo}'" class ="bookserve bg-lightgreen textsize-1 border-0 margin btn-round">Delete</button>
          </div>
        </td>
      </tr>
    </table>
    <hr>
      </c:forEach>
   
    <div>
      <ul class="ul-li">
        <c:if test="${section>1}">
          <li class="li-btn">
            <a
              href="${contextPath}/mypage/mypageBookmarkList.do?section=${section-1}&pageNum=1"
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
          value="${Math.ceil((totalBookListNum - (section-1)*100) div 10)}"
        />
        <c:if test="${end>10}">
          <c:set var="end" value="10" />
        </c:if>
        <c:forEach begin="1" end="${end}" var="i">
          <li class="li-btn">
            <a
              href="${contextPath}/mypage/mypageBookmarkList.do?section=${section}&pageNum=${i}"
              class="btn-2 btn-square bg-white btn-border"
              >${((section-1)*10)+i}</a
            >
          </li>
        </c:forEach>
        <c:if test="${section*100<totalBookListNum}">
          <li class="li-btn">
            <a
              href="${contextPath}/mypage/mypageBookmarkList.do?section=${section+1}&pageNum=1"
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
    <br><br>
  </body>
</html>
