$(document).ready(function() {
	// Select the select tag
	var selectTag = $("#select_option");

	// Select the div.rows
	var rowsDiv = $("div.goods_option_rows");

	// Attach the change event handler to the select tag
	selectTag.on("change", function() {
		// Get the selected value
		var selectedOptionNo = $(this).val();
		if(selectedOptionNo!="0"){
			var selectedOptionPrice = parseFloat($(".h_option_price_" + selectedOptionNo).val());
			var selectedOptionName = $(".h_option_name_" + selectedOptionNo).val();
			
			var payment_price = parseFloat($("#h_payment_price").val());
			var goodsPrice = parseFloat($("#h_goods_price").val()); // Make sure to parse the goods price as a float
			selectedOptionPrice = selectedOptionPrice.toFixed(2); // Format the selected option price to two decimal places
			
			var discount_price = parseFloat($("#h_discount_price").val());
			var option_qty = parseFloat($(".h_option_qty_" + selectedOptionNo).val()); // Make sure to parse the option quantity as a float

			// Update displayed product price and discount price
			$("#h_payment_price").val((payment_price + goodsPrice * option_qty).toFixed(2));
			$("#payment_price").text((payment_price + goodsPrice * option_qty).toFixed(2));
			$("#h_discount_price").val(
				(discount_price + (goodsPrice * option_qty - selectedOptionPrice)).toFixed(2)
			);
			$("#discount_price").text(
				(discount_price + (goodsPrice * option_qty - selectedOptionPrice)).toFixed(2)
			);
			
			changeTotalValue();

			// Create a new row
			var newRow =
				`<dl class="property-flex2 goods_option_row">
				<!-- Your HTML for the new row -->
				</dl>
			`;

			// Add the new row
			rowsDiv.append(newRow);
		}
	});

	// Rest of your code...
});


// ajax로 카트 정보를 저장
function fn_toCart() {

	var formData = $("#optionForm").serialize();

	$.ajax({
		type: "POST",
		url: storeValueUrl,
		data: formData,
		success: function(response) {
			if (response == "success") {
				fn_openalert(
					"장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?",
					cartPage
				);
			} else {
				alert("장바구니에 담지 못 했습니다.");
			}
		},
		error: function(response) {
			alert("An error of unknown cause");
			console.log(response);
		},
	});

}

$(document).on("click", ".goods_option_plus_btn", function() {
	
	
	
	var goodsOptionVar = $(this).parent().find(".goodsQty_input").val();
	var changedVar = parseInt(goodsOptionVar) + 1;
	var parentRow = $(this).closest(".goods_option_row");
	
	var selectedOptionNo = parentRow.find(".h_optionNo").val();
	var option_qty = parseInt(
			$(".h_option_qty_" + selectedOptionNo).val()
		);
	option_qty = parseInt(option_qty);
	
	
	
	if (changedVar < 100) {
		$(this).parent().find(".goodsQty_input").val(changedVar);
		var discount_plus = parentRow.find(".h_option_discount").val();
		discount_plus = parseInt(discount_plus);
		changeDiscountValue(discount_plus);
		var payment_plus = goodsPrice;
		payment_plus = parseInt(payment_plus)*option_qty;
		changePaymentValue(payment_plus);
		changeTotalValue();
	}
});

$(document).on("click", ".goods_option_minus_btn", function() {
	var goodsOptionVar = $(this).parent().find(".goodsQty_input").val();
	var changedVar = parseInt(goodsOptionVar) - 1;
	var parentRow = $(this).closest(".goods_option_row");
	
	var selectedOptionNo = parentRow.find(".h_optionNo").val();
	var option_qty = parseInt(
			$(".h_option_qty_" + selectedOptionNo).val()
		);
	option_qty = parseInt(option_qty);
	
	
	if (changedVar > 0) {
		$(this).parent().find(".goodsQty_input").val(changedVar);
		var discount_plus = parentRow.find(".h_option_discount").val();
		discount_plus = parseInt(discount_plus);
		changeDiscountValue(-discount_plus);
		var payment_plus = goodsPrice;
		payment_plus = parseInt(payment_plus)*option_qty;
		changePaymentValue(-payment_plus);
		changeTotalValue();
	}
});

$(document).on("click", ".goods_option_x_btn", function() {
	var parentRow = $(this).closest(".goods_option_row");
	var qty = parentRow.find(".goodsQty_input").val();
	qty = parseInt(qty);
	var discount_plus = parentRow.find(".h_option_discount").val();
	var selectedOptionNo = parentRow.find(".h_optionNo").val();
	var option_qty = parseInt(
			$(".h_option_qty_" + selectedOptionNo).val()
		);
	discount_plus = parseInt(discount_plus);
	changeDiscountValue(-discount_plus * qty);
	var payment_plus = goodsPrice;
	payment_plus = parseInt(payment_plus)*option_qty;
	changePaymentValue(-payment_plus * qty);
	changeTotalValue();
	parentRow.remove();
	
});
function changePaymentValue(num) {
	var payment_price = parseInt($("#h_payment_price").val());
	$("#h_payment_price").val(payment_price + num);

	$("#payment_price").text(payment_price + num);
}

function changeDiscountValue(num) {
	var discount_price = parseInt($("#h_discount_price").val());
	$("#h_discount_price").val(discount_price + num);
	
	$("#discount_price").text(discount_price + num);
}

function changeTotalValue() {
	var payment_price = parseInt($("#h_payment_price").val());
	var discount_price = parseInt($("#h_discount_price").val());
	$("#t_price").text(payment_price - discount_price);
}
