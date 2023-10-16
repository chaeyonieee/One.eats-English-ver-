$(document).ready(function() {
	// submit 전에 필수 agree to the Terms 체크 검증, check_map에서 각 항목 유효성 검증되었는지
	$("#registerForm").submit(function(event) {
		event.preventDefault();

		for (let [key, value] of check_map) {
			console.log(key, value);
			if (value == false) {
				if (key == "id") {
					alert("Please confirm the ID duplication.");
				} else if (key == "pwd") {
					alert("Please enter the correct Password.");
					$("#pwd").focus();
				} else if (key == "pwd_confirm") {
					alert("Please enter the Confirm Password.");
				} else if (key == "busNo") {
					alert("Please verify your Business Number.");
				} else if (key == "phone") {
					alert("Please verify your Phone Number.");
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
			changeMessage("name", "Please enter your Name", "red");
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
		changeMessage("id", "ID must be at least 4 characters long.", "red");
	} else if (regex.test(idString)) {
		changeMessage(
			"id",
			"ID can only contain letters and numbers",
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
					changeMessage("id", "This ID is available for use..", "blue");
					check_map.set("id", true);
					console.log(check_map);
				} else if (data == "fail") {
					changeMessage("id", "This ID is already in use..", "red");
				} else {
					changeMessage("id", "An error of unknown cause occurred", "red");
				}
			},
			error: function(xhr, status, error) {
				alert("Error occurred");
			},
			complete: function(data) {
				// alert("The process has been successfully completed.");
			},
		});
	}
}

function fn_phone_inzung() {
	var inzung_time = new Date($("#inzung_time").val());
	var current_time = new Date();
	var remainingTime = inzung_time.getTime() - current_time.getTime();
	if (remainingTime < 0) {
		alert("The validity period has expired. Please request again.");
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
			// alert("The process has been successfully completed.");
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
					changeMessage("inzung", "We have sent the verification code.", "blue");
				} else if (data == "fail") {
					changeMessage("inzung", "Unable to send the verification code.", "red");
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
