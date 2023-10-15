// textarea에 입력한 Content의 줄바꿈 표시를 바꿔서 input에 넣어주는 코드
$(document).ready(function() {
	var textareaInput = $(".s_textarea").val();
	var output = textareaInput.replace(/\n/g, "<br>");
	var input = textareaInput.replace(/<br>/g, "\n");
	$(".s_textarea").val(input);
	$("#h_input").val(output);

	$(".s_textarea").on("input", function() {
		var textareaInput = $(this).val();
		var output = textareaInput.replace(/\n/g, "<br>");
		$("#h_input").val(output);
	});
});