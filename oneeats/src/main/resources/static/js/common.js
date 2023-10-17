$(document).ready(function() {

	$('.modal-overlay').click(function(e) {
		if ($(e.target).hasClass('modal-overlay')) {
			closeModal();
		}
	});


	// Menu를 토글하기 위한 코드
	// .toggle-btn을 클릭하면 그것의 형제 요소인 .toggle-content가 나타나거나 사라짐.
	$('.toggle-content').hide();
	$('.toggle-btn').click(function() {
		$(this).parent().find('.toggle-content').slideToggle();
	});


	// 이미지 클릭했을 때 확대하기 위한 js 코드
	// overlay_gray 클래스인 요소를 문서에 추가해둔 후 expand_img 클래스가 붙은 이미지를 클릭했을 때 표시되도록 함.
	var overlayDiv = $('<div class="overlay_gray"></div>');
	$('body').append(overlayDiv);

	$(document).on("click", '.expand_img', function() {
		if ($(this).hasClass('clicked')) {
			$(this).removeClass('clicked');
			$('.overlay_gray').hide();
		} else {
			$('.overlay_gray').show();
			$(this).addClass('clicked');
		}
	});
	
	
	$(document).on("click",'.overlay_gray',function(){
		$('.expand_img.clicked').removeClass('clicked');
		$("#sidebar-left.opened").removeClass("opened");
		
		$('.overlay_gray').hide();
	});
	
	
});


function fn_openSideBar(){
	if($("#sidebar-left").hasClass("opened")){
		$("#sidebar-left").removeClass("opened");
		$('.overlay_gray').hide();
	} else{
		$("#sidebar-left").addClass("opened");
		$('.overlay_gray').show();
	}
	
}


function closeModal() {
	$('.modal-overlay').fadeOut(300);
	$('.modal-content').fadeOut(300);
}


// 알림창을 표시하는 코드.
// msg에 알림창에 나타낼 메시지, 알림창에서 Confirm을 눌렀을 때 이동할 페이지를 url에 씀.
// 만약 fun에 함수를 넣으면 알림창에서 Confirm을 눌렀을 때 fun(url) 이 실행됨.
// 사용예시 : <button onclick='fn_openalert("테스트 알림창 입니다.<br>여기에 메시지를 넣어주세요.","${contextPath}/home.do")' type=button >알림창 띄우기</button>
function fn_openalert(msg, url, fun) {
	console.log("fn_openalert 실행 " + msg  + " " + url + " " + fun);
	$("#alert_message").html(msg);
	$('.modal-overlay').fadeIn(300);
	$('.modal-content').fadeIn(300);
	if  (fun === undefined) {
		$('#confirm-button').removeAttr("onclick");
		$('#confirm-button').attr("onclick", "location.href='" + url + "';");
	} else {
		$('#confirm-button').on('click', function() {
			fun(url);
		});
	}

}

function fn_show(num) {
	
	
	$(".hidden_content_" + num).slideToggle();
}





// goodsNo을 주면 해당하는 Product을 찜하는 함수. Login이 되어 있지 않으면 알림창을 띄움.
function fn_bookmark(contextPath,goodsNo) {
	$.ajax({
		type: "POST",
		url: contextPath+"/goods/bookmark.do",
		data: {
			num: goodsNo,
		},
		success: function(response) {
			if (response == "success") {
				alert("찜 했습니다.");
			} else if (response == "login") {
				fn_openalert(
					"Login is required. <br> Would you like to go to the Login page?",
					contextPath+"/member/loginForm.do"
				);
			} else if(response=="duplicated"){
				alert("이미 찜한 Product입니다.");
			} else {
				alert("에러가 일어나 찜하지 못 했습니다.");
			}
		},
		error: function(response) {
			alert("An error of unknown cause");
			console.log(response);
		},
	});
}


// Product List 페이지에서 Product을 카트에 첫번째 옵션으로 추가
function fn_addCartOneItem(contextPath,num) {
	$.ajax({
		type: "POST",
		url: contextPath+"/addCartItem.do",
		data: {num:num},
		success: function(response) {
			if (response == "success") {
				fn_openalert(
					"Added to your cart. Would you like to go to the cart?",
					contextPath+"/main/cart.do"
				);
			} else {
				alert("Unable to add to the cart.");
			}
		},
		error: function(response) {
			alert("An error of unknown cause");
			console.log(response);
		},
	});

}

function fn_addCartOneOption(contextPath,optionNo){
	$.ajax({
		type: "POST",
		url: contextPath+"/addCartOption.do",
		data: {optionNo:optionNo},
		success: function(response) {
			if (response == "success") {
				fn_openalert(
					"Added to your cart. Would you like to go to the cart?",
					contextPath+"/main/cart.do"
				);
			} else {
				alert("Unable to add to the cart.");
			}
		},
		error: function(response) {
			alert("An error of unknown cause");
			console.log(response);
		},
	});
}