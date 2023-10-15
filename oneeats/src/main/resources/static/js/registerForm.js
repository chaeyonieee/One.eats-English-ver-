$(document).ready(function() {
	// submit 전에 필수 agree to the Terms 체크 검증, check_map에서 각 항목 유효성 검증되었는지
	$("#registerForm").submit(function(event) {
		event.preventDefault();

		for (let [key, value] of check_map) {
			console.log(key, value);
			if (value == false) {
				if (key == "id") {
					alert("ID Duplicate Confirmation을 해주세요.");
				} else if (key == "pwd") {
					alert("올바른 Password를 입력해주세요.");
					$("#pwd").focus();
				} else if (key == "pwd_confirm") {
					alert("Password Confirm을 입력해주세요.");
				} else if (key == "busNo") {
					alert("Business Number 인증을 해주세요.");
				} else if (key == "phone") {
					alert("Phone Number번호 인증을 해주세요.");
				} else {
					alert("Please re-enter.");
					$("#" + key).focus();
				}
				return false;
			}
		}

		var checkboxes = $(".req_checkbox");
		var allChecked = true;
		for (var checkbox of checkboxes) {
			if (!$(checkbox).is(":checked")) {
				allChecked = false;
				$(checkbox).focus();
				break; // Exit the loop
			}
		}
		if (!allChecked) {
			alert("Please agree to the mandatory terms and conditions.");
			return false;
		}

		$(this).unbind("submit").submit();
	});

	// Password가 Password Confirm과 같은지, 올바른 입력인지 검증
	$("#pwd").on("input", function() {
		var puttedText = $(this).val();
		pwd_input_text = puttedText;
		var regex = /[^a-zA-Z0-9!@#$%^&*()]/;
		var regex2 = /^(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).+$/;
		if (puttedText.length < 8) {
			changeMessage("pwd", "Password is too short.", "red");
		} else if (puttedText.length > 12) {
			changeMessage("pwd", "Password is too long.", "red");
		} else if (regex.test(puttedText)) {
			changeMessage(
				"pwd",
				"Password can only contain letters, numbers, or special characters (!@#$%^&()).",
				"red"
			);
		} else if (!regex2.test(puttedText)) {
			changeMessage(
				"pwd",
				"Password must contain at least one letter, one number, and one special character.",
				"red"
			);
		} else {
			if (pwd_check_text != "-1" && pwd_check_text != puttedText) {
				changeMessage(
					"pwd_confirm",
					"Passwords do not match.",
					"red"
				);
				check_map.set("pwd_confirm", false);
			} else {
				changeMessage("pwd_confirm", "", "blue");
				check_map.set("pwd_confirm", true);
			}
			changeMessage("pwd", "", "blue");
			check_map.set("pwd", true);
		}
	});

	$("#pwd_confirm").on("input", function() {
		var puttedText = $(this).val();
		var regex = /[^a-zA-Z0-9!@#~]/;
		pwd_check_text = puttedText;
		if (puttedText != pwd_input_text) {
			changeMessage(
				"pwd_confirm",
				"Passwords do not match.",
				"red"
			);
			check_map.set("pwd_confirm", false);
		} else {
			changeMessage("pwd_confirm", "", "blue");
			check_map.set("pwd_confirm", true);
		}
	});

	$("input[name=name]").on("input", function() {
		var puttedText = $(this).val();
		if (puttedText.length < 1) {
			changeMessage("name", "Name을 입력해주세요", "red");
		} else {
			changeMessage("name", "", "blue");
		}
	});

	$("#allcheck").change(function() {
		if ($(this).is(":checked")) {
			$(".check_box").prop("checked", true);
		} else {
			$(".check_box").prop("checked", false);
		}
	});

	$("input[name=id]").on("input", function() {
		check_map.set("id", false);

	});
});

// ID 중복 검증
function checkDuplicateId() {
	var idString = $("input[name=id]").val();
	var regex = /[^a-zA-Z0-9]/;
	if (idString.length < 1) {
		changeMessage("id", "Please enter your ID", "red");
	} else if (idString.length < 4) {
		changeMessage("id", "ID는 최소 4글자 이상이어야 합니다.", "red");
	} else if (regex.test(idString)) {
		changeMessage(
			"id",
			"ID에는 알파벳과 숫자만 쓸 수 있습니다.",
			"red"
		);
	} else {
		var path = contextPath + "/checkDuplicatedId.do";
		$.ajax({
			type: "post",
			async: true,
			dataType: "text",
			data: {
				id: idString,
			},
			url: path,
			success: function(data, textStatus) {
				if (data == "success") {
					changeMessage("id", "사용할 수 있는 ID입니다.", "blue");
					check_map.set("id", true);
					console.log(check_map);
				} else if (data == "fail") {
					changeMessage("id", "이미 사용중인 ID입니다.", "red");
				} else {
					changeMessage("id", "An error of unknown cause occurred", "red");
				}
			},
			error: function(xhr, status, error) {
				alert("Error occurred");
			},
			complete: function(data) {
				// alert("성공적으로 처리되었습니다.");
			},
		});
	}
}

function fn_phone_inzung() {
	var inzung_time = new Date($("#inzung_time").val());
	var current_time = new Date();
	var remainingTime = inzung_time.getTime() - current_time.getTime();
	if (remainingTime < 0) {
		alert("유효시간이 지났습니다. 다시 요청해주세요.");
		return false;
	}

	var inzung_bunho = $("#inzung").val();

	$.ajax({
		type: "post",
		async: true,
		dataType: "text",
		data: {
			bunho: inzung_bunho,
		},
		url: contextPath + "/phoneInzung.do",
		success: function(data, textStatus) {
			if (data == "success") {
				changeMessage("inzung", "You have been verified.", "blue");
				check_map.set("phone", true);
				$("#phone").attr("readonly", "readonly");
				$("#inzung").attr("readonly", "readonly");
				clearInterval(inzung_interval_id);
			} else if (data == "fail") {
				changeMessage("inzung", "Not authenticated.", "red");
			} else {
				changeMessage("inzung", "An error of unknown cause occurred", "red");
			}
		},
		error: function(xhr, status, error) {
			alert("Error occurred");
		},
		complete: function(data) {
			// alert("성공적으로 처리되었습니다.");
		},
	});
}

function fn_open_inzung_row() {
	var phone_text = $("input[name=phone]").val();
	var regex = /[^a-zA-Z0-9]/;
	phone_text = phone_text.replace(/-/g, "");

	if (phone_text.length < 8 || regex.test(phone_text)) {
		alert("Please enter a phone number");
		$("input[name=phone]").focus();
	} else {
		$("input[name=phone]").val(phone_text);


		$.ajax({
			type: "post",
			async: true,
			dataType: "text",
			data: {
				toNumber: phone_text,
			},
			url: contextPath + "/sms/sendInzungSMS.do",
			success: function(data, textStatus) {
				if (data == "success") {
					changeMessage("inzung", "verification code를 보냈습니다.", "blue");
				} else if (data == "fail") {
					changeMessage("inzung", "verification code를 보낼 수 없었습니다.", "red");
				} else {
					changeMessage("inzung", "An error of unknown cause occurred", "red");
				}
			},
			error: function(xhr, status, error) {
				alert("Error occurred");
			},

		});


		$(".inzung_row").show();
		var date = new Date();
		date.setMinutes(date.getMinutes() + 5);
		$("#inzung_time").val(date);
		$("#phone_inzung_time_text").text("5:00");
		inzung_interval_id = setInterval(fn_update_inzung_time, 1000);
		setTimeout(function() {
			clearInterval(inzung_interval_id);
		}, 300000);
	}
}

function changeMessage(elname, str, clr) {
	$("#errmsg_" + elname).removeClass();
	$("#errmsg_" + elname).addClass(clr + "Text");
	if (str.length < 1) {
		$("#errmsg_" + elname).html("&nbsp;");
	} else {
		$("#errmsg_" + elname).text(str);
	}
}

function fn_update_inzung_time() {
	var inzung_time = new Date($("#inzung_time").val());
	var current_time = new Date();

	var remainingTime = inzung_time.getTime() - current_time.getTime();

	var remainingMinutes = Math.floor(
		(remainingTime % (1000 * 60 * 60)) / (1000 * 60)
	);
	var remainingSeconds = Math.floor((remainingTime % (1000 * 60)) / 1000);



	if (remainingSeconds < 10) {
		remainingSeconds = "0" + remainingSeconds;
	}
	var dateText =
		remainingMinutes +
		":" +
		remainingSeconds;
	$("#phone_inzung_time_text").text(dateText);

}
