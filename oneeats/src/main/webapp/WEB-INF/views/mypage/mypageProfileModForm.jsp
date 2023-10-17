<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
      isELIgnored="false"%>       
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var = "contextPath" value= "${pageContext.request.contextPath}" />
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${contextPath}/css/mina.css">
<meta charset="UTF-8">
<script type="text/javascript">
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $("#profileImg_preview").attr("src", e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
      }
    }
  </script>
<title>Edit the profile</title>
<style>



</style>

</head>
<body>
    <form action="${contextPath}/mypage/mypageintro.do" method="post" enctype="multipart/form-data">
    <div class="content-area">
        <div class="profile-edit-box">
            <div class="profile-edit-header">
                <h4>Edit the profile</h4>
                <p class="align-right-header-font">You can click on the profile picture to change the photo.</p>
                <hr>
                <br>
            </div>
            <div class="profile-edit-main ">
                <div class="profile-edit-img-div ">
                    
                    <c:choose>
				<c:when test="${myList.profileImg==null}">
					<img id="profileImg_preview" src= "${contextPath}/img/icon/profile.png" class="brd-lightgray btn-round imgsize-square2" >
                    <input type="file" name="profileImg" onchange="readURL(this);"><br>
                    
				</c:when>
				<c:otherwise>
                    <img id="profileImg_preview" class="brd-lightgray btn-round imgsize-square2" src="${contextPath}/download.do?imageFileName=${myList.profileImg}&path=member/${myList.memberNo}" alt="프로필사진">
                    <input  type="file"  name="profileImg" onchange="readURL(this);" ><br>
				</c:otherwise>
			</c:choose>
        </div>

                
                <div class="profile-edit-content">
                    <form class="profile-edit-form" action="#" method="post">
                        <input type="hidden" value="#" name="id">
                        <br>
                        <p>
                            <label>NickName </label><br>
                            <input type="text" name="nickname"  class ="btn-round" value="${myList.nickname}">
                        </p>
                        <p>
                            <label>Introduction</label><br>
                            <textarea  class ="profileintroduce brd-lightgray btn-round textsize-2" name="intro" id="introduce" cols="30" rows="5" >${myList.intro}</textarea>
                        </p>
                        <br>
                        <p>
                            <button type="reset" class="btn-midlong_2 textsize-1 textbold input btn-round border-0">Cancle</button>
                            <button type="submit" class="btn-midlong_2 textsize-1 bg-lightgreen textbold input btn-round border-0">Save</button>
                        </p>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
</html>