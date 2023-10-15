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
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css"
    />
<link rel="stylesheet" href="${contextPath}/css/mina.css">
<meta charset="UTF-8">

<title>Login page</title>
    // <!-- next 주소 api 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function execDaumPostCode_() {
    new daum.Postcode({
      oncomplete: function (data) {
        var addr = ""; // 주소 변수
        var extraAddr = ""; // Additional Information 변수

        if (data.userSelectedType === "R") {
          addr = data.roadAddress;
        } else {
          addr = data.jibunAddress;
        }

        if (data.userSelectedType === "R") {
          if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }

          if (data.buildingName !== "" && data.apartment === "Y") {
            extraAddr +=
              extraAddr !== ""
                ? ", " + data.buildingName
                : data.buildingName;
          }

          if (extraAddr !== "") {
            extraAddr = " (" + extraAddr + ")";
          }

          document.getElementById("address_extra_input").value = extraAddr; //Additional Information
        } else {
          document.getElementById("address_extra_input").value = "";
        }

        document.getElementById("h_input_zipcode").value = data.zonecode; // 우편번호
        document.getElementById("address_input").value = addr;

        document.getElementById("address_detail_input").focus(); // 상세주소
      },
    }).open();
  }
 // next 주소 api 스크립트 종료
</script>

<style>
.login-main{
    align-items: center;
    width: 390px;
    height:auto;
}
.adressreload{
    width: 209px;
    height: 50px;
}
.circle{
    display: inline-block; /* 영역적용가능해짐 */
    width: 20px; height: 20px;
    border: 2px solid #a3d060;
    box-sizing: border-box;
    border-radius: 10px; /* 모서리둥글게 처리 */
    position: relative; top: 4px;
    cursor: pointer; /* 마우스 올렸을때 손모Amount 처리 */
}
.circle:after{
    content: '\2714'; /* 체크박스 특수문자 */
    font-size: 20px; color: #a3d060;
    position: absolute; top: -14px; left: 0;
    opacity: 0; /* 처음엔 안보이게 처리 */
    transition: 0.2s; /* CSS변화에 시간차 처리 */
}

/* input이 체크되면 특수문자 보이게 처리 */
#chk:checked + .circle:after{ opacity: 1; }

/* 체크박스는 display:none;을 주면 데이터 처리가 안됨 */
#chk{ position: absolute; left: -999em; }

</style>

</head>
<body>
    <form method = "post" action = "${contextPath}/loginForm.do">
        <br>
        
        <div class="main-container">
            <div class="main-wrap">
                
                
                <input class =" brd-lightgray btn-round adressreload textsize-1  border-0.5" name = "address" type="text"></input>
                    <button style = "margin-bottom: 4px; margin-top:0%" class = "btn-fatfat-mina bg-lightgreen textbold textsize-0 border-0 margin1 btn-round" onclick="execDaumPostCode_()">
                        Search Address
                    </button>
                    <br>
                    <input style ="width: 286px; height:50px " id="address_extra_input" class="brd-lightgray margin1 btn-round btn-midlong-address textsize-1 " name = "address_detail" placeholder="Please enter the detailed address." type="text"></input>
                    <br>
                    <input type="hidden" id="h_input_zipcode" placeholder="zipCode"name="zipCode"/>
                    
                    <div class="idselect" style="width: 282px; height: 50px;">
                        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<label for="chk" >
                            <label for="chk">
                                <input type="checkbox" id="chk">
                                <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                <i class="circle"></i>
                                <span class="textsize-0">Save as Default Order Address</span>
                            </label>
                    </div>
                    <br>
                    <br>
                    <button type ="submit" class = "btn-midlong bg-lightgreen margin textsize-2 border-0 btn-round">
                        Saving
                    </button>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    
            </div>
        </div>
</body>
</html>
<table>

</table>
</form>
</body>
</html>